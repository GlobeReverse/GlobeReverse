-- i didnt make this shit just added renderstep and usage of flags to help a friend

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "nigga of the library", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local RunService = game:GetService("RunService")

local player = game.Players.LocalPlayer

local orbs = game:GetService("Workspace").GameAssets.GlobalAssets.OrbSpawns

-- tabs
local Tab = Window:MakeTab({
    Name = "Tab 1",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- notify
OrionLib:MakeNotification({
    Name = "hi!",
    Content = "welcome",
    Image = "rbxassetid://4483345998",
    Time = 5
})

-- pet spawner

game:GetService("ReplicatedStorage").Remotes.CanBuyEgg:InvokeServer("Air Jinn",false)
OrionLib:Init()
-- button

Tab:AddButton({
    Name = "pet!",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CanBuyEgg:InvokeServer("Air Jinn",false)
    end
})

--toggle button
Tab:AddToggle({ Name = "goodfarm!", Default = false, Flag = "autofarm" }) 

RunService.RenderStepped:Connect(function()
    if OrionLib.Flags['autofarm'].Value then 
        for i, v in pairs(orbs:GetChildren()) do
            if v:IsA("MeshPart") then
                if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    player.Character.HumanoidRootPart.CFrame = v.CFrame
                end
            elseif v:IsA("Model") then
                local summerOrb = v:FindFirstChild("Orb. 1")
                if summerOrb then

                    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        player.Character.HumanoidRootPart.CFrame = summerOrb.CFrame
                    end
                end
            end
        end
    end
end)
