local module = {}

module.LoadBridge = function()
	local ServerStorage = game:GetService("ServerStorage")
	local ServerScriptService = game:GetService("ServerScriptService")

	local Domain = game.TestService

	if not Domain:WaitForChild("MainFolder",1) then return end

	local MainFolder = Domain:FindFirstChild("MainFolder")

	local Fake_ServerStorage = MainFolder:FindFirstChild('ServerStorage')
	local Fake_ServerScriptService = MainFolder:FindFirstChild('ServerScriptService')

	if not MainFolder:FindFirstChild('MainBridge') then return end

	local Refresh = function(PointA,PointB)
		for i,v in pairs(PointA:GetChildren()) do
			local clone = v:Clone()
			clone.Parent = PointB
			if clone:IsA("Script") or clone:IsA("LocalScript") then
				clone.Enabled = false
			end
			if v:IsA("Sound") then
				v.IsPlaying = false
			end
		end
	end

	local UpdateSS = function()
		for i,v in pairs(ServerStorage:GetChildren()) do v:Destroy() end 
		Refresh(Fake_ServerStorage,ServerStorage)
	end

	local UpdateSSS = function()
		for i,v in pairs(ServerScriptService:GetChildren()) do v:Destroy() end 
		Refresh(Fake_ServerScriptService,ServerScriptService)
	end

	Fake_ServerStorage.DescendantAdded:Connect(UpdateSS)
	Fake_ServerStorage.DescendantRemoving:Connect(UpdateSS)

	Fake_ServerScriptService.DescendantAdded:Connect(UpdateSSS)
	Fake_ServerScriptService.DescendantRemoving:Connect(UpdateSSS)

	spawn(UpdateSS)
	spawn(UpdateSSS)

	return MainFolder:FindFirstChild('MainBridge')
end

return module
