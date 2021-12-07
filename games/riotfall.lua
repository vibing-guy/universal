local PlayerUtilities = {}

local LocalPlayer = game:GetService("Players").LocalPlayer

function PlayerUtilities:IsPlayerAlive(Player)
    local Character = Player.Character
    local Humanoid = (Character and Character:FindFirstChild("Humanoid"))
    local Health = (Humanoid and Humanoid.Health)

    if Character and Humanoid and Health then
        if Health > 0 then
            return true
        end
    end

    return false
end

function PlayerUtilities:GetHealth(Player)
    local Character = Player.Character
    local Humanoid = (Character and Character:FindFirstChild("Humanoid"))
    local Health, MaxHealth = (Humanoid and Humanoid.Health), (Humanoid and Humanoid.MaxHealth)

    if Character and Humanoid and Health and MaxHealth then
        return {
            CurrentHealth = Health,
            MaxHealth = MaxHealth
        }
    end
end

function PlayerUtilities:GetBodyParts(Player)
    local Character = Player.Character
    local CollisionGeo = (Character and Character:FindFirstChild("CollisionGeo"))


    if Character and CollisionGeo then
        local Head = (CollisionGeo and CollisionGeo:FindFirstChild("Head"))
        local Root = (Character and Character:FindFirstChild("HumanoidRootPart"))
        local Torso = (CollisionGeo and CollisionGeo:FindFirstChild("LowerTorso"))
        local LeftArm = (CollisionGeo and CollisionGeo:FindFirstChild("LeftLowerArm"))
        local RightArm = (CollisionGeo and CollisionGeo:FindFirstChild("RightLowerArm"))
        local LeftLeg = (CollisionGeo and CollisionGeo:FindFirstChild("LeftLowerLeg"))
        local RightLeg = (CollisionGeo and CollisionGeo:FindFirstChild("RightLowerLeg"))

        if Character and (Head and Root and Torso and LeftArm and RightArm and LeftLeg and RightLeg) then
            return {
                Character = Character,
                Head = Head,
                Root = Root,
                Torso = Torso,
                LeftArm = LeftArm,
                RightArm = RightArm,
                LeftLeg = LeftLeg,
                RightLeg = RightLeg
            }
        end
    end
end

function PlayerUtilities:GetDistanceFromClient(Position)
    local Character = LocalPlayer.Character
    local Root = (Character and Character:FindFirstChild("HumanoidRootPart"))

    if Character and Root then
        return (Root.Position - Position).Magnitude
    end

    return 0
end

return PlayerUtilities
