local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = game:GetService("Players").LocalPlayer
local BaseTweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

local Library = {} do
	function Library:Create(Type, Properties)
		local Object = Instance.new(Type)
		
		for Name, Value in pairs(Properties) do
			Object[Name] = Value
		end
		
		return Object
	end
end

local Loader = Library:Create("ScreenGui", {
	Name = "Loader",
	DisplayOrder = 1,
	ZIndexBehavior = Enum.ZIndexBehavior.Global,
    Enabled = false
})

if (syn and syn.protect_gui) then
	syn.protect_gui(Loader)
	Loader.Parent = game:GetService("CoreGui")
elseif type(get_hidden_gui) == 'function' then
	Loader.Parent = get_hidden_gui()
elseif type(gethui) == 'function' then
	Loader.Parent = gethui()
else
	Loader.Name = tostring(math.random())
	Loader.Parent = game:GetService("CoreGui")
end

if not shared.BeachwaveVersion then
    shared.BeachwaveVersion = "Date not found"
end

local Holder = Library:Create("ImageLabel", {
	Name = "Holder",
	Parent = Loader,
	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	BackgroundTransparency = 1,
	ClipsDescendants = true,
	Position = UDim2.new(0.5, -150, 0.5, -50),
	Size = UDim2.new(0, 300, 0, 100),
	Image = "rbxassetid://3570695787",
	ImageColor3 = Color3.fromRGB(20, 20, 20),
	ScaleType = Enum.ScaleType.Slice,
	SliceCenter = Rect.new(100, 100, 100, 100),
	SliceScale = 0.04
})

local Title = Library:Create("TextLabel", {
	Name = "Title",
	Parent = Holder,
	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	BackgroundTransparency = 1,
	Size = UDim2.new(1, 0, 0, 40),
	Font = Enum.Font.GothamBold,
	Text = "beachwave",
	TextColor3 = Color3.fromRGB(255, 255, 255),
	TextSize = 22
})

local Creator = Library:Create("TextLabel", {
	Name = "Creator",
	Parent = Holder,
	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	BackgroundTransparency = 1,
	Position = UDim2.new(0, 0, 0.25999999, 0),
	Size = UDim2.new(1, 0, 0, 20),
	Font = Enum.Font.GothamSemibold,
	Text = ("By: coasts | Updated: " .. shared.BeachwaveVersion),
	TextColor3 = Color3.fromRGB(255, 255, 255),
	TextSize = 14
})

local Status = Library:Create("TextLabel", {
	Name = "Status",
	Parent = Holder,
	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	BackgroundTransparency = 1,
	Position = UDim2.new(0, 0, 0.400000006, 0),
	Size = UDim2.new(1, 0, 0.200000003, 40),
	Font = Enum.Font.Gotham,
	Text = "",
	TextColor3 = Color3.fromRGB(255, 255, 255),
	TextSize = 16,
	TextWrapped = true
})

function SetAllTextLabelsTransparency(Transparency)
    for Index, Object in pairs(Holder:GetChildren()) do
        TweenService:Create(Object, BaseTweenInfo, {TextTransparency = Transparency}):Play()
    end
end

function shared:SetStatus(String)
    Status.Text = String
end

function Library:Open()
    local Tween = TweenService:Create(Holder, BaseTweenInfo, {Position = UDim2.new(0.5, -150, 0.5, -50), Size = UDim2.new(0, 300, 0, 100)})
	Tween:Play()
    Tween.Completed:Wait()

    SetAllTextLabelsTransparency(0)
	task.wait(0.5)
end

function Library:Close()
    SetAllTextLabelsTransparency(1)

	task.wait(0.5)
    local Tween = TweenService:Create(Holder, BaseTweenInfo, {Position = UDim2.new(0.5, 0, 0.5, 0), Size = UDim2.new(0, 0, 0, 0)})
	Tween:Play()
    Tween.Completed:Wait()

    Loader:Destroy()
    Library = nil
end


Holder.Position = UDim2.new(0.5, 0, 0.5, 0) 
Holder.Size = UDim2.new(0, 0, 0, 0)

for Index, Object in pairs(Holder:GetChildren()) do
    Object.TextTransparency = 1
end

Loader.Enabled = true

return Library
