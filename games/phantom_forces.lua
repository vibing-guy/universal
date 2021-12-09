local PlayerUtilities = {}

local GetBodyParts, GetPlayerHealth

for Index, Value in pairs(getgc(true)) do
    if typeof(Value) == "table" then 
        if rawget(Value, "getbodyparts") then
            GetBodyParts = Value.getbodyparts
        end

        if rawget(Value, "getplayerhealth") then
            GetPlayerHealth = Value.getplayerhealth
        end
    end
end

warn("GetBodyParts:", GetBodyParts)
warn("GetPlayerHealth:", GetPlayerHealth)

function PlayerUtilities:IsPlayerAlive(Player)
    local PlayerHealth = GetPlayerHealth(Player, Player)

    if PlayerHealth then
        if math.floor(PlayerHealth) > 0 then
            return true
        end
    end

    return false
end

function PlayerUtilities:GetHealth(Player)
    local PlayerHealth = GetPlayerHealth(Player, Player)

    if PlayerHealth then
        return {
            CurrentHealth = math.floor(PlayerHealth),
            MaxHealth = 100
        }
    end
end

function PlayerUtilities:GetBodyParts(Player)
    local BodyParts = GetBodyParts(Player)

    if BodyParts and BodyParts.rootpart then
        return {
            Character = BodyParts.rootpart.Parent,
            Head = BodyParts.head,
            Root = BodyParts.rootpart,
            Torso = BodyParts.torso,
            LeftArm = BodyParts.larm,
            RightArm = BodyParts.rarm,
            LeftLeg = BodyParts.lleg,
            RightLeg = BodyParts.rleg
        }
    end
end

return PlayerUtilities
