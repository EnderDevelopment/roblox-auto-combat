local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local killPartsFolder = Workspace:FindFirstChild("AutoKillParts")

if not killPartsFolder then
	killPartsFolder = Instance.new("Folder")
	killPartsFolder.Name = "AutoKillParts"
	killPartsFolder.Parent = Workspace
	warn("AutoKillParts was not found in Workspace, so an empty folder was created.")
end

local connectedParts = {}

local function killCharacterFromHit(hitPart)
	local character = hitPart:FindFirstAncestorOfClass("Model")
	if not character then
		return
	end

	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if not humanoid then
		return
	end

	local player = Players:GetPlayerFromCharacter(character)
	if not player or humanoid.Health <= 0 then
		return
	end

	humanoid.Health = 0
end

local function connectKillPart(instance)
	if not instance:IsA("BasePart") or connectedParts[instance] then
		return
	end

	connectedParts[instance] = instance.Touched:Connect(killCharacterFromHit)
end

local function disconnectKillPart(instance)
	local connection = connectedParts[instance]
	if not connection then
		return
	end

	connection:Disconnect()
	connectedParts[instance] = nil
end

for _, instance in ipairs(killPartsFolder:GetDescendants()) do
	connectKillPart(instance)
end

killPartsFolder.DescendantAdded:Connect(connectKillPart)
killPartsFolder.DescendantRemoving:Connect(disconnectKillPart)
