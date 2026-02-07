local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

workspace.Terrain:Clear()

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Disable rendering + lower quality
RunService:Set3dRenderingEnabled(false)

settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Always
settings().Rendering.QualityLevel = Enum.QualityLevel.Level01

-- Disable post effects
for _, v in ipairs(Lighting:GetChildren()) do
    if v:IsA("PostEffect") then
        v.Enabled = false
    end
end

---------------------------------------------------------------------
--  GUI STRIPPING
---------------------------------------------------------------------

local function hideGuiObject(obj)
    if obj:IsA("GuiObject") then
        obj.Visible = false
    end
end

-- Hide everything in PlayerGui
for _, gui in ipairs(playerGui:GetDescendants()) do
    hideGuiObject(gui)
end

-- Hide everything in CoreGui (Chat, Backpack, etc.)
for _, gui in ipairs(CoreGui:GetDescendants()) do
    hideGuiObject(gui)
end

---------------------------------------------------------------------
--  VISUAL STRIPPING (Meshes, Textures, Particles, etc.)
---------------------------------------------------------------------

local function stripVisuals(obj)
    if obj:IsA("BasePart") then
        obj.CastShadow = false
        obj.Material = Enum.Material.Plastic
        obj.Reflectance = 0
        obj.Transparency = 0
    end

    if obj:IsA("MeshPart") then
        obj.MeshId = ""
        obj.TextureID = ""
    end

    if obj:IsA("SpecialMesh") then
        obj:Destroy()
    end

    if obj:IsA("Decal") or obj:IsA("Texture") then
        obj:Destroy()
    end

    if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
        obj.Enabled = false
    end

    if obj:IsA("SurfaceAppearance") then
        obj:Destroy()
    end
end

for _, obj in ipairs(Workspace:GetDescendants()) do
    stripVisuals(obj)
end
