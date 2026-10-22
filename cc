--[[
	CommandBar  |  LocalScript
	Put this in: StarterPlayer > StarterPlayerScripts

	Press ;  (semicolon) to open the bar at the bottom-middle of the screen.
	Enter = run | Esc = close | Tab = autocomplete | Up/Down = history

	Add your own commands at the bottom of the file:
		CommandBar:AddCommand({
			Name = "hello",
			Aliases = {"hi"},
			Description = "Says hello",
			Usage = "hello [name]",
			Callback = function(args, bar)
				bar:Notify("Hello " .. (args[1] or "world"))
			end,
		})
]]

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

--------------------------------------------------------------------
-- CONFIG
--------------------------------------------------------------------
local Config = {
	OpenKey = Enum.KeyCode.Semicolon,
	Prefix = "",            -- optional prefix required before commands (e.g. ";")
	Width = 420,
	Height = 38,
	BottomOffset = 30,
	MaxSuggestions = 5,
	HistorySize = 30,

	Colors = {
		Background = Color3.fromRGB(24, 24, 28),
		Stroke = Color3.fromRGB(70, 70, 80),
		Text = Color3.fromRGB(235, 235, 240),
		Placeholder = Color3.fromRGB(140, 140, 150),
		Accent = Color3.fromRGB(88, 140, 255),
		Success = Color3.fromRGB(80, 200, 120),
		Error = Color3.fromRGB(235, 90, 90),
	},
	Font = Enum.Font.GothamMedium,
}

--------------------------------------------------------------------
-- LIBRARY
--------------------------------------------------------------------
local CommandBar = {}
CommandBar.Commands = {}   -- [name] = commandTable
CommandBar.Lookup = {}     -- [name or alias] = commandTable
CommandBar.History = {}
CommandBar.IsOpen = false

local historyIndex = 0
local justOpened = false
local suggestions = {}

-- Helpers ------------------------------------------------------------
local function create(class, props, children)
	local inst = Instance.new(class)
	for k, v in pairs(props or {}) do
		inst[k] = v
	end
	for _, child in ipairs(children or {}) do
		child.Parent = inst
	end
	return inst
end

local function corner(r)
	return create("UICorner", { CornerRadius = UDim.new(0, r) })
end

local function stroke(color, thickness)
	return create("UIStroke", {
		Color = color,
		Thickness = thickness or 1,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
	})
end

