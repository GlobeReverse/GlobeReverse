-- // Variables \\ --
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")

local cache = { threads = {}, hooking = {}, signals = {}, debris = {}, drawings = {}, ticks = { MovementRag = tick(), LastPickUp = tick(), Break = tick() }, variables = { DoingSafe = false } }

local Client = Players.LocalPlayer
local Asset = syn and getsynasset or getcustomasset
local Mouse = Client.GetMouse(Client)
local Camera = workspace.CurrentCamera
local WorldToScreenPoint = workspace.CurrentCamera.WorldToScreenPoint

local FindFirstChild = game.FindFirstChild
local FindFirstChildWhichIsA = game.FindFirstChildWhichIsA
local FindFirstChildOfClass = game.FindFirstChildOfClass

local GetDescendants = game.GetDescendants
local GetChildren = game.GetChildren
local GetPlayers = Players.GetPlayers

getgenv().FontSize = 13
getgenv().Thickness = 2
getgenv().Transparency = 1
getgenv().Rainbow = false 

local module = {}
local Client = game.Players.LocalPlayer
module.__index = module

local players = game:GetService("Players")

local plr = Client
local mouse = plr:GetMouse()

local cam = workspace.CurrentCamera

local V3new = Vector3.new
local WorldToViewportPoint = cam.WorldToViewportPoint

local ValidCharacter = function(plr)
    if not plr then return false end
    if not plr.Character then return false end

    if not plr.Character:FindFirstChild("Head") then return false end
    if not plr.Character:FindFirstChild("HumanoidRootPart") then return false end
    if not plr.Character:FindFirstChildWhichIsA("Humanoid") then return false end

    return true
end

local function constructDrawing(object,properties)
    local Draw = Drawing.new(object)

    for i,v in pairs(properties) do 
        Draw[i] = v
    end 

    return Draw
end

local funcs = {
    GetName = function(char)
        return char.Name
    end,
    GetChar = function(plr)
        return plr.Character
    end,
    GetPlayer = function(char)
        return game:GetService("Players"):GetPlayerFromCharacter(char)
    end,
    GetHealth = function(char)
        return char:FindFirstChildOfClass("Humanoid").Health,char:FindFirstChildOfClass("Humanoid").MaxHealth
    end,
    GetPrimaryPart = function(char)
        return char.PrimaryPart
    end 
}

function module.setFunctions(func)
    funcs = func
end 

function module.new(settings)
    settings = settings or {}
    
    local default = {}

    default.refreshRate = 1
    default.boxes = false
    default.text = false 
    default.tracer = false 
    default.canRender = false 
    default.visible = false
    default.facecam = false
    default.distance = 2500
    default.color = Color3.fromRGB(255,255,255)
    default.overrides = {}
    default.offset = CFrame.new(0,-.30,0)

    for i,v in pairs(default) do 
        if settings[i] == nil then 
            settings[i] = v
        end 
    end 

    return settings 
end 

local espGroups = {}

function module.newGroup(settings)
    settings.groupEnabled = false 
    settings.espObjects = {}
    settings.lastCache = 0
    settings.cache = {}

    local functions = {}
    functions.__index = functions

    function functions.addObject(props,model) 
        if settings.espObjects[model] then return nil end 

        self = props

        local objectFuncs = {}
        objectFuncs.__index = objectFuncs

        local removed = false 

        function objectFuncs.Remove(box)
            settings.espObjects[model] = nil
            settings.cache[model] = nil

            wait()

            for i,v in pairs(box.Objects) do
                v.Visible = false
                v.Transparency = 0
            end 
        end

        local box = setmetatable({
            Name = props ~= nil and props.Name or model.Name,
            Type = "Box",
            primarypart = props.primarypart or model.ClassName == "Model" and (model.PrimaryPart or model:FindFirstChild("HumanoidRootPart") or model:FindFirstChildWhichIsA("BasePart")) or model:IsA("BasePart") and model,
            Objects = {},
        }, objectFuncs)
    
        for i,v in pairs(props) do 
            box[i] = v
        end 
    
        box.Objects.box = constructDrawing("Quad", {
            Thickness = getgenv().Thickness,
            Color = box.color,
            Transparency = getgenv().Transparency,
            Filled = false,
            ZIndex = 3, 
            Visible = self.visible and self.boxes
        })
    
        box.Objects.text = constructDrawing("Text", {
            Text = "",
            Color = box.color,
            Center = true,
            Outline = true,
            Font = 2,
            Size = getgenv().FontSize,
            Transparency = getgenv().Transparency,
            Visible = self.visible and self.text
        })
        
        box.Objects.tracer = constructDrawing("Line", {
            Thickness = getgenv().Thickness,
            Color = box.color,
            Transparency = getgenv().Transparency,
            ZIndex = 3,
            Visible = self.visible and self.tracer,
        })

        model:GetPropertyChangedSignal("Parent"):Connect(function()
            if model.Parent == nil and self.deleteOnNil ~= false then
                box:Remove()
            end
        end)

        local hum = model:FindFirstChildOfClass("Humanoid") or (model.Parent and model.Parent:FindFirstChildOfClass("Humanoid"))
    
        if hum then
            hum.Died:Connect(function()
                if self.deleteOnNil ~= false then
                    box:Remove()
                end
            end)
        end
    
        box.index = model
    
        settings.espObjects[model] = box
    
        return box 
    end 

    function functions.editSetting(setting,value,applytoAll)
        if setting == "visible" then 
            settings.groupEnabled = value 

            if value == false then 
                wait()

                for i,v in pairs(settings.espObjects) do 
                    for _,esp in pairs(v.Objects) do 
                        esp.Visible = false
                    end 
                end 
            end 
        elseif applyToAll ~= true then  
            settings[setting] = value
        else 
            settings[setting] = value
            
            for i,v in pairs(settings.espObjects) do 
                v[setting] = value
            end 
        end 
    end 

    local meta = setmetatable(settings,functions)

    table.insert(espGroups,meta)

    return meta,functions
