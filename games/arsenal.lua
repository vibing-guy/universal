local PlayerUtilities = {}

function PlayerUtilities:IsPlayerAlive(Player)
    local NRPBS = Player:FindFirstChild("NRPBS")
    local Health = (NRPBS and NRPBS.Health)

    if NRPBS and Health then
        if Health.Value > 0 then
            return true
        end
    end

    return false
end

function PlayerUtilities:GetHealth(Player)
    local NRPBS = Player:FindFirstChild("NRPBS")
    local Health, MaxHealth = (NRPBS and NRPBS.Health), (NRPBS and NRPBS.MaxHealth)

    if NRPBS and Health and MaxHealth then
        return {
            CurrentHealth = Health.Value,
            MaxHealth = MaxHealth.Value
        }
    end
end

return PlayerUtilities
