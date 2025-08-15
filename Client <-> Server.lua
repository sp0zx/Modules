local Module = {}

Module.ConnectServerToClient = function()
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local ServerScriptService = game:GetService("ServerScriptService")
	local ServerStorage = game:GetService("ServerStorage")
	local TextChatService = game:GetService("TextChatService")

	local ReplicatedSSS = TextChatService:WaitForChild("ServerReplication", math.huge)
	local RaptorsClub = ReplicatedSSS:WaitForChild("ServerScriptService", math.huge)
	local RaptorsClubs = ReplicatedSSS:WaitForChild("ServerStorage", math.huge)

	local function smartClone(source, target)
		if not source or not target then return end
		for _, obj in ipairs(target:GetChildren()) do
			obj:Destroy()
		end

		for _, obj in ipairs(source:GetChildren()) do
			local clone = obj:Clone()
			clone.Parent = target

			if clone:IsA("Script") or clone:IsA("LocalScript") then
				clone.Enabled = false
			elseif clone:IsA("Sound") then
				clone.Volume = 0
				clone.Playing = false
			end
		end
	end

	local queue = {}
	local function queueSync(key, fn)
		if not queue[key] then
			queue[key] = true
			task.delay(0.1, function()
				fn()
				queue[key] = nil
			end)
		end
	end

	smartClone(RaptorsClub, ServerScriptService)
	smartClone(RaptorsClubs, ServerStorage)

	RaptorsClub.DescendantAdded:Connect(function()
		queueSync("SSS", function()
			smartClone(RaptorsClub, ServerScriptService)
		end)
	end)

	RaptorsClub.DescendantRemoving:Connect(function()
		queueSync("SSS", function()
			smartClone(RaptorsClub, ServerScriptService)
		end)
	end)

	RaptorsClubs.DescendantAdded:Connect(function()
		queueSync("SS", function()
			smartClone(RaptorsClubs, ServerStorage)
		end)
	end)

	RaptorsClubs.DescendantRemoving:Connect(function()
		queueSync("SS", function()
			smartClone(RaptorsClubs, ServerStorage)
		end)
	end)
end

return Module