end 

function module.AddListener(preset,object)
    local Group,funcs = module.newGroup(preset)
    local function addItem(obj)
        if preset.customFilter == nil or (preset.customFilter and preset.customFilter(obj,ESPObjects) == true) then 
            local newSettings = preset

            if preset.CustomSettings then 
                newSettings = preset.CustomSettings(obj,preset)
            end 

            Group.addObject(newSettings,obj)

            if newSettings.callback then
                newSettings.callback(obj)
            end 
        end 
    end 

    if preset.recursive then
        object.DescendantAdded:Connect(addItem)

        for i,v in pairs(object:GetDescendants()) do
            coroutine.wrap(addItem)(v)
        end
    else    
        object.ChildAdded:Connect(addItem)

        for i,v in pairs(object:GetChildren()) do
            coroutine.wrap(addItem)(v)
        end
    end    

    local functions = {}
    functions.__index = functions

    for i,v in pairs(funcs) do 
        functions[i] = v
    end 

    return functions
end 

function module.createGroup(preset,parts)
    local Group,funcs = module.newGroup(preset)
    local function addItem(obj)
        if preset.customFilter == nil or (preset.customFilter and preset.customFilter(obj,ESPObjects) == true) then 
            local newSettings = preset

            if preset.CustomSettings then 
                newSettings = preset.CustomSettings(obj,preset)
            end 

            Group.addObject(newSettings,obj)

            if newSettings.callback then
                newSettings.callback(obj)
            end 
        end 
    end 

    for i,v in pairs(parts) do 
        addItem(v)
    end 

    local functions = {}
    functions.__index = functions

    for i,v in pairs(funcs) do 
        functions[i] = v
    end 

    return functions    
end 

