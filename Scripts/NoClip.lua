local RunService = game:GetService("RunService")

local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()

local function enableNoclip()
	for _, part in ipairs(Character:GetDescendants()) do
		if part:IsA("BasePart") and part.CanCollide then
			part.CanCollide = false
		end
	end
end

local noclipConnection
noclipConnection = RunService.Stepped:Connect(function()
	if Character and Character.Parent then
		enableNoclip()
	else
		noclipConnection:Disconnect()
	end
end)
