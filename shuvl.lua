-- White Clover Hub script for Blox Fruits

-- Teleport to selected player
local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()
mouse.Button1Down:connect(function()
    if mouse.Target then
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.x, mouse.Hit.y + 5, mouse.Hit.z)
    end
end)

-- Kill Aura
local targetDistance = 12 -- adjust as needed
local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()

function getTarget()
    for i, v in pairs(game.Players:GetChildren()) do
        if v ~= plr and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 and (v.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= targetDistance then
            return v.Character.HumanoidRootPart
        end
    end
    return nil
end

while true do
    wait(0.1)
    local target = getTarget()
    if target then
        plr.Character.HumanoidRootPart.CFrame = target.CFrame
    end
end

-- Auto Pick up Fruits
local plr = game.Players.LocalPlayer

function getFruits()
    local fruits = {}
    for i, v in pairs(game.Workspace:GetChildren()) do
        if v.Name:find("Fruit") then
            local distance = (v.Position - plr.Character.HumanoidRootPart.Position).magnitude
            if distance <= 12 then
                table.insert(fruits, v)
            end
        end
    end
    return fruits
end

while true do
    wait(0.1)
    for i, v in pairs(getFruits()) do
        local fruit = v
        fruit.CFrame = plr.Character.HumanoidRootPart.CFrame
    end
end
