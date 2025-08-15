local Module = {}

Module.CreateCameraMovement = function(Frames)
	-- Constrained Orbit LocalScript under your ViewportFrame template

	local viewportFrame = Frames
	local UIS           = game:GetService("UserInputService")
	local RunService    = game:GetService("RunService")

	-- SETTINGS
	local dragSensitivity = 0.005        -- how fast you orbit while dragging
	local autoRotateSpeed = math.rad(10) -- idle auto‐spin speed
	local minPitch        = math.rad(-89) -- clamp lower tilt
	local maxPitch        = math.rad( 89) -- clamp upper tilt

	-- STATE
	local model, initialCFrame
	local isOver   = false
	local dragging = false
	local lastMousePos = Vector2.new()
	local yawAngle, pitchAngle = 0, 0

	-- 1) Capture the cloned model & record its original pivot
	viewportFrame.ChildAdded:Connect(function(child)
		if child:IsA("Model") then
			model         = child
			initialCFrame = child:GetPivot()
			yawAngle, pitchAngle = 0, 0
		end
	end)

	-- 2) Track hover (spin only when cursor is over)
	viewportFrame.MouseEnter:Connect(function()
		isOver = true
	end)
	viewportFrame.MouseLeave:Connect(function()
		isOver, dragging = false, false
	end)

	-- 3) Begin drag on left-click
	viewportFrame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 and isOver then
			dragging     = true
			lastMousePos = UIS:GetMouseLocation()
		end
	end)

	-- 4) End drag on any mouse-up (GUI or global)
	viewportFrame.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = false
		end
	end)
	UIS.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = false
		end
	end)

	-- 5) Rotate while dragging (inverted yaw & inverted pitch)
	UIS.InputChanged:Connect(function(input)
		if not dragging
			or input.UserInputType ~= Enum.UserInputType.MouseMovement
			or not model then
			return
		end

		local current = UIS:GetMouseLocation()
		local delta   = current - lastMousePos
		lastMousePos  = current

		-- inverted yaw: dragging right rotates right
		yawAngle   = yawAngle + delta.X * dragSensitivity
		-- inverted pitch: dragging up rotates down
		pitchAngle = math.clamp(pitchAngle + delta.Y * dragSensitivity,
			minPitch, maxPitch)

		model:PivotTo(
			initialCFrame
				* CFrame.Angles(0,       yawAngle,    0)
				* CFrame.Angles(pitchAngle, 0,         0)
		)
	end)


	local SCROLL_THRESHOLD = 0.1
	local lastScrollTime = 0
	local SCROLL_COOLDOWN = 0.001
	local SCROLL_SPEED = 3 -- tweak this to adjust how fast the camera moves

	UIS.InputChanged:Connect(function(input)
		local Cam = Frames:WaitForChild("Camera",math.huge)
		if input.UserInputType == Enum.UserInputType.MouseWheel then
			local now = tick()
			if now - lastScrollTime >= SCROLL_COOLDOWN then
				if math.abs(input.Position.Z) >= SCROLL_THRESHOLD then
					if not isOver then return end

					local scrollDirection = input.Position.Z < 0 and -1 or 1
					lastScrollTime = now

					-- Move camera along its LookVector
					Cam.CFrame = Cam.CFrame + Cam.CFrame.LookVector * SCROLL_SPEED * scrollDirection
				end
			end
		end
	end)


	RunService.RenderStepped:Connect(function(dt)
		-- Auto-rotate if not dragging, regardless of mouse hover
		if model and not dragging then
			yawAngle = yawAngle + autoRotateSpeed * dt

			model:PivotTo(
				initialCFrame
					* CFrame.Angles(0,       yawAngle,    0)
					* CFrame.Angles(pitchAngle, 0,         0)
			)
		end
	end)
end

return Module
