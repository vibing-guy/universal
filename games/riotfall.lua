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
    local Mesh = (Character and Character:FindFirstChild("Mesh"):FindFirstChild("Character"):FindFirstChild("Hips"))

    if Character and Mesh then
        local Head = (Mesh and Mesh:FindFirstChild("BottomSpine"):FindFirstChild("MidSpine"):FindFirstChild("TopSpine"):FindFirstChild("Neck"):FindFirstChild("Head"))
        local Root = (Character and Character:FindFirstChild("HumanoidRootPart"))
        local Torso = (Mesh and Mesh:FindFirstChild("BottomSpine"))
        local LeftArm = (Mesh and Mesh:FindFirstChild("BottomSpine"):FindFirstChild("MidSpine"):FindFirstChild("TopSpine"):FindFirstChild("LeftShoulder"):FindFirstChild("LeftArm"))
        local RightArm = (Mesh and Mesh:FindFirstChild("BottomSpine"):FindFirstChild("MidSpine"):FindFirstChild("TopSpine"):FindFirstChild("RightShoulder"):FindFirstChild("RightArm"))
        local LeftLeg = (Mesh and Mesh:FindFirstChild("LeftUpLeg"):FindFirstChild("LeftLeg"):FindFirstChild("LeftFoot"))
        local RightLeg = (Mesh and Mesh:FindFirstChild("RightUpLeg"):FindFirstChild("RightLeg"):FindFirstChild("RightFoot"))

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
