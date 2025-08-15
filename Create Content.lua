local mod = {}

mod.LoadCons = function(par)
	-- Gui to Lua
	-- Version: 3.2

	-- Instances:

	local Cons = Instance.new("Frame")
	local TheOutput = Instance.new("ScrollingFrame")
	local UIListLayout = Instance.new("UIListLayout")
	local ScrollBar1 = Instance.new("Frame")
	local Left = Instance.new("ImageButton")
	local Arrow = Instance.new("Frame")
	local Frame = Instance.new("Frame")
	local Frame_2 = Instance.new("Frame")
	local Frame_3 = Instance.new("Frame")
	local Frame_4 = Instance.new("Frame")
	local Right = Instance.new("ImageButton")
	local Arrow_2 = Instance.new("Frame")
	local Frame_5 = Instance.new("Frame")
	local Frame_6 = Instance.new("Frame")
	local Frame_7 = Instance.new("Frame")
	local Frame_8 = Instance.new("Frame")
	local Frame_9 = Instance.new("Frame")
	local Frame_10 = Instance.new("Frame")
	local Markers = Instance.new("Frame")
	local ScrollBar = Instance.new("Frame")
	local Up = Instance.new("ImageButton")
	local Arrow_3 = Instance.new("Frame")
	local Frame_11 = Instance.new("Frame")
	local Frame_12 = Instance.new("Frame")
	local Frame_13 = Instance.new("Frame")
	local Frame_14 = Instance.new("Frame")
	local Down = Instance.new("ImageButton")
	local Arrow_4 = Instance.new("Frame")
	local Frame_15 = Instance.new("Frame")
	local Frame_16 = Instance.new("Frame")
	local Frame_17 = Instance.new("Frame")
	local Frame_18 = Instance.new("Frame")
	local Frame_19 = Instance.new("Frame")
	local Frame_20 = Instance.new("Frame")
	local Markers_2 = Instance.new("Frame")

	--Properties:

	Cons.Name = "Cons"
	Cons.Parent = par
	Cons.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
	Cons.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Cons.BorderSizePixel = 0
	Cons.Position = UDim2.new(0, 0, 0, 20)
	Cons.Size = UDim2.new(1, 0, 0.930000007, -20)
	Cons.Visible = true
	
	local Converted = {["_TextLabel"] = Instance.new("TextLabel");}
	Converted["_TextLabel"].Font = Enum.Font.SourceSans
	Converted["_TextLabel"].TextColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_TextLabel"].TextSize = 14
	Converted["_TextLabel"].RichText = true
	Converted["_TextLabel"].TextWrapped = true
	Converted["_TextLabel"].TextXAlignment = Enum.TextXAlignment.Left
	Converted["_TextLabel"].BackgroundColor3 = Color3.fromRGB(53.00000064074993, 141.0000067949295, 255)
	Converted["_TextLabel"].BackgroundTransparency = 1
	Converted["_TextLabel"].BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036)
	Converted["_TextLabel"].Position = UDim2.new(-0.144268721, 0, 0.000125626873, 0)
	Converted["_TextLabel"].Size = UDim2.new(0, 742, 0, 17)
	Converted["_TextLabel"].Visible = false
	Converted["_TextLabel"].Parent = Cons
	
	TheOutput.Name = "TheOutput"
	TheOutput.Parent = Cons
	TheOutput.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
	TheOutput.BackgroundTransparency = 1.000
	TheOutput.BorderColor3 = Color3.fromRGB(27, 42, 53)
	TheOutput.BorderSizePixel = 0
	TheOutput.Size = UDim2.new(0, 500, 0, 282)
	TheOutput.ZIndex = 20
	TheOutput.BottomImage = "rbxassetid://0"
	TheOutput.CanvasSize = UDim2.new(0, 718,0, 294)
	TheOutput.ScrollBarThickness = 16
	TheOutput.TopImage = "rbxassetid://0"
	TheOutput.ScrollBarImageColor3 = Color3.fromRGB(60, 60, 60)
	
	UIListLayout.Parent = TheOutput
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

	ScrollBar1.Name = "ScrollBar1"
	ScrollBar1.Parent = Cons
	ScrollBar1.Active = true
	ScrollBar1.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	ScrollBar1.BorderColor3 = Color3.fromRGB(27, 42, 53)
	ScrollBar1.BorderSizePixel = 0
	ScrollBar1.Position = UDim2.new(0, 0, 1, -16)
	ScrollBar1.Size = UDim2.new(0.967999995, 0, 0, 16)

	Left.Name = "Left"
	Left.Parent = ScrollBar1
	Left.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
	Left.BackgroundTransparency = 1.000
	Left.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Left.BorderSizePixel = 0
	Left.Size = UDim2.new(0, 16, 0, 16)
	Left.AutoButtonColor = false

	Arrow.Name = "Arrow"
	Arrow.Parent = Left
	Arrow.BackgroundTransparency = 1.000
	Arrow.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Arrow.Size = UDim2.new(0, 16, 0, 16)

	Frame.Parent = Arrow
	Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame.BackgroundTransparency = 0.500
	Frame.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(0, 6, 0, 8)
	Frame.Size = UDim2.new(0, 1, 0, 1)

	Frame_2.Parent = Arrow
	Frame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame_2.BackgroundTransparency = 0.500
	Frame_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Frame_2.BorderSizePixel = 0
	Frame_2.Position = UDim2.new(0, 7, 0, 7)
	Frame_2.Size = UDim2.new(0, 1, 0, 3)

	Frame_3.Parent = Arrow
	Frame_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame_3.BackgroundTransparency = 0.500
	Frame_3.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Frame_3.BorderSizePixel = 0
	Frame_3.Position = UDim2.new(0, 8, 0, 6)
	Frame_3.Size = UDim2.new(0, 1, 0, 5)

	Frame_4.Parent = Arrow
	Frame_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame_4.BackgroundTransparency = 0.500
	Frame_4.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Frame_4.BorderSizePixel = 0
	Frame_4.Position = UDim2.new(0, 9, 0, 5)
	Frame_4.Size = UDim2.new(0, 1, 0, 7)

	Right.Name = "Right"
	Right.Parent = ScrollBar1
	Right.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
	Right.BackgroundTransparency = 1.000
	Right.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Right.BorderSizePixel = 0
	Right.Position = UDim2.new(1, -16, 0, 0)
	Right.Size = UDim2.new(0, 16, 0, 16)
	Right.AutoButtonColor = false

	Arrow_2.Name = "Arrow"
	Arrow_2.Parent = Right
	Arrow_2.BackgroundTransparency = 1.000
	Arrow_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Arrow_2.Size = UDim2.new(0, 16, 0, 16)

	Frame_5.Parent = Arrow_2
	Frame_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame_5.BackgroundTransparency = 0.500
	Frame_5.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Frame_5.BorderSizePixel = 0
	Frame_5.Position = UDim2.new(0, 10, 0, 8)
	Frame_5.Size = UDim2.new(0, 1, 0, 1)

	Frame_6.Parent = Arrow_2
	Frame_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame_6.BackgroundTransparency = 0.500
	Frame_6.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Frame_6.BorderSizePixel = 0
	Frame_6.Position = UDim2.new(0, 9, 0, 7)
	Frame_6.Size = UDim2.new(0, 1, 0, 3)

	Frame_7.Parent = Arrow_2
	Frame_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame_7.BackgroundTransparency = 0.500
	Frame_7.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Frame_7.BorderSizePixel = 0
	Frame_7.Position = UDim2.new(0, 8, 0, 6)
	Frame_7.Size = UDim2.new(0, 1, 0, 5)

	Frame_8.Parent = Arrow_2
	Frame_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame_8.BackgroundTransparency = 0.500
	Frame_8.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Frame_8.BorderSizePixel = 0
	Frame_8.Position = UDim2.new(0, 7, 0, 5)
	Frame_8.Size = UDim2.new(0, 1, 0, 7)

	Frame_9.Parent = ScrollBar1
	Frame_9.BackgroundTransparency = 1.000
	Frame_9.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Frame_9.Position = UDim2.new(0, 16, 0, 0)
	Frame_9.Size = UDim2.new(1, -32, 1, 0)

	Frame_10.Parent = Frame_9
	Frame_10.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	Frame_10.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Frame_10.BorderSizePixel = 0
	Frame_10.Size = UDim2.new(58, 0, 1, 0)
	Frame_10.Visible = false

	Markers.Name = "Markers"
	Markers.Parent = Frame_9
	Markers.BackgroundTransparency = 1.000
	Markers.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Markers.Size = UDim2.new(1, 0, 1, 0)

	ScrollBar.Name = "ScrollBar"
	ScrollBar.Parent = Cons
	ScrollBar.Active = true
	ScrollBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	ScrollBar.BorderColor3 = Color3.fromRGB(27, 42, 53)
	ScrollBar.BorderSizePixel = 0
	ScrollBar.Position = UDim2.new(1, -16, 0, 0)
	ScrollBar.Size = UDim2.new(0, 16, 0.943312645, 0)

	Up.Name = "Up"
	Up.Parent = ScrollBar
	Up.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
	Up.BackgroundTransparency = 1.000
	Up.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Up.BorderSizePixel = 0
	Up.Size = UDim2.new(0, 16, 0, 16)
	Up.AutoButtonColor = false

	Arrow_3.Name = "Arrow"
	Arrow_3.Parent = Up
	Arrow_3.BackgroundTransparency = 1.000
	Arrow_3.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Arrow_3.Size = UDim2.new(0, 16, 0, 16)

	Frame_11.Parent = Arrow_3
	Frame_11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame_11.BackgroundTransparency = 0.500
	Frame_11.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Frame_11.BorderSizePixel = 0
	Frame_11.Position = UDim2.new(0, 8, 0, 6)
	Frame_11.Size = UDim2.new(0, 1, 0, 1)

	Frame_12.Parent = Arrow_3
	Frame_12.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame_12.BackgroundTransparency = 0.500
	Frame_12.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Frame_12.BorderSizePixel = 0
	Frame_12.Position = UDim2.new(0, 7, 0, 7)
	Frame_12.Size = UDim2.new(0, 3, 0, 1)

	Frame_13.Parent = Arrow_3
	Frame_13.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame_13.BackgroundTransparency = 0.500
	Frame_13.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Frame_13.BorderSizePixel = 0
	Frame_13.Position = UDim2.new(0, 6, 0, 8)
	Frame_13.Size = UDim2.new(0, 5, 0, 1)

	Frame_14.Parent = Arrow_3
	Frame_14.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame_14.BackgroundTransparency = 0.500
	Frame_14.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Frame_14.BorderSizePixel = 0
	Frame_14.Position = UDim2.new(0, 5, 0, 9)
	Frame_14.Size = UDim2.new(0, 7, 0, 1)

	Down.Name = "Down"
	Down.Parent = ScrollBar
	Down.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
	Down.BackgroundTransparency = 1.000
	Down.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Down.BorderSizePixel = 0
	Down.Position = UDim2.new(0, 0, 1, -16)
	Down.Size = UDim2.new(0, 16, 0, 16)
	Down.AutoButtonColor = false

	Arrow_4.Name = "Arrow"
	Arrow_4.Parent = Down
	Arrow_4.BackgroundTransparency = 1.000
	Arrow_4.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Arrow_4.Size = UDim2.new(0, 16, 0, 16)

	Frame_15.Parent = Arrow_4
	Frame_15.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame_15.BackgroundTransparency = 0.500
	Frame_15.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Frame_15.BorderSizePixel = 0
	Frame_15.Position = UDim2.new(0, 8, 0, 10)
	Frame_15.Size = UDim2.new(0, 1, 0, 1)

	Frame_16.Parent = Arrow_4
	Frame_16.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame_16.BackgroundTransparency = 0.500
	Frame_16.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Frame_16.BorderSizePixel = 0
	Frame_16.Position = UDim2.new(0, 7, 0, 9)
	Frame_16.Size = UDim2.new(0, 3, 0, 1)

	Frame_17.Parent = Arrow_4
	Frame_17.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame_17.BackgroundTransparency = 0.500
	Frame_17.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Frame_17.BorderSizePixel = 0
	Frame_17.Position = UDim2.new(0, 6, 0, 8)
	Frame_17.Size = UDim2.new(0, 5, 0, 1)

	Frame_18.Parent = Arrow_4
	Frame_18.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame_18.BackgroundTransparency = 0.500
	Frame_18.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Frame_18.BorderSizePixel = 0
	Frame_18.Position = UDim2.new(0, 5, 0, 7)
	Frame_18.Size = UDim2.new(0, 7, 0, 1)

	Frame_19.Parent = ScrollBar
	Frame_19.BackgroundTransparency = 1.000
	Frame_19.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Frame_19.Position = UDim2.new(0, 0, 0, 16)
	Frame_19.Size = UDim2.new(1, 0, 1, -32)

	Frame_20.Parent = Frame_19
	Frame_20.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	Frame_20.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Frame_20.BorderSizePixel = 0
	Frame_20.Size = UDim2.new(1, 0, 9.5, 0)
	Frame_20.Visible = false

	Markers_2.Name = "Markers"
	Markers_2.Parent = Frame_19
	Markers_2.BackgroundTransparency = 1.000
	Markers_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Markers_2.Size = UDim2.new(1, 0, 1, 0)

	-- Scripts:

	local function YBBLVOT_fake_script() -- Cons.LocalScript 
		local script = Instance.new('LocalScript', Cons)

		local scrollingFrame = TheOutput
		local scrollbar = ScrollBar
		local scrollbar1 = ScrollBar1

		local maxCanvasPosition = Vector2.new(0, 0)
		local previousMaxCanvasPosition = Vector2.new(0, 0)

		local value = Vector2.new(0, 0)  -- Initialize value here
		local value1 = Vector2.new(0, 0)

		local function updateCanvasSize()
			
		
			local maxXPosition = 500
			local totalHeight = 282
			local children = scrollingFrame:GetChildren()

			for _, child in pairs(children) do
				if child:IsA("TextLabel") then
					local xPosition = child.Position.X.Offset + child.TextBounds.X
					maxXPosition = math.max(maxXPosition, xPosition)
					totalHeight = totalHeight + child.TextBounds.Y
				end
			end

			scrollingFrame.CanvasSize = UDim2.new(0, maxXPosition, 0, totalHeight)
			maxCanvasPosition = Vector2.new(0, totalHeight)

			if maxCanvasPosition ~= previousMaxCanvasPosition then
				previousMaxCanvasPosition = maxCanvasPosition
				scrollingFrame.CanvasPosition = Vector2.new(100000, 100000)
				value = scrollingFrame.CanvasPosition
				value1 = scrollingFrame.CanvasPosition
				scrollingFrame.CanvasPosition = Vector2.new(0, 0)
			end

			local isScrollable = totalHeight > scrollingFrame.Size.Y.Offset
			scrollbar.Visible = isScrollable
			scrollbar1.Visible = isScrollable
		end

		local function arrows()
			while wait() do
				local canvasPosition = scrollingFrame.CanvasPosition

				local isAtTop = canvasPosition.Y > 0
				local isAtBottom = canvasPosition.Y < value.Y

				local isAtLeft = canvasPosition.X > 0
				local isAtRight = canvasPosition.X < value1.X


				local yColorToSetTop = isAtTop and 0 or 0.5
				local yColorToSetBottom = isAtBottom and 0 or 0.5


				local xColorToSetLeft = isAtLeft and 0 or 0.5
				local xColorToSetRight = isAtRight and 0 or 0.5


				for _, v in pairs(scrollbar.Up.Arrow:GetChildren()) do
					v.BackgroundTransparency = yColorToSetTop
				end

				for _, v in pairs(scrollbar.Down.Arrow:GetChildren()) do
					v.BackgroundTransparency = yColorToSetBottom
				end

				for _, v in pairs(scrollbar1.Left.Arrow:GetChildren()) do
					v.BackgroundTransparency = xColorToSetLeft
				end

				for _, v in pairs(scrollbar1.Right.Arrow:GetChildren()) do
					v.BackgroundTransparency = xColorToSetRight
				end

			end
		end

		spawn(function ()
			while wait() do
				updateCanvasSize()
			end
		end)

		spawn(function ()
			arrows()
		end)

		local ButtonTop = scrollbar.Up
		local ButtonBottom = scrollbar.Down

		local ButtonLeft = scrollbar1.Left
		local ButtonRight = scrollbar1.Right

		ButtonLeft.MouseEnter:Connect(function()
			if scrollingFrame.CanvasPosition.X < 1 then
				return -- Do not enable the button if at the top
			end
			ButtonLeft.BackgroundTransparency = 0.8
			scrollingFrame.ScrollingEnabled = false
			ButtonLeft.MouseLeave:Connect(function()
				ButtonLeft.BackgroundTransparency = 1
				scrollingFrame.ScrollingEnabled = true
			end)
		end)

		ButtonRight.MouseEnter:Connect(function()
			if scrollingFrame.CanvasPosition.X == value.X then
				return -- Do not enable the button if at the bottom
			end
			ButtonRight.BackgroundTransparency = 0.8
			scrollingFrame.ScrollingEnabled = false
			ButtonRight.MouseLeave:Connect(function()
				ButtonRight.BackgroundTransparency = 1
				scrollingFrame.ScrollingEnabled = true
			end)
		end)

		ButtonTop.MouseEnter:Connect(function()
			if scrollingFrame.CanvasPosition.Y < 1 then
				return -- Do not enable the button if at the top
			end
			ButtonTop.BackgroundTransparency = 0.8
			scrollingFrame.ScrollingEnabled = false
			ButtonTop.MouseLeave:Connect(function()
				ButtonTop.BackgroundTransparency = 1
				scrollingFrame.ScrollingEnabled = true
			end)
		end)

		ButtonBottom.MouseEnter:Connect(function()
			if scrollingFrame.CanvasPosition.Y == value.Y then
				return -- Do not enable the button if at the bottom
			end
			ButtonBottom.BackgroundTransparency = 0.8
			scrollingFrame.ScrollingEnabled = false
			ButtonBottom.MouseLeave:Connect(function()
				ButtonBottom.BackgroundTransparency = 1
				scrollingFrame.ScrollingEnabled = true
			end)
		end)


		local buttonTopPressed = false
		local buttonBottomPressed = false

		local buttonTopTick = 0
		local buttonBottomTick = 0


		local buttonLeftPressed = false
		local buttonRightPressed = false

		local buttonLeftTick = 0
		local buttonRightTick = 0




		ButtonLeft.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				if scrollingFrame.CanvasPosition.X < 1 then
					return -- Do not enable the button if at the top
				end
				ButtonLeft.BackgroundTransparency = 0.5
				buttonLeftPressed = true
				buttonLeftTick = tick()  -- Update the tick when the button is pressed
				scrollingFrame.CanvasPosition = scrollingFrame.CanvasPosition - Vector2.new(15, 0)
			end
		end)

		ButtonLeft.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				ButtonLeft.BackgroundTransparency = 0.8
				buttonLeftPressed = false
			end
		end)

		ButtonRight.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				if scrollingFrame.CanvasPosition.X == value.X then
					return -- Do not enable the button if at the bottom
				end
				ButtonRight.BackgroundTransparency = 0.5
				buttonRightPressed = true
				buttonRightTick = tick()  -- Update the tick when the button is pressed
				scrollingFrame.CanvasPosition = scrollingFrame.CanvasPosition + Vector2.new(15, 0)
			end
		end)

		ButtonRight.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				ButtonRight.BackgroundTransparency = 0.8
				buttonRightPressed = false
			end
		end)


		ButtonTop.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				if scrollingFrame.CanvasPosition.Y < 1 then
					return -- Do not enable the button if at the top
				end
				ButtonTop.BackgroundTransparency = 0.5
				buttonTopPressed = true
				buttonTopTick = tick()  -- Update the tick when the button is pressed
				scrollingFrame.CanvasPosition = scrollingFrame.CanvasPosition - Vector2.new(0, 15)
			end
		end)

		ButtonTop.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				ButtonTop.BackgroundTransparency = 0.8
				buttonTopPressed = false
			end
		end)

		ButtonBottom.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				if scrollingFrame.CanvasPosition.Y == value.Y then
					return -- Do not enable the button if at the bottom
				end
				ButtonBottom.BackgroundTransparency = 0.5
				buttonBottomPressed = true
				buttonBottomTick = tick()  -- Update the tick when the button is pressed
				scrollingFrame.CanvasPosition = scrollingFrame.CanvasPosition + Vector2.new(0, 15)
			end
		end)

		ButtonBottom.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				ButtonBottom.BackgroundTransparency = 0.8
				buttonBottomPressed = false
			end
		end)
		local function handleButtons()
			while wait() do
				if buttonTopPressed and tick() - buttonTopTick >= 0.3 then
					if scrollingFrame.CanvasPosition.Y < 1 then
						buttonTopPressed = false -- Do not handle the button if at the top
					else
						scrollingFrame.CanvasPosition = scrollingFrame.CanvasPosition - Vector2.new(0, 15)
					end
				end

				if buttonBottomPressed and tick() - buttonBottomTick >= 0.3 then
					if scrollingFrame.CanvasPosition.Y == value.Y then
						buttonBottomPressed = false -- Do not handle the button if at the bottom
					else
						scrollingFrame.CanvasPosition = scrollingFrame.CanvasPosition + Vector2.new(0, 15)
					end
				end

				if buttonLeftPressed and tick() - buttonLeftTick >= 0.3 then
					if scrollingFrame.CanvasPosition.X < 1 then
						buttonLeftPressed = false -- Do not handle the button if at the left
					else
						scrollingFrame.CanvasPosition = scrollingFrame.CanvasPosition - Vector2.new(15, 0)
					end
				end

				if buttonRightPressed and tick() - buttonRightTick >= 0.3 then
					if scrollingFrame.CanvasPosition.X == value.X then
						buttonRightPressed = false -- Do not handle the button if at the right
					else
						scrollingFrame.CanvasPosition = scrollingFrame.CanvasPosition + Vector2.new(15, 0)
					end
				end
			end
		end

		spawn(handleButtons)

		TheOutput.Size = UDim2.new(1, 0,0.93, 20)
	end
	coroutine.wrap(YBBLVOT_fake_script)()
end

return mod