-- Splits input into args, respecting "quoted strings"
local function parse(input)
	local args = {}
	local i = 1
	while i <= #input do
		local c = input:sub(i, i)
		if c:match("%s") then
			i += 1
		elseif c == '"' then
			local close = input:find('"', i + 1, true)
			if close then
				table.insert(args, input:sub(i + 1, close - 1))
				i = close + 1
			else
				table.insert(args, input:sub(i + 1))
				break
			end
		else
			local stop = input:find("%s", i) or (#input + 1)
			table.insert(args, input:sub(i, stop - 1))
			i = stop
		end
	end
	return args
end

-- UI -----------------------------------------------------------------
local gui = create("ScreenGui", {
	Name = "CommandBarGui",
	ResetOnSpawn = false,
	IgnoreGuiInset = true,
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
	DisplayOrder = 999,
	Parent = playerGui,
})

local container = create("Frame", {
	Name = "Container",
	AnchorPoint = Vector2.new(0.5, 1),
	Position = UDim2.new(0.5, 0, 1, Config.Height + 80),
	Size = UDim2.fromOffset(Config.Width, Config.Height),
	BackgroundTransparency = 1,
	Parent = gui,
})

local bar = create("Frame", {
	Name = "Bar",
	Size = UDim2.fromScale(1, 1),
	BackgroundColor3 = Config.Colors.Background,
	Parent = container,
}, { corner(10), stroke(Config.Colors.Stroke, 1.5) })

local barStroke = bar:FindFirstChildOfClass("UIStroke")

create("TextLabel", {
	Name = "Prompt",
	Size = UDim2.new(0, 28, 1, 0),
	Position = UDim2.fromOffset(6, 0),
	BackgroundTransparency = 1,
	Text = ">",
	TextColor3 = Config.Colors.Accent,
	Font = Enum.Font.GothamBold,
	TextSize = 18,
	Parent = bar,
})

local textBox = create("TextBox", {
	Name = "Input",
	Size = UDim2.new(1, -44, 1, 0),
	Position = UDim2.fromOffset(32, 0),
	BackgroundTransparency = 1,
	Text = "",
	PlaceholderText = "Enter a command...",
	PlaceholderColor3 = Config.Colors.Placeholder,
	TextColor3 = Config.Colors.Text,
	Font = Config.Font,
	TextSize = 16,
	TextXAlignment = Enum.TextXAlignment.Left,
	ClearTextOnFocus = false,
	Parent = bar,
})

-- Suggestion list (above the bar)
local suggestFrame = create("Frame", {
	Name = "Suggestions",
	AnchorPoint = Vector2.new(0, 1),
	Position = UDim2.new(0, 0, 0, -6),
	Size = UDim2.new(1, 0, 0, 0),
	BackgroundColor3 = Config.Colors.Background,
	Visible = false,
	ClipsDescendants = true,
	Parent = container,
}, {
	corner(10),
	stroke(Config.Colors.Stroke, 1),
	create("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
})

-- Toast notifications (above the suggestion list)
local toastHolder = create("Frame", {
	Name = "Toasts",
	AnchorPoint = Vector2.new(0.5, 1),
	Position = UDim2.new(0.5, 0, 1, -(Config.Height + Config.BottomOffset + 10)),
	Size = UDim2.fromOffset(Config.Width + 100, 300),
	BackgroundTransparency = 1,
	Parent = gui,
}, {
	create("UIListLayout", {
		VerticalAlignment = Enum.VerticalAlignment.Bottom,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		Padding = UDim.new(0, 6),
		SortOrder = Enum.SortOrder.LayoutOrder,
	}),
})

-- Notifications ------------------------------------------------------
function CommandBar:Notify(message, kind, duration)
	local color = Config.Colors.Accent
	if kind == "success" then
		color = Config.Colors.Success
	elseif kind == "error" then
		color = Config.Colors.Error
	end

	local label = create("TextLabel", {
		Size = UDim2.fromOffset(0, 30),
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundColor3 = Config.Colors.Background,
		BackgroundTransparency = 1,
		Text = "  " .. tostring(message) .. "  ",
		TextColor3 = Config.Colors.Text,
		TextTransparency = 1,
		Font = Config.Font,
		TextSize = 14,
		LayoutOrder = tick() * 1000 % 1e6,
		Parent = toastHolder,
	}, { corner(8), stroke(color, 1.5) })

	local s = label:FindFirstChildOfClass("UIStroke")
	s.Transparency = 1

	local fadeIn = TweenInfo.new(0.2)
	TweenService:Create(label, fadeIn, { BackgroundTransparency = 0.05, TextTransparency = 0 }):Play()
	TweenService:Create(s, fadeIn, { Transparency = 0 }):Play()

	task.delay(duration or 3, function()
		local fadeOut = TweenInfo.new(0.3)
		TweenService:Create(label, fadeOut, { BackgroundTransparency = 1, TextTransparency = 1 }):Play()
		local t = TweenService:Create(s, fadeOut, { Transparency = 1 })
		t:Play()
		t.Completed:Wait()
		label:Destroy()
	end)
end

-- Commands -----------------------------------------------------------
function CommandBar:AddCommand(cmd)
	assert(type(cmd.Name) == "string", "Command needs a Name")
	assert(type(cmd.Callback) == "function", "Command needs a Callback")

	local name = cmd.Name:lower()
	cmd.Name = name
	cmd.Aliases = cmd.Aliases or {}
	cmd.Description = cmd.Description or "No description"
	cmd.Usage = cmd.Usage or name

	self.Commands[name] = cmd
	self.Lookup[name] = cmd
	for _, alias in ipairs(cmd.Aliases) do
		self.Lookup[alias:lower()] = cmd
	end
end

function CommandBar:Execute(input)
	input = input:match("^%s*(.-)%s*$")
	if input == "" then
		return
	end

	-- history
	table.insert(self.History, 1, input)
	if #self.History > Config.HistorySize then
		table.remove(self.History)
	end

	-- prefix handling
	if Config.Prefix ~= "" then
		if input:sub(1, #Config.Prefix) ~= Config.Prefix then
			self:Notify("Commands must start with '" .. Config.Prefix .. "'", "error")
			return
		end
		input = input:sub(#Config.Prefix + 1)
	end

	local args = parse(input)
	local name = table.remove(args, 1)
	if not name then
		return
	end

	local cmd = self.Lookup[name:lower()]
	if not cmd then
		self:Notify("Unknown command: " .. name, "error")
		return
	end

	local ok, result = pcall(cmd.Callback, args, self)
	if not ok then
		self:Notify("Error: " .. tostring(result), "error", 4)
		warn("[CommandBar] " .. name .. " errored: " .. tostring(result))
	end
end

-- Suggestions --------------------------------------------------------
local function clearSuggestions()
	for _, child in ipairs(suggestFrame:GetChildren()) do
		if child:IsA("TextLabel") then
			child:Destroy()
		end
	end
end

local function updateSuggestions()
	clearSuggestions()
	suggestions = {}

	local text = textBox.Text
	if Config.Prefix ~= "" and text:sub(1, #Config.Prefix) == Config.Prefix then
		text = text:sub(#Config.Prefix + 1)
	end

	local typed = text:match("^(%S*)$") -- only suggest while typing the command name
	if not typed or typed == "" then
		suggestFrame.Visible = false
		return
	end
	typed = typed:lower()

	local seen = {}
	for key, cmd in pairs(CommandBar.Lookup) do
		if key:sub(1, #typed) == typed and not seen[cmd] then
			seen[cmd] = true
			table.insert(suggestions, cmd)
		end
	end
	table.sort(suggestions, function(a, b)
		return a.Name < b.Name
	end)

	local count = math.min(#suggestions, Config.MaxSuggestions)
	if count == 0 then
		suggestFrame.Visible = false
		return
	end

	for i = 1, count do
		local cmd = suggestions[i]
		create("TextLabel", {
			Size = UDim2.new(1, 0, 0, 26),
			BackgroundTransparency = 1,
			Text = ("   %s  -  %s"):format(cmd.Usage, cmd.Description),
			TextColor3 = i == 1 and Config.Colors.Accent or Config.Colors.Text,
			TextTransparency = i == 1 and 0 or 0.25,
			Font = Config.Font,
			TextSize = 13,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd,
			LayoutOrder = i,
			Parent = suggestFrame,
		})
	end

	suggestFrame.Size = UDim2.new(1, 0, 0, count * 26)
	suggestFrame.Visible = true
end

-- Open / Close -------------------------------------------------------
local openInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
local closeInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.In)

function CommandBar:Open()
	if self.IsOpen then
		return
	end
	self.IsOpen = true
	justOpened = true
	historyIndex = 0

	TweenService:Create(container, openInfo, {
		Position = UDim2.new(0.5, 0, 1, -Config.BottomOffset),
	}):Play()

	textBox.Text = ""
	textBox:CaptureFocus()
end

function CommandBar:Close()
	if not self.IsOpen then
		return
	end
	self.IsOpen = false

	if textBox:IsFocused() then
		textBox:ReleaseFocus()
	end
	textBox.Text = ""
	suggestFrame.Visible = false

	TweenService:Create(container, closeInfo, {
		Position = UDim2.new(0.5, 0, 1, Config.Height + 80),
	}):Play()
end

function CommandBar:Toggle()
	if self.IsOpen then
		self:Close()
	else
		self:Open()
	end
end

-- Events -------------------------------------------------------------
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	-- Open key (ignore if typing in some other textbox, e.g. chat)
	if input.KeyCode == Config.OpenKey and not CommandBar.IsOpen then
		if UserInputService:GetFocusedTextBox() == nil then
			CommandBar:Open()
		end
		return
	end

	if not CommandBar.IsOpen or not textBox:IsFocused() then
		return
	end

	if input.KeyCode == Enum.KeyCode.Tab then
		if suggestions[1] then
			textBox.Text = suggestions[1].Name .. " "
			textBox.CursorPosition = #textBox.Text + 1
		end
	elseif input.KeyCode == Enum.KeyCode.Up then
		if historyIndex < #CommandBar.History then
			historyIndex += 1
			textBox.Text = CommandBar.History[historyIndex]
			textBox.CursorPosition = #textBox.Text + 1
		end
	elseif input.KeyCode == Enum.KeyCode.Down then
		if historyIndex > 1 then
			historyIndex -= 1
			textBox.Text = CommandBar.History[historyIndex]
		else
			historyIndex = 0
			textBox.Text = ""
		end
		textBox.CursorPosition = #textBox.Text + 1
	elseif input.KeyCode == Enum.KeyCode.Escape then
		CommandBar:Close()
	end
end)

textBox:GetPropertyChangedSignal("Text"):Connect(function()
	-- Remove the ";" that gets typed when opening the bar
	if justOpened then
		justOpened = false
		if textBox.Text == ";" then
			textBox.Text = ""
			return
		end
	end

	-- Block Tab characters from appearing in the box
	if textBox.Text:find("\t") then
		textBox.Text = textBox.Text:gsub("\t", "")
	end

	updateSuggestions()
end)

textBox.Focused:Connect(function()
	TweenService:Create(barStroke, TweenInfo.new(0.15), { Color = Config.Colors.Accent }):Play()
end)

textBox.FocusLost:Connect(function(enterPressed)
	TweenService:Create(barStroke, TweenInfo.new(0.15), { Color = Config.Colors.Stroke }):Play()

	if enterPressed then
		local text = textBox.Text
		CommandBar:Close()
		CommandBar:Execute(text)
	elseif CommandBar.IsOpen then
		CommandBar:Close()
	end
end)

--------------------------------------------------------------------
-- BUILT-IN COMMANDS (edit / delete / add your own)
--------------------------------------------------------------------
local function getHumanoid()
	local char = player.Character
	return char and char:FindFirstChildOfClass("Humanoid")
end

CommandBar:AddCommand({
	Name = "help",
	Aliases = { "cmds", "commands" },
	Description = "Lists all commands",
	Callback = function(_, bar)
		local names = {}
		for name in pairs(bar.Commands) do
			table.insert(names, name)
		end
		table.sort(names)
		bar:Notify("Commands: " .. table.concat(names, ", "), "info", 6)
	end,
})

CommandBar:AddCommand({
	Name = "walkspeed",
	Aliases = { "ws", "speed" },
	Description = "Set your walk speed",
	Usage = "walkspeed <number>",
	Callback = function(args, bar)
		local value = tonumber(args[1])
		local hum = getHumanoid()
		if not value then
			return bar:Notify("Usage: walkspeed <number>", "error")
		end
		if hum then
			hum.WalkSpeed = value
			bar:Notify("WalkSpeed set to " .. value, "success")
		end
	end,
})

CommandBar:AddCommand({
	Name = "jumppower",
	Aliases = { "jp", "jump" },
	Description = "Set your jump power",
	Usage = "jumppower <number>",
	Callback = function(args, bar)
		local value = tonumber(args[1])
		local hum = getHumanoid()
		if not value then
			return bar:Notify("Usage: jumppower <number>", "error")
		end
		if hum then
			hum.UseJumpPower = true
			hum.JumpPower = value
			bar:Notify("JumpPower set to " .. value, "success")
		end
	end,
})

CommandBar:AddCommand({
	Name = "fov",
	Description = "Set your field of view",
	Usage = "fov <number>",
	Callback = function(args, bar)
		local value = tonumber(args[1])
		if not value then
			return bar:Notify("Usage: fov <number>", "error")
		end
		workspace.CurrentCamera.FieldOfView = math.clamp(value, 1, 120)
		bar:Notify("FOV set to " .. math.clamp(value, 1, 120), "success")
	end,
})

CommandBar:AddCommand({
	Name = "reset",
	Aliases = { "re", "respawn" },
	Description = "Reset your character",
	Callback = function(_, bar)
		local hum = getHumanoid()
		if hum then
			hum.Health = 0
			bar:Notify("Character reset", "success")
		end
	end,
})

CommandBar:AddCommand({
	Name = "say",
	Description = "Show a message in the notification area",
	Usage = "say <message>",
	Callback = function(args, bar)
		bar:Notify(table.concat(args, " "))
	end,
})

return CommandBar