local lastDt = 0
local temp = tick()
local function runGroup(group)
    local lastCache = group.lastCache

    if tick() - lastCache > 1 then 
        group.cache = {}
        group.lastCache = tick()

        for i,v in pairs(group.espObjects) do 
            if not ValidCharacter(Client) then return end 
            
            if v.primarypart == nil or v.primarypart.Parent == nil or v.primarypart.Parent.Parent == nil then 
                group.espObjects[i]:Remove()
                group.espObjects[i] = nil 
                continue
            end

            if (v.primarypart.Position - funcs.GetPrimaryPart(funcs.GetChar(Client)).Position).magnitude < group.distance then 
                group.cache[i] = v 
            else 
                for i,v in pairs(v.Objects) do
                    v.Visible = false
                end
            end 
        end 
    end 

    local drawFunctions = {
        ["boxes"] = function(CFPoints,self)
            local TL, Vis1 = WorldToViewportPoint(cam, CFPoints.TL.p)
            local TR, Vis2 = WorldToViewportPoint(cam, CFPoints.TR.p)
            local BL, Vis3 = WorldToViewportPoint(cam, CFPoints.BL.p)
            local BR, Vis4 = WorldToViewportPoint(cam, CFPoints.BR.p)
    
            if Vis1 and Vis2 and Vis3 and Vis4 and self.primarypart and not getgenv().Unloaded then
                self.Objects.box.Visible = true
                self.Objects.box.PointA = Vector2.new(TR.X, TR.Y)
                self.Objects.box.PointB = Vector2.new(TL.X, TL.Y)
                self.Objects.box.PointC = Vector2.new(BL.X, BL.Y)
                self.Objects.box.PointD = Vector2.new(BR.X, BR.Y)
                
                if getgenv().Rainbow then 
                    self.Objects.box.Color = Color3.fromHSV(tick() * 24 % 255/255, 1, 1)
                else 
                    self.Objects.box.Color = self.color
                end

                self.Objects.box.Transparency = getgenv().Transparency
                self.Objects.box.Thickness = getgenv().Thickness
            else
                self.Objects.box.Visible = false
            end
        end,
        ["tracer"] = function(CFPoints,self)
            local TP, visible = WorldToViewportPoint(cam, CFPoints.Torso.p)
                
            if visible and not getgenv().Unloaded then
                self.Objects.tracer.Visible = true
                self.Objects.tracer.From = Vector2.new(TP.X, TP.Y)
                local b = getgenv().Centre and 2 or 1
                self.Objects.tracer.To = Vector2.new(cam.ViewportSize.X/2,cam.ViewportSize.Y/b)
                
                if getgenv().Rainbow then 
                    self.Objects.tracer.Color = Color3.fromHSV(tick() * 24 % 255/255, 1, 1)
                else 
                    self.Objects.tracer.Color = self.color
                end

                self.Objects.tracer.Thickness = getgenv().Thickness
                self.Objects.tracer.Transparency = getgenv().Transparency
            else
                self.Objects.tracer.Visible = false
            end
        end,
        ["text"] = function(CFPoints,self)
            local TagPos, Vis5 = WorldToViewportPoint(cam, CFPoints.TagPos.p)
                        
            if Vis5 and not getgenv().Unloaded then
                local text = self.CustomText and self.CustomText(self.primarypart) or self.primarypart.Name

                if text == "unloaded" or text == "HumanoidRootPart" then 
                    return
                end 

                self.Objects.text.Visible = true
                
                self.Objects.text.Position = Vector2.new(TagPos.X, TagPos.Y - 14)
                
                self.Objects.text.Text = text

                if getgenv().Rainbow then 
                    self.Objects.text.Color = Color3.fromHSV(tick() * 24 % 255/255, 1, 1)
                else 
                    self.Objects.text.Color = self.color
                end
                
                self.Objects.text.Transparency = getgenv().Transparency
                self.Objects.text.Size = getgenv().FontSize
            else
                self.Objects.text.Visible = false
            end
        end
    }

    local updateFuncs = {}

    for i,v in pairs(drawFunctions) do 
        if group[i] == true then 
            updateFuncs[i] = v                       
        end 
    end 

    local count = 0

    for i,v in pairs(group.cache) do 
        count += 1

        if funcs.GetChar(Client) == nil then   
            if v.Objects == nil then return end 
            
            for i,v in pairs(v.Objects) do 
                v.Visible = false   
            end 

            continue
        end 

        local function delete()
            group.espObjects[i]:Remove()
        end 

        if v.primarypart == nil then 
            delete()
            continue
        end 

        local allowDraw = true 

        if self.customVisible ~= nil and self.customVisible(v.primarypart,self) ~= true then 
            allowDraw = false 
        end 

        if not allowDraw then
            for i,v in pairs(v.Objects) do
                v.Visible = false
            end

            continue
        end
        
        local cf = v.primarypart.CFrame
                
        if group.facecam then
            local cfAngle = CFrame.new(cf.p, cam.CFrame.p)
    
            local x, y, z = cfAngle:ToEulerAnglesYXZ()
            local newCF = CFrame.Angles(0, y, z) 
    
            cf = CFrame.new(cfAngle.p) * newCF
        end

        local size = v.size or Vector3.new(4,6,0)

        local CFPoints = {
            TL = cf * v.offset * CFrame.new(size.X/2,size.Y/2,0),
            TR = cf * v.offset * CFrame.new(-size.X/2,size.Y/2,0),
            BL = cf * v.offset * CFrame.new(size.X/2,-size.Y/2,0),
            BR = cf * v.offset * CFrame.new(-size.X/2,-size.Y/2,0),

            HB = cf * v.offset * CFrame.new(size.X/2.5,size.Y/2,0),

            TagPos = cf * v.offset * CFrame.new(0,-size.Y/2,0),
            Torso = cf * v.offset
        }

        local clr = group.color
    
        if group.CustomColor then
            clr = group.CustomColor(v.primarypart,v)
        end 

        v.color = clr

        for i,FUNC in pairs(drawFunctions) do 
            if group[i] ~= true then 
                local tab = {
                    ["boxes"] = "box",
                    ["tracer"] = "tracer",
                    ["text"] = "text"
                }

                if tab[i] then 
                    v.Objects[tab[i]].Visible = false
                end 
            end 
        end 

        for n,func in pairs(updateFuncs) do 
            local succ,err = pcall(function() func(CFPoints,v) end) 

            if err then 
                delete()
                break
            end
        end 
    end 

    return count
end

local crnt = tick()

game:GetService("RunService").RenderStepped:Connect(function(dt)
    if tick() - crnt > (1/60) then 
        crnt = tick()
        local count = 0

        for i,v in pairs(espGroups) do 
            if v.groupEnabled then                                     
                local add = runGroup(v)

                if add ~= nil then
                    count += add
                end
            end 
        end 
    end 
end)

return module
