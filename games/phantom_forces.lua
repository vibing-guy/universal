local PlayerUtilities = {}

local UserInputService = game:GetService("UserInputService")
local MoveMouse = mousemoverel

local Replication, HUD
for Index, Value in pairs(getgc(true)) do
    if typeof(Value) == "table" then 
        if rawget(Value, "getbodyparts") then
            Replication = Value
        end

        if rawget(Value, "getplayerhealth") then
            HUD = Value
        end
    end
end

function PlayerUtilities:IsPlayerAlive(Player)
    return HUD:isplayeralive(Player)
end

function PlayerUtilities:GetHealth(Player)
    local PlayerHealth = HUD:getplayerhealth(Player)

    if PlayerHealth then
        return {
            CurrentHealth = math.floor(PlayerHealth),
            MaxHealth = 100
        }
    end
end

function PlayerUtilities:GetBodyParts(Player)
    local BodyParts = Replication.getbodyparts(Player)

    if BodyParts and BodyParts.torso then
        return {
            Character = BodyParts.torso.Parent,
            Head = BodyParts.head,
            Root = BodyParts.torso,
            Torso = BodyParts.torso,
            LeftArm = BodyParts.larm,
            RightArm = BodyParts.rarm,
            LeftLeg = BodyParts.lleg,
            RightLeg = BodyParts.rleg
        }
    end
end

function PlayerUtilities:AimAt(Position, Smoothing)
    local MouseLocation = UserInputService:GetMouseLocation()
    Smoothing += 0.5
    MoveMouse(((Position.X - MouseLocation.X) / Smoothing), ((Position.Y - MouseLocation.Y) / Smoothing))
end

return PlayerUtilities
