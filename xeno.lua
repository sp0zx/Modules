-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Bunni.lol Decompiler

local v_u1 = {}
local v_u_random = math.random
function v_u1.getRandomItem(arg1)
	-- upvalues: (copy) v_u_random
	local v1 = 0
	for _, v2 in pairs(arg1) do
		v1 = v1 + v2
	end
	local v3 = v_u_random(v1)
	local v4 = 0
	for v5, v6 in pairs(arg1) do
		v4 = v4 + v6
		if v3 <= v4 then
			return v5, v6
		end
	end
end
function v_u1.getLargestValue(arg1)
	local v1 = 0
	local v2 = nil
	for v3, v4 in pairs(arg1) do
		if v1 <= v4 then
			v2 = v3
			v1 = v4
		end
	end
	return v2, v1
end
function v_u1.createCircle(arg1, arg2, arg3)
	local v1 = {}
	for v2 = 1, arg2 do
		local v3 = 360 / arg2 * v2
		local v_rad = math.rad(v3)
		local v_rad = math.rad(v3)
		local v_new = Vector3.new(math.cos(v_rad) * arg3 + arg1.X, arg1.Y, math.sin(v_rad) * arg3 + arg1.Z)
		table.insert(v1, v_new)
	end
	return v1
end
local _ = workspace
local v_u2 = { workspace }
function v_u1.RayCastOnMap(arg1, arg2, arg3)
	-- upvalues: (copy) v_u2
	local v_new = RaycastParams.new()
	v_new.FilterDescendantsInstances = v_u2
	v_new.FilterType = Enum.RaycastFilterType.Include
	local v_raycast = workspace:Raycast(arg1, arg2, v_new)
	if arg3 then
		return v_raycast
	elseif v_raycast then
		return v_raycast.Position
	else
		return arg1
	end
end
function v_u1.createTween(arg1, arg2, arg3, arg4, arg5, arg6)
	return TweenInfo.new(arg1, Enum.EasingStyle[arg2], Enum.EasingDirection[arg3], arg4, arg5, arg6)
end
function v_u1.spawnVFX(arg1, arg2, arg3, arg4)
	local v_u_create = game:GetService("TweenService"):Create(arg1, arg2, arg3)
	v_u_create:Play()
	if not arg4 or arg4 == nil then
		coroutine.resume(coroutine.create(function()
			-- upvalues: (copy) v_u_create, (copy) arg1
			v_u_create.Completed:Connect(function()
				-- upvalues: (ref) arg1
				if arg1 and arg1.Parent then
					if arg1.Parent == workspace then
						arg1:Destroy()
					else
						arg1.Parent:Destroy()
					end
				else
					return
				end
			end)
		end))
	end
end
function v_u1.spawnRubble(arg1, arg2, arg3, arg4, arg5)
	-- upvalues: (copy) v_u1, (copy) v_u_random
	local v1 = arg3 or {}
	local v_u2 = v1.newSize or (v1.Size or Vector3.new(1, 1, 1))
	local v_u3 = arg4 == nil and Instance.new("Part") or script.Part:Clone()
	v_u3.Size = v1.Size or Vector3.new(1, 1, 1)
	v_u3.Anchored = true
	v_u3.CanCollide = false
	v_u3.Position = arg2
	game.Debris:AddItem(v_u3, 10)
	if arg5 and math.random(1, 3) == 2 then
		local v_clone = arg5:Clone()
		v_clone.Parent = workspace
		v_clone.Volume = 1
		v_clone:Play()
		game.Debris:AddItem(v_clone, 5)
	end
	if arg4 == nil then
		if v1.Speed == 0.75 then
			v_u3.Color = Color3.fromRGB(200, 200, 200)
			v_u3.Material = Enum.Material.Snow
		else
			v_u3.Material = arg1.Material
			v_u3.Color = arg1.Color
		end
	else
		v_u3.Color = arg4.C
		v_u3.Material = arg4.M
		v_u3.Attachment.Glow.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, arg4.C), ColorSequenceKeypoint.new(1, arg4.C) })
		task.delay(0.1, function()
			-- upvalues: (copy) v_u3
			v_u3.Attachment.Glow.Enabled = false
		end)
	end
	v_u3.Parent = workspace
	local v_u4 = v1.Speed and (v1.Speed or 0.5) or 0.5
	local v_u5 = v_u3.Position + (arg2 - v1.origPos).Unit * (v1.Range and 1) * Vector3.new(1, 0, 1)
	local v_u6 = v1.Duration and v1.Duration or 0.5
	coroutine.resume(coroutine.create(function()
		-- upvalues: (ref) v_u1, (copy) v_u3, (copy) v_u4, (copy) v_u2, (copy) v_u5, (ref) v_u_random, (copy) v_u6
		local v_createtween = v_u1.createTween(v_u4, "Exponential", "Out", 0, false, 0)
		local v1 = {
			["Size"] = v_u2,
			["Position"] = v_u5
		}
		local v2 = v_u_random(0, 255)
		local v3 = v_u_random(0, 255)
		v1.Orientation = Vector3.new(v2, v3, v_u_random(0, 255))
		v_u1.spawnVFX(v_u3, v_createtween, v1, true)
		wait(v_u6)
		local v_createtween = v_u1.createTween(v_u4, "Exponential", "In", 0, false, 0)
		v_u1.spawnVFX(v_u3, v_createtween, {
			["Size"] = v_u3.Size / 15
		}, false)
	end))
	return v_u3
end
function v_u1.lerpPosition(arg1, arg2, arg3)
	return Vector3.new(arg1.X + (arg2.X - arg1.X) * arg3, arg1.Y + (arg2.Y - arg1.Y) * arg3, arg1.Z + (arg2.Z - arg1.Z) * arg3)
end
local v_u_collection = game:GetService("CollectionService")
function v_u1.CheckStunned(arg1)
	-- upvalues: (copy) v_u_collection
	if v_u_collection:HasTag(arg1, "Stunned") or v_u_collection:HasTag(arg1, "Disabled") then
		return true
	end
end
return v_u1
