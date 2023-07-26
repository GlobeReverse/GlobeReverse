-- Moonlight Hub
-- "network" file source
-- this file source was written by drawing.new "hook" 

local Debris = game:GetService "Debris"
local Players = game:GetService "Players"
local RunService = game:GetService "RunService"

-- Shared Tables

shared.Network = {}
shared.Network.temp = {}
shared.Network.signals = {}

-- Quick Indexing

local WaitForChild = game.WaitForChild
local FindFirstChild = game.FindFirstChild
local FindFirstChildIsA = game.FindFirstChildWhichIsA

local IsA = game.IsA
local IsDescendantOf = game.IsDescendantOf

local GetChildren = game.GetChildren
local GetPlayers = Players.GetPlayers
local WorldToScreenPoint = workspace.CurrentCamera.WorldToScreenPoint

-- Utility Functions

shared.Network.RandomizedString = function(self, length)
    local result = ""
    local characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_\\"

    for i = 1, length do
        local randomIndex = math.random(1, #characters)
        result = result .. string.sub(characters, randomIndex, randomIndex)
    end
    
    return result
end

shared.Network.RandomizedObject = function(self, tbl)
    local keys = {}
    
    for key, value in pairs(tbl) do
        keys[#keys + 1] = key
    end
    
    return tbl[keys[math.random(1, #keys)]]
end

shared.Network.Direction = function(self, origin, destination)
    return (destination - origin).Unit * 1000
end

shared.Network.ScreenDirection = function(self, origin)
    local vector, onscreen = WorldToScreenPoint(workspace.CurrentCamera, origin)
    return Vector2.new(vector.X, vector.Y), onscreen
end

shared.Network.IsValid = function(self, plr)
    if not plr then return false end
    if not plr.Character then return false end

    if not FindFirstChild(plr.Character, "Humanoid") then return false end
    if not FindFirstChild(plr.Character, "HumanoidRootPart") then return false end

    if not (plr.Character.Humanoid.Health > 0) then return false end
    return true
end

shared.Network.DistanceFromMouse = function(self, vector3)
    local mouse = game:GetService("Players").LocalPlayer:GetMouse()
    local mousePosition = Vector2.new(mouse.X, mouse.Y)

    local vector2Position = Vector2.new(vector3.X, vector3.Y)
    return (vector2Position - mousePosition).Magnitude
end

shared.Network.ValidBodyParts = function(self, plr, bodyparts)
    local passedValidBodyParts = {}

    if not bodyparts then
        bodyparts = { "Head", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg" }
    end

    if not shared.Network:IsValid(plr) then
        return passedValidBodyParts
    end

    for _, bp in next, bodyparts do
        if FindFirstChild(plr.Character, bp) then
            table.insert(passedValidBodyParts, bp)
        end
    end

    return passedValidBodyParts
end
