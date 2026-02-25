local FarmMainGUI = Instance.new("ScreenGui")
local MainBackFrame = Instance.new("Frame")
local HeaderFrame = Instance.new("Frame")
local Minimize = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local ImageLabel = Instance.new("ImageLabel")
local Title = Instance.new("TextLabel")
local Author = Instance.new("TextLabel")
local BackgroundFrame = Instance.new("Frame")
local MainFrame = Instance.new("Frame")
local CarsSoldLabel = Instance.new("TextLabel")
local AutofarmFrame = Instance.new("Frame")
local AutofarmLabel = Instance.new("TextLabel")
local ToggleButton = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local Frame = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local UIDragD = Instance.new("UIDragDetector")

local TweenS = game:GetService("TweenService")

local function RandomName(length)
	local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	local name = ""
	for i = 1, length do
		local rand = math.random(1, #chars)
		name = name .. chars:sub(rand, rand)
	end
	return name
end

FarmMainGUI.Name = RandomName(10)
FarmMainGUI.Parent = game.CoreGui
FarmMainGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainBackFrame.Name = "MainBackFrame"
MainBackFrame.Parent = FarmMainGUI
MainBackFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainBackFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainBackFrame.BackgroundTransparency = 1.000
MainBackFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
MainBackFrame.BorderSizePixel = 0
MainBackFrame.Position = UDim2.new(0.363565832, 0, 0.435950398, 0)
MainBackFrame.Size = UDim2.new(0, 263, 0, 214)
MainBackFrame.Active = false

UIDragD.Parent = MainBackFrame
UIDragD.BoundingUI = HeaderFrame

HeaderFrame.Name = "HeaderFrame"
HeaderFrame.Parent = MainBackFrame
HeaderFrame.Active = true
HeaderFrame.AnchorPoint = Vector2.new(0.5, 0.5)
HeaderFrame.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
HeaderFrame.BackgroundTransparency = 0.550
HeaderFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeaderFrame.BorderSizePixel = 0
HeaderFrame.ClipsDescendants = true
HeaderFrame.LayoutOrder = 1
HeaderFrame.Position = UDim2.new(0.497668833, 0, 0.125801876, 0)
HeaderFrame.Size = UDim2.new(0, 264, 0, 48)
HeaderFrame.ZIndex = 2

local HeaderFrameStroke = Instance.new("UIStroke")
HeaderFrameStroke.Parent = HeaderFrame
HeaderFrameStroke.Color = Color3.fromRGB(43, 43, 43)
HeaderFrameStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
HeaderFrameStroke.Thickness = 1
HeaderFrameStroke.Transparency = 0

Minimize.Name = "Minimize"
Minimize.Parent = HeaderFrame
Minimize.AnchorPoint = Vector2.new(0.5, 0.5)
Minimize.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
Minimize.BackgroundTransparency = 0.850
Minimize.BorderColor3 = Color3.fromRGB(0, 0, 0)
Minimize.BorderSizePixel = 0
Minimize.Position = UDim2.new(0.924242437, 0, 0.291666985, 0)
Minimize.Size = UDim2.new(0, 40, 0, 25)
Minimize.Font = Enum.Font.Unknown
Minimize.Text = ""
Minimize.TextColor3 = Color3.fromRGB(0, 0, 0)
Minimize.TextSize = 14.000
Minimize.TextWrapped = true

local MinimizedFrame = false

Minimize.MouseButton1Click:Connect(function()
	if MinimizedFrame == false then
		local CurTweenInfo = TweenInfo.new(
			0.5,
			Enum.EasingStyle.Sine,
			Enum.EasingDirection.In
		)
		TweenS:Create(MainFrame, CurTweenInfo, {Position = UDim2.new(0.498, 0,-0.774, 0)}):Play()
		MinimizedFrame = true
	else
		local CurTweenInfo = TweenInfo.new(
			0.5,
			Enum.EasingStyle.Sine,
			Enum.EasingDirection.In
		)
		TweenS:Create(MainFrame, CurTweenInfo, {Position = UDim2.new(0.498, 0,0.47, 0)}):Play()
		MinimizedFrame = false
	end
	
end)

local MinimizeStroke = Instance.new("UIStroke")
MinimizeStroke.Parent = Minimize
MinimizeStroke.Color = Color3.fromRGB(0, 255, 238)
MinimizeStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
MinimizeStroke.Thickness = 1
MinimizeStroke.Transparency = 0

UICorner.CornerRadius = UDim.new(0.300000012, 0)
UICorner.Parent = Minimize

ImageLabel.Parent = Minimize
ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0.5, 0, 0.465000004, 0)
ImageLabel.Size = UDim2.new(0, 40, 0, 24)
ImageLabel.Image = "rbxassetid://16381269"

Title.Name = "Title"
Title.Parent = HeaderFrame
Title.AnchorPoint = Vector2.new(0.5, 0.5)
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.390151501, 0, 0.291666657, 0)
Title.Size = UDim2.new(0, 206, 0, 29)
Title.Font = Enum.Font.GothamBold
Title.Text = "FIX IT UP AUTOFARM"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true

local TitleStroke = Instance.new("UIStroke")
TitleStroke.Parent = Title
TitleStroke.Color = Color3.fromRGB(0,0,0)
TitleStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
TitleStroke.Thickness = 2
TitleStroke.Transparency = 0

Author.Name = "Author"
Author.Parent = HeaderFrame
Author.AnchorPoint = Vector2.new(0.5, 0.5)
Author.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Author.BackgroundTransparency = 1.000
Author.BorderColor3 = Color3.fromRGB(0, 0, 0)
Author.BorderSizePixel = 0
Author.Position = UDim2.new(0.227272734, 0, 0.796371758, 0)
Author.Size = UDim2.new(0, 120, 0, 19)
Author.Font = Enum.Font.GothamBold
Author.Text = "Made by: Fake2Big"
Author.TextColor3 = Color3.fromRGB(255, 255, 255)
Author.TextScaled = true
Author.TextSize = 14.000
Author.TextWrapped = true

local AuthorStroke = Instance.new("UIStroke")
AuthorStroke.Parent = Author
AuthorStroke.Color = Color3.fromRGB(72, 0, 255)
AuthorStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
AuthorStroke.Thickness = 0.3
AuthorStroke.Transparency = 0

BackgroundFrame.Name = "BackgroundFrame"
BackgroundFrame.Parent = MainBackFrame
BackgroundFrame.AnchorPoint = Vector2.new(0.5, 0.5)
BackgroundFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BackgroundFrame.BackgroundTransparency = 1.000
BackgroundFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
BackgroundFrame.BorderSizePixel = 0
BackgroundFrame.ClipsDescendants = true
BackgroundFrame.LayoutOrder = 1
BackgroundFrame.Position = UDim2.new(0.497915298, 0, 0.627018631, 0)
BackgroundFrame.Size = UDim2.new(0, 284, 0, 164)
BackgroundFrame.ZIndex = 2
BackgroundFrame.Active = false

MainFrame.Name = "MainFrame"
MainFrame.Parent = BackgroundFrame
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(72, 72, 72)
MainFrame.BackgroundTransparency = 0.600
MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Position = UDim2.new(0.497823149, 0, 0.469637424, 0)
MainFrame.Size = UDim2.new(0.879999995, 0, 0.960294724, 0)
MainFrame.ZIndex = 0

CarsSoldLabel.Name = RandomName(9)
CarsSoldLabel.Parent = MainFrame
CarsSoldLabel.AnchorPoint = Vector2.new(0.5, 0.5)
CarsSoldLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CarsSoldLabel.BackgroundTransparency = 1.000
CarsSoldLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
CarsSoldLabel.BorderSizePixel = 0
CarsSoldLabel.Position = UDim2.new(0.49903971, 0, 0.246706083, 0)
CarsSoldLabel.Size = UDim2.new(0, 249, 0, 40)
CarsSoldLabel.Font = Enum.Font.Gotham
CarsSoldLabel.Text = "Sold cars: 0"
CarsSoldLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
CarsSoldLabel.TextScaled = true
CarsSoldLabel.TextSize = 14.000
CarsSoldLabel.TextWrapped = true

AutofarmFrame.Name = RandomName(9)
AutofarmFrame.Parent = MainFrame
AutofarmFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AutofarmFrame.BackgroundTransparency = 1.000
AutofarmFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
AutofarmFrame.BorderSizePixel = 0
AutofarmFrame.Position = UDim2.new(0, 0, 0.481541783, 0)
AutofarmFrame.Size = UDim2.new(0, 249, 0, 81)

local AutoFFstroke = Instance.new("UIStroke")
AutoFFstroke.Parent = AutofarmFrame
AutoFFstroke.Color = Color3.fromRGB(76, 0, 240)
AutoFFstroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
AutoFFstroke.Thickness = 0.6
AutoFFstroke.Transparency = 0.65

AutofarmLabel.Name = RandomName(9)
AutofarmLabel.Parent = AutofarmFrame
AutofarmLabel.AnchorPoint = Vector2.new(0.5, 0.5)
AutofarmLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AutofarmLabel.BackgroundTransparency = 1.000
AutofarmLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
AutofarmLabel.BorderSizePixel = 0
AutofarmLabel.Position = UDim2.new(0.367135942, 0, 0.508078098, 0)
AutofarmLabel.Size = UDim2.new(0, 182, 0, 40)
AutofarmLabel.Font = Enum.Font.Gotham
AutofarmLabel.Text = "TOGGLE AUTOFARM:"
AutofarmLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
AutofarmLabel.TextScaled = true
AutofarmLabel.TextSize = 14.000
AutofarmLabel.TextWrapped = true

ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = AutofarmFrame
ToggleButton.AnchorPoint = Vector2.new(0.5, 0.5)
ToggleButton.BackgroundColor3 = Color3.fromRGB(71, 0, 0)
ToggleButton.BackgroundTransparency = 0.350
ToggleButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
ToggleButton.BorderSizePixel = 0
ToggleButton.Position = UDim2.new(0.863625288, 0, 0.520040274, 0)
ToggleButton.Size = UDim2.new(0, 59, 0, 32)
ToggleButton.Font = Enum.Font.SourceSans
ToggleButton.Text = ""
ToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
ToggleButton.TextSize = 14.000

UICorner_2.CornerRadius = UDim.new(0.899999976, 0)
UICorner_2.Parent = ToggleButton

Frame.Parent = ToggleButton
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.219178081, 0, 0.5, 0)
Frame.Size = UDim2.new(0, 32, 0, 32)

UICorner_3.CornerRadius = UDim.new(1, 0)
UICorner_3.Parent = Frame

local Player = game.Players.LocalPlayer
local SearchedForName = "PitStop Repair2"
local MapFolder = game.Workspace:FindFirstChild("Map")
local SecondsToSell = 0
local CarFarAway = false
local DebugP = true
local JunkYardPos1 = CFrame.new(-1827.22705, 5.28211546, -385.016663)
local JunkYardPos2 = CFrame.new(-1719.62060546875, 8.656662940979004, -169.21669006347656)
local JunkYardPos3 = CFrame.new(-1593.890625, 9.363893508911133, -66.71568298339844)

local RepairShopPos = CFrame.new(-867.0195922851562, 4.924209117889404, -1300.7401123046875)

local SellGuyCarPos = CFrame.new(-1872.0494384765625, 4.898039817810059, -776.1437377929688)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local AutoFarm = false

local TotalCarsSold = 0

local ConfirmationRemote = ReplicatedStorage:WaitForChild("Events"):WaitForChild("HUD"):WaitForChild("Confirmation")

ToggleButton.MouseButton1Click:Connect(function()
	if AutoFarm == false then
		AutoFarm = true
		ToggleButton.BackgroundColor3 = Color3.fromRGB(33, 94, 0)
		Frame.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
		local NewTweenInfo = TweenInfo.new(
			0.2,
			Enum.EasingStyle.Sine,
			Enum.EasingDirection.In
		)
		TweenS:Create(Frame, NewTweenInfo, {Position = UDim2.new(0.728, 0,0.5, 0)}):Play()

		ConfirmationRemote.OnClientInvoke = function(message)
			if AutoFarm == true then
				return true
			else
				ConfirmationRemote.OnClientInvoke = nil

				return false
			end
		end
	else
		AutoFarm = false
		ToggleButton.BackgroundColor3 = Color3.fromRGB(71, 0, 0)
		Frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		local NewTweenInfo = TweenInfo.new(
			0.2,
			Enum.EasingStyle.Sine,
			Enum.EasingDirection.In
		)
		TweenS:Create(Frame, NewTweenInfo, {Position = UDim2.new(0.219, 0,0.5, 0)}):Play()

		ConfirmationRemote.OnClientInvoke = nil
	end
end)

-- Anti AFK:
local VirtualUser = game:GetService("VirtualUser")
Player.Idled:Connect(function()
	VirtualUser:CaptureController()
	VirtualUser:ClickButton2(Vector2.new(0,0))
	DebugPrint("🛡️ Anti-AFK triggered!")
end)

--Load repair station
Player:RequestStreamAroundAsync(Vector3.new(-832.043, 9.40005, -1300.34), 5)

-- Load SellCar
Player:RequestStreamAroundAsync(SellGuyCarPos.Position, 5)

-- DELETING MAYBE ANTICHEAT LOGS
local Logs = ReplicatedStorage:WaitForChild("Events"):FindFirstChild("ServerLogs")
local Webbhoks = ReplicatedStorage:FindFirstChild("SmurklesLib"):FindFirstChild("Modules"):FindFirstChild("DiscordWebhook")
if Logs then
	Logs:Destroy()
end
if Webbhoks then
	Webbhoks:Destroy()
end

-- Rename Pitstops
local PitStopNamingVal = 1
for _, v in pairs(MapFolder:GetChildren()) do
	if v.Name == "PitStop Repair" then
		v.Name = "PitStop Repair"..tostring(PitStopNamingVal)
		PitStopNamingVal += 1
	end
end

-- Sell Delay detection
Player.PlayerGui.ChildAdded:Connect(function(gui)
	if gui.Name == "HUD" then
		gui:WaitForChild("Notifications").ChildAdded:Connect(function(textL)
			if textL.ClassName == "TextLabel" then
				if string.find(textL.Text, "seconds to sell this car") then
					local FirstCrop = string.gsub(textL.Text, "You need to wait ", "")
					local SecondCrop = string.gsub(FirstCrop, " seconds to sell this car", "")
					local Seconds = tonumber(SecondCrop)
					--print("You need to wait ".. tostring(Seconds))
					SecondsToSell = Seconds + 1
				end
			end
		end)
	end
end)

Player.PlayerGui:WaitForChild("HUD"):WaitForChild("Notifications").ChildAdded:Connect(function(textL)
	if textL.ClassName == "TextLabel" then
		if string.find(textL.Text, "seconds to sell this car") then
			local FirstCrop = string.gsub(textL.Text, "You need to wait ", "")
			local SecondCrop = string.gsub(FirstCrop, " seconds to sell this car", "")
			local Seconds = tonumber(SecondCrop)
			--print("You need to wait ".. tostring(Seconds))
			SecondsToSell = Seconds + 1
		elseif string.find(textL.Text, "Car is too far from the sell zone")then
			CarFarAway = true
		end
	end
end)

function DebugPrint(message)
	if DebugP == true then
		print(message)
	end
end

function DebugWarn(message)
	if DebugP == true then
		warn(message)
	end
end

function GetOwnedCars() -- Get all owned cars
	local GaragePath = Player:FindFirstChild("PlayerData"):FindFirstChild("Garage")
	if GaragePath then
		local ownedCars = {}
		for _, car in pairs(GaragePath:GetChildren()) do
			table.insert(ownedCars, car)
		end
		return ownedCars
	end
	return nil
end

function GetCurrentCar() -- Get current used car
	local VehicleModelsPath = game.Workspace:FindFirstChild("Vehicles")
	local OwnedCars = GetOwnedCars()
	if VehicleModelsPath and OwnedCars and #OwnedCars > 0 then
		for _, CarModel in pairs(VehicleModelsPath:GetChildren()) do
			for _, OwnedCar in pairs(OwnedCars) do
				if CarModel.Name == OwnedCar.Name then
					return CarModel
				end
			end
		end
	end
	return nil
end

local FakePlatePosition = Vector3.new(-141, -2800, -1585)
local SafePlaceAfterStop = CFrame.new(-2025, 12, -318)

local function GetCarRoot(Vehicle)
	local body = Vehicle:FindFirstChild("Body")
	if body then
		return body:FindFirstChild("#Weight") or body:FindFirstChild("Engine")
	end

	return Vehicle:FindFirstChildWhichIsA("VehicleSeat", true)
end

if not game.Workspace:FindFirstChild("DrivingPlatePart") then
	local NewFakePlate = Instance.new("Part")
	NewFakePlate.Name = "DrivingPlatePart"
	NewFakePlate.Anchored = true
	NewFakePlate.Position = FakePlatePosition
	NewFakePlate.Size = Vector3.new(1500, 1, 1500)
	NewFakePlate.Parent = game.Workspace
end

function DriveDistance(Vehicle, additionalKm)
	local seat = Vehicle:FindFirstChildWhichIsA("VehicleSeat", true)
	local wheels = Vehicle:FindFirstChild("Wheels", true)
	if not wheels or not seat then return false end
	local FakePlate = game.Workspace:FindFirstChild("DrivingPlatePart")

	FakePlate.Position = FakePlatePosition

	teleportBrokenCar(Vehicle, FakePlate.CFrame * CFrame.new(0, 5, 0))

	-- 2. KONFIGURACJA SILNIKÓW I SKRĘTU
	local motors = {}
	local steeringHinges = {}

	for _, child in pairs(wheels:GetDescendants()) do
		if child:IsA("HingeConstraint") then
			if child.Name == "#AV" or child.Name == "#BV" then
				table.insert(motors, child)
				child.ActuatorType = Enum.ActuatorType.Motor
			elseif child.Name == "#SV" then -- #SV to zazwyczaj Steer Version (Servo)
				table.insert(steeringHinges, child)
				child.ActuatorType = Enum.ActuatorType.Servo
			end
		end
	end

	local mileageVal = Player.PlayerData.Status.KMs
	local targetKm = tonumber(mileageVal.Value) + additionalKm

	local pbrakeTimer = tick()
	local SteerTimer = tick()

	local CurrentSteer = "Left"

	local SteerLeftBind = game:GetService("ReplicatedStorage"):WaitForChild("ClientScripts").Client.Binds.Cache:WaitForChild("SteerLeft")
	local SteerRightBind = game:GetService("ReplicatedStorage"):WaitForChild("ClientScripts").Client.Binds.Cache:WaitForChild("SteerRight")
	local pbind = game:GetService("ReplicatedStorage"):WaitForChild("ClientScripts").Client.Binds.Cache:WaitForChild("PBrake")

	while tonumber(mileageVal.Value) < targetKm do
		local now = tick()
		-- 3. USTAWIANIE PRĘDKOŚCI (Brute Force)
		-- 300-500 w AngularVelocity powinno dać dużą prędkość
		for _, motor in pairs(motors) do
			motor.MotorMaxTorque = 1e7
			motor.MotorMaxAcceleration = 1e5
			motor.AngularVelocity = 350 
		end


		if now - pbrakeTimer > 0.3 then
			pbrakeTimer = now
			pbind:Fire(Vector3.new(0, 0, 1))
		end

		if now - SteerTimer > 5 then
			SteerTimer = now
			if CurrentSteer == "Left" then
				CurrentSteer = "Reset"
				SteerLeftBind:Fire(CFrame.new(2, 0, 0))
			elseif CurrentSteer == "Right" then
				CurrentSteer = "Left"
				SteerRightBind:Fire(CFrame.new(2, 0, 0))
			elseif CurrentSteer == "Reset" then
				CurrentSteer = "Right"
				SteerRightBind:Fire(CFrame.new(0, 0, 0))
				SteerLeftBind:Fire(CFrame.new(0, 0, 0))
				
			end
		end


		-- 5. STABILIZACJA (CFrame)
		local rootPos = seat.Position

		-- Przesuwamy płytę pod auto
		FakePlate.CFrame = CFrame.new(rootPos.X, FakePlatePosition.Y, rootPos.Z)

		task.wait()
		if AutoFarm == false then
			for _, motor in pairs(motors) do motor.AngularVelocity = 0 end
			for _, s in pairs(Vehicle:GetDescendants()) do
				if s:IsA("LocalScript") and (s.Name == "Drive" or s.Name == "Interface") then
					s.Disabled = false
				end
			end
			teleportBrokenCar(Vehicle, SafePlaceAfterStop)
			return false
		end
	end

	-- 6. PRZYWRACANIE (Opcjonalne, jeśli chcesz potem jeździć normalnie)
	for _, motor in pairs(motors) do motor.AngularVelocity = 0 end
	for _, s in pairs(Vehicle:GetDescendants()) do
		if s:IsA("LocalScript") and (s.Name == "Drive" or s.Name == "Interface") then
			s.Disabled = false
		end
	end
	return true
end

function FindRepairShop() -- Get repair station model
	for _, v in pairs(MapFolder:GetChildren()) do
		if v.Name == SearchedForName then
			if v:FindFirstChild("NoCleanup") then
				return v, v:FindFirstChild("NoCleanup")
			else
				Player:RequestStreamAroundAsync(Vector3.new(-832.043, 9.40005, -1300.34), 5)
				task.wait(0.1)
				if v:FindFirstChild("NoCleanup") then
					return v, v:FindFirstChild("NoCleanup")
				end
			end
		end
	end
	return nil, nil
end

function GetMachines(RepairShop, MachineName) -- Get all avaible repair machines
	local Machines = {}

	for _, v in pairs(RepairShop:GetChildren()) do
		if v.Name == MachineName then
			local ParticleE = nil

			local success = pcall(function()
				if MachineName == "GrindingMachine" then
					local drill = v:FindFirstChild("Drill")
					local att = drill and drill:FindFirstChild("Attachment")
					ParticleE = att and att:FindFirstChild("CUTS")
				elseif MachineName == "BatteryCharger" then
					local clamps = v:FindFirstChild("Clamps")
					local neg = clamps and clamps:FindFirstChild("Negative")
					local clamp = neg and neg:FindFirstChild("Clamp")
					local primary = clamp and clamp:FindFirstChild("Primary")
					ParticleE = primary and primary:FindFirstChild("Particles")
				elseif MachineName == "PartsWasher" then
					local water = v:FindFirstChild("Water")
					local att = water and water:FindFirstChild("Attachment")
					ParticleE = att and att:FindFirstChild("MAIN SPRAY")
				end
			end)

			if success and ParticleE then
				if ParticleE.Enabled == false then
					table.insert(Machines, v)
				end
			else
				DebugPrint("not loaded yet, requesting stream")
				ParticleE = nil
				if MachineName == "GrindingMachine" then
					repeat
						Player:RequestStreamAroundAsync(v:GetModelCFrame().p, 5)
						task.wait(0.3)
						local drill = v:FindFirstChild("Drill")
						local att = drill and drill:FindFirstChild("Attachment")
						ParticleE = att and att:FindFirstChild("CUTS")
					until ParticleE or AutoFarm == false

				elseif MachineName == "BatteryCharger" then
					repeat
						Player:RequestStreamAroundAsync(v:GetModelCFrame().p, 5)
						task.wait(0.3)
						local clamps = v:FindFirstChild("Clamps")
						local neg = clamps and clamps:FindFirstChild("Negative")
						local clamp = neg and neg:FindFirstChild("Clamp")
						local primary = clamp and clamp:FindFirstChild("Primary")
						ParticleE = primary and primary:FindFirstChild("Particles")	
					until ParticleE or AutoFarm == false

				elseif MachineName == "PartsWasher" then
					repeat
						Player:RequestStreamAroundAsync(v:GetModelCFrame().p, 5)
						task.wait(0.3)
						local water = v:FindFirstChild("Water")
						local att = water and water:FindFirstChild("Attachment")
						ParticleE = att and att:FindFirstChild("MAIN SPRAY")	
					until ParticleE or AutoFarm == false

				end
				if ParticleE and ParticleE.Enabled == false then
					table.insert(Machines, v)
				end
			end
		end
	end
	if #Machines <= 0 then
		return nil
	else
		return Machines
	end
end

function GetVehicleParts(Vehicle) -- Get all parts in car
	local Parts = {}
	if Vehicle:FindFirstChild("Values"):FindFirstChild("Engine") then
		for _, v in pairs(Vehicle.Values.Engine:GetChildren()) do
			if v.ClassName == "StringValue" then
				if v.Value ~= "" and v.Value ~= " " and v.Value then
					table.insert(Parts, v.Name)
				end
			end
		end

		if #Parts == 0 then
			return nil
		end
		return Parts
	end
	return nil
end

function RemovePart(Vehicle, Part)
	local PartsEvent = Vehicle:FindFirstChild("PartsEvent")
	if PartsEvent then
		PartsEvent:FireServer("RemovePart", Part)
		return true
	end

	return nil
end

function InstallPart(Vehicle, Part)
	local PartsEvent = Vehicle:FindFirstChild("PartsEvent")
	if PartsEvent then
		PartsEvent:FireServer("ReapplyPart", Part)
		return true
	end

	return nil
end

function GetWearedMovableParts() -- Get all weared moveable parts
	local MoveableParts = game.Workspace:FindFirstChild("MoveableParts")

	if MoveableParts then
		local Parts = {}

		for _, mPart in pairs(MoveableParts:GetChildren()) do
			if mPart:FindFirstChild("PartInfo") then
				local Owner = mPart:GetAttribute("Owner")
				local Wear = mPart:GetAttribute("Wear")
				if Owner == Player.Name then
					if Wear and Wear ~= 0 then
						table.insert(Parts, mPart)
					end
				end
			end
		end

		return Parts
	end

	return nil
end

function GetMoveableParts() -- Get all moveable parts except injectors, sparkplugs, timingbelts
	local MoveableParts = game.Workspace:FindFirstChild("MoveableParts")

	if MoveableParts then
		local Parts = {}

		for _, mPart in pairs(MoveableParts:GetChildren()) do
			if mPart:FindFirstChild("PartInfo") then
				local Owner = mPart:GetAttribute("Owner")
				if Owner == Player.Name and mPart.Name ~= "Injectors" and mPart.Name ~= "Sparkplugs" and mPart.Name ~= "TimingBelt" then
					table.insert(Parts, mPart)
				end
			end
		end

		return Parts
	end

	return nil
end

function GetToMachineParts(Parts, Machine) -- Returns all parts that can be used in a machine
	local ToGrind = {}
	if Parts then
		for _, Part in pairs(Parts) do
			if Part:GetAttribute("RepairMachine") == Machine then
				table.insert(ToGrind, Part)
			end
		end
		if #ToGrind > 0 then
			return ToGrind
		end
	end
	return nil
end

function PaintCar(Vehicle) -- Paint car if rusted
	local ValuesFolder = Vehicle:FindFirstChild("Values")
	local Character = Player.Character
	local Humanoid = Character:FindFirstChild("Humanoid")
	if Character and Humanoid then
		Humanoid.Sit = false
	end
	task.wait()
	if ValuesFolder then
		local PaintColor = ValuesFolder:FindFirstChild("PaintColor")
		if PaintColor then
			if string.find(PaintColor.Value, "Rust") then
				local PaintRemote = ReplicatedStorage:FindFirstChild("Events"):FindFirstChild("Vehicles"):FindFirstChild("SetPaint")
				if PaintRemote then
					DebugPrint("Painting car")
					PaintRemote:FireServer("Car", Vehicle, Color3.new(0.129412, 0.129412, 0.129412))
					task.wait(0.2)
					if string.find(PaintColor.Value, "Rust") then
						repeat
							if Character and Humanoid and Vehicle then
								DebugPrint("(PaintCar) repeating painting process")
								TeleportOnlyPlayer(Vehicle:GetPivot())
								task.wait(0.3)
								Humanoid.Sit = false
								task.wait(0.1)
								if string.find(PaintColor.Value, "Rust") then
									PaintRemote:FireServer("Car", Vehicle, Color3.new(0.129412, 0.129412, 0.129412))
								end
							else
								break
							end
						until not string.find(PaintColor.Value, "Rust") or GetCurrentCar() ~= Vehicle or AutoFarm == false
						if AutoFarm == false then
							return false
						end
						return true
					else
						return true
					end
				end
			else
				DebugPrint("Car already painted")
			end
		end
	end
end


function WaitUntilRepaired(part)
	if not part or not part.Parent then return false end
	if part:GetAttribute("Wear") == 0 then return true end

	local timeout = 0
	local maxWait = 120

	while part and part.Parent and part:GetAttribute("Wear") > 0 and AutoFarm == true do
		task.wait(0.5)
		timeout = timeout + 0.5

		if timeout >= maxWait then
			DebugWarn("Timeout: Part " .. part.Name .. " was not fixed after long period of time!.")
			break 
		end
	end

	-- Zwracamy true tylko, jeśli faktycznie się naprawiło
	if part and part.Parent and part:GetAttribute("Wear") == 0 then
		return true
	end

	return false
end

function teleportBrokenCar(carModel, targetCFrame) -- Safe teleport car
	local seat = carModel:FindFirstChildWhichIsA("VehicleSeat", true) or carModel:FindFirstChild("DriveSeat", true)

	if not seat then
		return nil
	end

	if seat then
		if not seat.Occupant then
			repeat
				--TeleportOnlyPlayer(seat.CFrame)
				seat:Sit(Player.Character.Humanoid)
				task.wait(0.1)
			until seat.Occupant and seat.Occupant.Parent == Player.Character or AutoFarm == false
			if AutoFarm == false then
				return false
			end
		end

		carModel.PrimaryPart = seat

		local attempts = 0
		repeat
			carModel:SetPrimaryPartCFrame(targetCFrame)

			for _, part in pairs(carModel:GetDescendants()) do
				if part:IsA("BasePart") then
					part.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
					part.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
				end
			end

			task.wait(0.3)
			attempts = attempts + 1

			local distance = (seat.Position - targetCFrame.Position).Magnitude
		until distance < 5 or attempts > 15 or AutoFarm == false
		if AutoFarm == false then
			return false
		end
		task.wait(0.3)
		return true
	else
		return nil
	end
end

function FindBestCar() -- returns the most expensive car that can be bought
	local Vehicles = game.Workspace:WaitForChild("Vehicles", 5)
	if not Vehicles then 
		DebugWarn("[FindBestCar] - Vehicles folder not found1")
		return nil 
	end
	local MoneyVal = game.Players.LocalPlayer:WaitForChild("PlayerData"):WaitForChild("Status"):WaitForChild("Money")
	local Money = tonumber(MoneyVal.Value) or 0
	local bestCar = nil
	local MaxCost = 0

	for _, car in pairs(Vehicles:GetChildren()) do
		if car:GetAttribute("Junkyard") == true then
			local pricesStr = tostring(car:GetAttribute("Price"))
			local priceSplit = string.split(pricesStr, " ")
			local priceMax = tonumber(priceSplit[2]) or tonumber(priceSplit[1]) or 0

			if Money >= priceMax then
				if priceMax > MaxCost then
					MaxCost = priceMax
					bestCar = car
				end
			end
		end
	end

	if bestCar then
		return bestCar
	else
		return nil
	end
end

function TeleportOnlyPlayer(NewPos)
	local char = Player.Character
	local hrp = char and char:FindFirstChild("HumanoidRootPart")
	local hum = char and char:FindFirstChildOfClass("Humanoid")

	if not hrp or not hum then return false end

	repeat
		hum.Sit = false
		task.wait(0.1)
		hrp.CFrame = NewPos

		local distance = (hrp.Position - NewPos.Position).Magnitude

	until distance < 0.5 or AutoFarm == false

	if AutoFarm == false then
		return false
	end
	return true
end

function SellCar(Vehicle) -- sells car
	local Map = game.Workspace:FindFirstChild("Map")
	if not Map then
		return false
	end
	local SellCargGuy = Map:FindFirstChild("SellCar")
	if not SellCargGuy then
		DebugWarn("[SellCar] - SellCar guy not found, requesting stream")
		repeat
			Player:RequestStreamAroundAsync(Vector3.new(-1900.25, 4.57531, -783.911), 5)
			task.wait(0.2)
			teleportBrokenCar(Vehicle, SellGuyCarPos)
			task.wait(0.2)
		until Map:FindFirstChild("SellCar") or AutoFarm == false
		if AutoFarm == false then
			return false
		end
		SellCargGuy = Map:FindFirstChild("SellCar")
	end

	local SellCarGuyHRP = SellCargGuy:FindFirstChild("HumanoidRootPart")
	if not SellCarGuyHRP then
		DebugWarn("[SellCar] - SellCar guy HumanoidRootPart not found, requesting stream (updated 2)")
		repeat
			Player:RequestStreamAroundAsync(SellCargGuy:GetModelCFrame().p, 5)
			task.wait(0.2)
			teleportBrokenCar(Vehicle, SellGuyCarPos)
			task.wait(0.2)
		until SellCargGuy:FindFirstChild("HumanoidRootPart") or AutoFarm == false
		if AutoFarm == false then
			return false
		end
		SellCarGuyHRP = SellCargGuy:FindFirstChild("HumanoidRootPart")
	end

	local prompt = SellCargGuy:FindFirstChild("Prompt").ProximityPrompt
	if SellCarGuyHRP and prompt then
		local VehicleName = Vehicle.Name
		teleportBrokenCar(Vehicle, SellCarGuyHRP.CFrame * CFrame.new(0, 5, -20))
		task.wait(0.5)
		TeleportOnlyPlayer(SellCarGuyHRP.CFrame * CFrame.new(math.random(-5, 5), math.random(0, 5), -5))
		task.wait(0.4)
		fireproximityprompt(prompt)
		task.wait(1)
		if SecondsToSell > 0 then
			DebugPrint("Waiting for delay to end")
			local waitTime = SecondsToSell
			repeat
				task.wait(1)
				waitTime = waitTime - 1
			until waitTime <= 0 or AutoFarm == false
			SecondsToSell = 0
			if AutoFarm == false then
				return false
			end

			task.wait()
			TeleportOnlyPlayer(SellCarGuyHRP.CFrame * CFrame.new(math.random(-5, 5), math.random(0, 5), -5))
			task.wait(0.3)
			fireproximityprompt(prompt)
			task.wait(0.3)
			if GetCurrentCar() ~= nil then
				if GetCurrentCar().Name ~= VehicleName then return false end
				repeat
					DebugPrint("repeating until car sold")
					if CarFarAway == true then
						DebugPrint("[SellCar] - Car is far away, teleporting")
						teleportBrokenCar(Vehicle, SellCarGuyHRP.CFrame * CFrame.new(0, 5, -20))
						task.wait(0.2)
					end
					TeleportOnlyPlayer(SellCarGuyHRP.CFrame * CFrame.new(math.random(-5, 5), math.random(0, 5), -5))
					task.wait(0.3)
					fireproximityprompt(prompt)
				until GetCurrentCar() == nil and not table.find(GetOwnedCars(), VehicleName) or AutoFarm == false
				if AutoFarm == false then
					return false
				end
				CarFarAway = false
				return true
			else
				if not table.find(GetOwnedCars(), VehicleName) then
					CarFarAway = false
					return true
				else
					return false
				end
			end
		else
			task.wait(0.1)
			if GetCurrentCar() ~= nil then
				repeat
					DebugPrint("repeating until car sold")
					TeleportOnlyPlayer(SellCarGuyHRP.CFrame * CFrame.new(math.random(-5, 5), math.random(0, 5), -5))
					task.wait(0.3)
					fireproximityprompt(prompt)
				until GetCurrentCar() == nil or AutoFarm == false
				if AutoFarm == false then
					return false
				end
				CarFarAway = false
				return true
			else
				CarFarAway = false
				return true
			end
		end
	else
		if game.Workspace:FindFirstChild("Map"):FindFirstChild("SellCar") then
			Player:RequestStreamAroundAsync(game.Workspace:FindFirstChild("Map"):FindFirstChild("SellCar"):GetModelCFrame().p, 5)
		end
		return false
	end
end

function InstallAllParts(CurrentCar) -- Installs every part on the ground to the car
	DebugPrint("Installing all parts")
	local RestParts = GetMoveableParts()
	if RestParts and #RestParts > 0 then
		local RPEngineBlock = nil
		for _, part in pairs(RestParts) do
			if part.Name == "EngineBlock" then
				RPEngineBlock = part
			end
		end

		if RPEngineBlock then
			DebugPrint("Installing engine block")
			InstallPart(CurrentCar, RPEngineBlock)

			local success = false
			for i = 1, 20 do
				local engineVal = CurrentCar:WaitForChild("Values"):WaitForChild("Engine")
				if engineVal:FindFirstChild("EngineBlock") and engineVal.EngineBlock.Value ~= "" and engineVal.EngineBlock.Value ~= " "  then
					success = true
					break
				end
				task.wait(0.1)
			end

			if not success then
				DebugWarn("[InstallAllParts] - Could not install engine block!")
				return false
			end
		end

		task.wait(0.3)

		local CurrentVparts = GetVehicleParts(CurrentCar)
		if CurrentVparts then
			local EngineBlockNotFound = true
			for _, part in pairs(CurrentVparts) do
				if part == "EngineBlock" then
					EngineBlockNotFound = false
				end
			end

			if EngineBlockNotFound == true then
				DebugPrint("Engine block not found on the car!")
				return false
			end
		end

		for _, part in pairs(RestParts) do
			if part.Name ~= "EngineBlock" and part.Name ~= "Sparkplugs" and part.Name ~= "Injectors" and part.Name ~= "TimingBelt" then
				InstallPart(CurrentCar, part)
				task.wait(0.1)
			end
		end
		task.wait(0.1)
		return true
	else
		return false
	end
end

function CleanUpUselessParts()
	local MoveableParts = game.Workspace:FindFirstChild("MoveableParts")
	local TrashPart = game.Workspace:FindFirstChild("Map"):FindFirstChild("PartTrashCan")

	if MoveableParts and TrashPart and TrashPart.PrimaryPart then
		local Parts = {}

		for _, mPart in pairs(MoveableParts:GetChildren()) do
			if mPart:FindFirstChild("PartInfo") then
				local Owner = mPart:GetAttribute("Owner")
				if Owner == Player.Name and mPart.Name == "Injectors" or mPart.Name == "Sparkplugs" or mPart.Name == "TimingBelt" then
					table.insert(Parts, mPart)
				end
			end
		end

		if #Parts > 0 and #Parts > 5 then
			for _, mPart in pairs(Parts) do
				if mPart.PrimaryPart then
					mPart.PrimaryPart.CFrame = TrashPart.PrimaryPart.CFrame
					task.wait(0.2)
				else
					DebugWarn("[CleanUpUselessParts] - No primary part for part: " .. mPart.Name)
				end

			end
			DebugPrint("Cleaned up useless parts")
		end

	end
end

function StartGrindingMachines(ToGrindParts, GMachinesTable, RepairingParts)
	for index, Rpart in pairs(ToGrindParts) do
		local Machine = GMachinesTable[index]
		if not Machine or not Machine.Parent or not Rpart.Parent then continue end

		local Detector = Machine:FindFirstChild("Detector")
		if not Detector then
			local RepeatCount = 0
			repeat
				Player:RequestStreamAroundAsync(Machine:GetModelCFrame().p, 5)
				task.wait(0.4)
				RepeatCount += 1
			until Machine and Machine:FindFirstChild("Detector") or AutoFarm == false or RepeatCount >= 30
			if AutoFarm == false then
				return false
			end
		end

		Detector = Machine:FindFirstChild("Detector")
		if Machine and Detector and Rpart.PrimaryPart then
			Rpart.PrimaryPart.CFrame = Detector.CFrame
			task.wait(0.2)
			local Button = Machine:FindFirstChild("Button")
			local Drill = Machine:FindFirstChild("Drill")
			local Attachment = Drill and Drill:FindFirstChild("Attachment")
			local ParticleE = Attachment and Attachment:FindFirstChild("CUTS")
			if Button and ParticleE then
				local RepeatCount = 0
				repeat
					if Rpart.PrimaryPart then
						fireclickdetector(Button:FindFirstChild("ClickDetector"))
						task.wait(0.3)
						Rpart.PrimaryPart.CFrame = Detector.CFrame
						RepeatCount += 1
					else
						break
					end
				until (ParticleE and ParticleE.Enabled == true) or AutoFarm == false or RepeatCount >= 30
				if AutoFarm == false then
					return false
				end
				task.wait()
				if ParticleE.Enabled == true then
					table.insert(RepairingParts, Rpart)
				end
			else
				return false
			end
		else
			continue
		end
	end
	return RepairingParts
end

function StartWashingMachines(ToWashParts, PWashersTable, RepairingParts)
	for index, Rpart in pairs(ToWashParts) do
		local Machine = PWashersTable[index]
		if not Machine or not Machine.Parent or not Rpart.Parent then continue end

		local Detector = Machine:FindFirstChild("Detector")
		if not Detector then
			local RepeatCount = 0
			repeat
				Player:RequestStreamAroundAsync(Machine:GetModelCFrame().p, 5)
				task.wait(0.4)
				RepeatCount += 1
			until (Machine:FindFirstChild("Detector")) or AutoFarm == false or RepeatCount >= 30
			if AutoFarm == false then
				return false
			end
		end

		Detector = Machine:FindFirstChild("Detector")
		if Machine and Detector and Rpart.PrimaryPart then
			Rpart.PrimaryPart.CFrame = Detector.CFrame
			task.wait(0.2)

			local Button = Machine:FindFirstChild("Faucet")
			local Water = Machine:FindFirstChild("Water")
			local Attachment = Water and Water:FindFirstChild("Attachment")
			local ParticleE = Attachment and Attachment:FindFirstChild("MAIN SPRAY")

			if Button and ParticleE then
				local RepeatCount = 0
				repeat
					if Rpart.PrimaryPart then
						fireclickdetector(Button:FindFirstChild("ClickDetector"))
						task.wait(0.3)
						Rpart.PrimaryPart.CFrame = Detector.CFrame
						RepeatCount += 1
					else
						break
					end
				until (ParticleE and ParticleE.Enabled == true) or AutoFarm == false or RepeatCount >= 30

				if AutoFarm == false then
					return false
				end

				if ParticleE.Enabled == true then
					table.insert(RepairingParts, Rpart)
				end
			else
				return false
			end
		end
	end
	return RepairingParts
end

function StartChargingMachines(ToChargeParts, BChargersTable, RepairingParts)
	for index, Rpart in pairs(ToChargeParts) do
		local Machine = BChargersTable[index]
		if not Machine or not Machine.Parent or not Rpart.Parent then continue end

		local Detector = Machine:FindFirstChild("Detector")
		if not Detector then
			local RepeatCount = 0
			repeat
				Player:RequestStreamAroundAsync(Machine:GetModelCFrame().p, 5)
				task.wait(0.4)
				RepeatCount += 1
			until (Machine:FindFirstChild("Detector")) or AutoFarm == false or RepeatCount >= 30
			if AutoFarm == false then return false end
		end

		Detector = Machine:FindFirstChild("Detector")
		if Detector and Rpart.PrimaryPart then
			Rpart.PrimaryPart.CFrame = Detector.CFrame
			task.wait(0.2)

			local Button = Machine:FindFirstChild("Button")

			local Clamps = Machine:FindFirstChild("Clamps")
			local Neg = Clamps and Clamps:FindFirstChild("Negative")
			local Clamp = Neg and Neg:FindFirstChild("Clamp")
			local Primary = Clamp and Clamp:FindFirstChild("Primary")
			local ParticleE = Primary and Primary:FindFirstChild("Particles")

			if Machine and Button and ParticleE then
				local RepeatCount = 0
				repeat
					if Rpart.Parent and Rpart.PrimaryPart then
						fireclickdetector(Button:FindFirstChild("ClickDetector"))
						task.wait(0.3)
						Rpart.PrimaryPart.CFrame = Detector.CFrame
						RepeatCount += 1
					else
						break
					end
				until (ParticleE and ParticleE.Enabled == true) or AutoFarm == false or RepeatCount >= 30

				if AutoFarm == false then
					return false
				end

				if ParticleE.Enabled == true then
					table.insert(RepairingParts, Rpart)
				end
			else
				return false
			end
		end
	end
	return RepairingParts
end

function FixParts()
	local CurrentCar = GetCurrentCar()

	local RepairShop, TeleportPart = FindRepairShop()

	if CurrentCar then
		task.wait(1)
		teleportBrokenCar(CurrentCar, RepairShopPos)
		task.wait(0.5)
	end

	if CurrentCar and RepairShop and TeleportPart then
		local GMachinesTable = GetMachines(RepairShop, "GrindingMachine")
		local BChargersTable = GetMachines(RepairShop, "BatteryCharger")
		local PWashersTable = GetMachines(RepairShop, "PartsWasher")

		if GMachinesTable == nil or BChargersTable == nil or PWashersTable == nil then
			return false
		end

		local VehicleParts = GetVehicleParts(CurrentCar)
		if VehicleParts and #VehicleParts > 0 then -- Remove every part
			task.wait(0.5)
			TeleportOnlyPlayer(TeleportPart.CFrame * CFrame.new(0, 1, 4))
			task.wait(1)

			for _, part in pairs(VehicleParts) do
				RemovePart(CurrentCar, part)
				task.wait(0.15)
			end
		end

		task.wait(0.3)
		VehicleParts = nil
		local ToRepair = GetWearedMovableParts()
		if ToRepair and #ToRepair > 0 then
			local RepairingParts = {}

			local ToGrindParts = GetToMachineParts(ToRepair, "GrindingMachine")
			local ToWashParts = GetToMachineParts(ToRepair, "PartsWasher")
			local ToChargeParts = GetToMachineParts(ToRepair, "BatteryCharger")

			local function FullCleanup()
				ToRepair = nil
				RepairingParts = nil
				ToGrindParts = nil
				ToWashParts = nil
				ToChargeParts = nil
				GMachinesTable = nil
				BChargersTable = nil
				PWashersTable = nil
			end

			if ToGrindParts and #ToGrindParts > 0 then -- To grinding machine parts fixing
				if #GMachinesTable >= #ToGrindParts then -- When theres enough machines
					local GrindingTable = StartGrindingMachines(ToGrindParts, GMachinesTable, RepairingParts)
					if GrindingTable then
						RepairingParts = GrindingTable
					else
						FullCleanup()
						return false
					end
				else
					local Currentrepeat = 0
					repeat
						task.wait(0.5)
						Currentrepeat += 1
					until GetMachines(RepairShop, "GrindingMachine") and #GetMachines(RepairShop, "GrindingMachine") >= #ToGrindParts or AutoFarm == false or Currentrepeat >= 10

					if AutoFarm == false or Currentrepeat >= 10 then
						FullCleanup()
						return false
					end

					-- Fix parts
					local GrindingTable = StartGrindingMachines(ToGrindParts, GMachinesTable, RepairingParts)
					if GrindingTable then
						RepairingParts = GrindingTable
					else
						FullCleanup()
						return false
					end

				end
			end

			if ToWashParts and #ToWashParts > 0 then -- To washing parts fixing
				if #PWashersTable >= #ToWashParts then
					local WashingTable = StartWashingMachines(ToWashParts, PWashersTable, RepairingParts)
					if WashingTable then
						RepairingParts = WashingTable
					else
						FullCleanup()
						return false
					end
				else
					local Currentrepeat = 0
					repeat
						task.wait(0.5)
						Currentrepeat += 1
					until GetMachines(RepairShop, "PartsWasher") and #GetMachines(RepairShop, "PartsWasher") >= #ToWashParts or AutoFarm == false or Currentrepeat >= 10

					if AutoFarm == false or Currentrepeat >= 10 then
						FullCleanup()
						return false
					end

					-- Fix parts
					local WashingTable = StartWashingMachines(ToWashParts, PWashersTable, RepairingParts)
					if WashingTable then
						RepairingParts = WashingTable
					else
						FullCleanup()
						return false
					end
				end
			end

			if ToChargeParts and #ToChargeParts > 0 then
				if #BChargersTable >= #ToChargeParts then
					local ChargingTable = StartChargingMachines(ToChargeParts, BChargersTable, RepairingParts)
					if ChargingTable then
						RepairingParts = ChargingTable
					else
						FullCleanup()
						return false
					end
				else
					local Currentrepeat = 0
					repeat
						task.wait(0.5)
						Currentrepeat += 1
					until GetMachines(RepairShop, "BatteryCharger") and #GetMachines(RepairShop, "BatteryCharger") >= #ToChargeParts or AutoFarm == false or Currentrepeat >= 10

					if AutoFarm == false or Currentrepeat >= 10 then
						FullCleanup()
						return false
					end

					-- Fix parts
					local ChargingTable = StartChargingMachines(ToChargeParts, BChargersTable, RepairingParts)
					if ChargingTable then
						RepairingParts = ChargingTable
					else
						FullCleanup()
						return false
					end
				end
			end

			-- Install parts
			if RepairingParts and #RepairingParts > 0 then
				-- Installing engine block
				local EngineBlock = nil
				local EngineBlockIndex = nil
				for index, part in pairs(RepairingParts) do
					if part.Name == "EngineBlock" then
						EngineBlock = part
						EngineBlockIndex = index
					end
				end
				if EngineBlockIndex and EngineBlock then
					table.remove(RepairingParts, EngineBlockIndex)
				end

				if EngineBlock then
					DebugPrint("Waiting for EngineBlock repair")
					local success = WaitUntilRepaired(EngineBlock)
					if success == false then
						FullCleanup()
						return false
					end
				end
				task.wait(0.1)
				-- wait until repair for other parts
				for _, part in pairs(RepairingParts) do
					local success = WaitUntilRepaired(part)
					if success == false then
						FullCleanup()
						return false
					end
				end
				-- Installing other parts
				local success = InstallAllParts(CurrentCar)
				FullCleanup()
				if success then
					return true
				else
					return false
				end
			else
				local success = InstallAllParts(CurrentCar)
				FullCleanup()
				if success then
					return true
				else 
					return false
				end
			end
		else
			-- No parts to repair - install all
			local InstallPartsSucc = InstallAllParts(CurrentCar)
			ToRepair = nil
			GMachinesTable = nil
			BChargersTable = nil
			PWashersTable = nil
			if InstallPartsSucc then
				return true
			else
				return false
			end
		end
	else
		DebugWarn("Car not detected/Repairshop not detected")
		return false
	end
end

function GetCarCondition(Vehicle)
	local EngineFolder = Vehicle:FindFirstChild("Values"):FindFirstChild("Engine")
	local WearFolder = EngineFolder and EngineFolder:FindFirstChild("Wear")

	if not EngineFolder or not WearFolder then return 0 end

	local totalWear = 0
	local partCount = 0

	for _, v in pairs(EngineFolder:GetChildren()) do
		if v:IsA("StringValue") and v.Value ~= "" and v.Value ~= " " then
			local wearValueObj = WearFolder:FindFirstChild(v.Name)
			if wearValueObj then
				totalWear = totalWear + wearValueObj.Value
				partCount = partCount + 1
			end
		end
	end
	if partCount == 0 then return 0 end

	local averageWear = totalWear / partCount
	local condition = 100 - math.round(averageWear)

	return condition
end

local TeleportJunkyardPos = 0

function BuyBestCar()
	local BestCar = FindBestCar()
	if BestCar then
		local BestCarBody = BestCar:FindFirstChild("Body")
		if not BestCarBody then
			DebugWarn("[BuyBestCar] - Best car body not found, requesting stream...")
			Player:RequestStreamAroundAsync(BestCar:GetModelCFrame().p, 10)
			TeleportOnlyPlayer(CFrame.new(BestCar:GetModelCFrame().p))
			return false
		end
		local BestCarEngine = BestCarBody:FindFirstChild("Engine")
		if not BestCarEngine then
			DebugWarn("[BuyBestCar] - Best car engine model not found, requesting stream loop...")
			Player:RequestStreamAroundAsync(BestCarBody:GetModelCFrame().p, 10)
			TeleportOnlyPlayer(CFrame.new(BestCarBody:GetModelCFrame().p))
			return false
		end
		local ClickD = BestCar:FindFirstChild("ClickDetector")
		if not ClickD then
			DebugWarn("[BuyBestCar] - Best car ClickDetector not found, requesting stream...")
			Player:RequestStreamAroundAsync(BestCar:GetModelCFrame().p, 10)
			TeleportOnlyPlayer(CFrame.new(BestCar:GetModelCFrame().p))
			return false
		end

		if BestCarEngine and ClickD then
			ClickD.MaxActivationDistance = 1000
			local RepeatTimes = 0
			repeat
				local BestCar = FindBestCar()
				BestCarBody = BestCar:FindFirstChild("Body")
				if not BestCarBody then
					DebugWarn("[BuyBestCar] - Best car body not found, requesting stream...")
					Player:RequestStreamAroundAsync(BestCar:GetModelCFrame().p, 10)
					TeleportOnlyPlayer(BestCar:GetModelCFrame().p)
					return false
				end
				local BestCarEngine = BestCarBody:FindFirstChild("Engine")
				if not BestCarEngine then
					DebugWarn("[BuyBestCar] - Best car engine model not found, requesting stream loop...")
					Player:RequestStreamAroundAsync(BestCarBody:GetModelCFrame().p, 10)
					TeleportOnlyPlayer(BestCarBody:GetModelCFrame().p)
					return false
				end
				local ClickD = BestCar:FindFirstChild("ClickDetector")
				if not ClickD then
					DebugWarn("[BuyBestCar] - Best car ClickDetector not found, requesting stream...")
					Player:RequestStreamAroundAsync(BestCar:GetModelCFrame().p, 10)
					TeleportOnlyPlayer(BestCar:GetModelCFrame().p)
					return false
				end


				if BestCarEngine and ClickD then
					if GetCurrentCar() == nil then
						ClickD.MaxActivationDistance = 1000
						TeleportOnlyPlayer(BestCarEngine.CFrame)
						task.wait(0.3)
						fireclickdetector(ClickD)
						task.wait(1)
						RepeatTimes += 1
					else
						return false
					end
				else
					return false
				end

			until GetCurrentCar() ~= nil or AutoFarm == false or RepeatTimes >= 5
			if AutoFarm == false or RepeatTimes >= 5 then
				return false
			end
			return true
		else
			Player:RequestStreamAroundAsync(BestCar:GetModelCFrame().p, 10)
			return false
		end
	else
		if TeleportJunkyardPos == 0 then
			TeleportOnlyPlayer(JunkYardPos1)
			TeleportJunkyardPos = 1
		elseif TeleportJunkyardPos == 1 then
			TeleportOnlyPlayer(JunkYardPos2)
			TeleportJunkyardPos = 2
		else
			TeleportOnlyPlayer(JunkYardPos3)
			TeleportJunkyardPos = 0
		end
		return false
	end
end

--[[
Later add here table with current cars that script will be running (their unique names) and check if they were already
fake driving distance - it true then sell them and don't run it again
]]--
local AlreadyDrivenCars = {}
local WorkingOnCurrentCar = nil

while true do
	if AutoFarm == true then
		local currentCar = GetCurrentCar()

		if #AlreadyDrivenCars > 6 then
			AlreadyDrivenCars = {}
		end

		if not currentCar then
			if not WorkingOnCurrentCar then
				DebugPrint("Status: No car - buying new...")
				local bought = BuyBestCar()
				if not bought then
					DebugWarn("[Main loop] - Could not buy a car - waiting 2s")
					task.wait(2)
				end
			else
				DebugPrint("Worked on car - ".. WorkingOnCurrentCar)
				-- Check if car in garage, if not then set WorkingOnCurrentCar to nil, if there is - fire event that will spawn it
				local OwnedCarsTable = GetOwnedCars()
				local FoundCar = nil
				for _, ownedCar in pairs(OwnedCarsTable) do
					if ownedCar.Name == WorkingOnCurrentCar then
						FoundCar = ownedCar
					end
				end

				if OwnedCarsTable and FoundCar then
					-- Spawn car event (MAY BE SOME ERRORS HERE DUE TO NOT CHECKING IF EVENT EXISTS)
					local RemoteLpath = ReplicatedStorage:WaitForChild("Events", 5):WaitForChild("Vehicles", 5):WaitForChild("RemoteLoad", 5)
					if RemoteLpath then
						RemoteLpath:InvokeServer(FoundCar, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
					end
					task.wait(0.2)	
				else
					WorkingOnCurrentCar = nil
				end
			end
		else
			local EnginePart = currentCar:WaitForChild("Body", 5):FindFirstChild("Engine")
			if EnginePart then
				WorkingOnCurrentCar = currentCar.Name
				PaintCar(currentCar)
				local condition = GetCarCondition(currentCar)
				local vParts = GetVehicleParts(currentCar) or {}

				local RequiredParts = {"EngineBlock", "ExhaustManifold", "Transmission", "CylinderHead", "AirIntake"}
				local MissingCriticalPart = false

				if vParts and #vParts > 0 then
					for _, RequiredPart in pairs(RequiredParts) do
						if not table.find(vParts, RequiredPart) then
							MissingCriticalPart = true
							DebugWarn("[Main Loop] - Critical part missing: " .. RequiredPart)
							break
						end
					end
				end

				if condition < 100 and condition > 0 then 
					DebugPrint("Status: Car needs repair (Condition: " .. condition .. "%)")
					local success = FixParts()
					if not success then
						DebugWarn("[Main Loop] - Something went wrong while fixing parts, retrying...")
					end
				else
					if condition <= 0 or MissingCriticalPart then
						InstallAllParts(currentCar)
						DebugPrint("Trying to install needed parts")
					end
					task.wait(0.2)
					if currentCar.Name and not table.find(AlreadyDrivenCars, currentCar.Name) then
						local AutoDrive = DriveDistance(currentCar, 1.2)
						if not AutoDrive then
							if AutoFarm == true then
								DebugWarn("[Main Loop] - Something went wrong while driving.")
							else
								DebugPrint("Paused while auto driving")
							end
						else
							table.insert(AlreadyDrivenCars, currentCar.Name)
						end
					end

					if AutoFarm == true then
						DebugPrint("Status: Selling car...")
						teleportBrokenCar(currentCar, SafePlaceAfterStop)
						task.wait(0.2)
						local sold = SellCar(currentCar)

						if sold then
							TotalCarsSold += 1
							CarsSoldLabel.Text = "Sold cars: ".. TotalCarsSold
							WorkingOnCurrentCar = nil
							if table.find(AlreadyDrivenCars, currentCar.Name) then
								table.remove(AlreadyDrivenCars, table.find(AlreadyDrivenCars, currentCar.Name))
							end
							DebugPrint("--- CAR SOLD ---")
							task.wait(1)
							CleanUpUselessParts() -- not working I think
						else
							DebugWarn("[Main Loop] - Selling error, retrying...")
						end
					end
				end
			else
				local VehicleModelCFrame = currentCar:GetModelCFrame()
				if VehicleModelCFrame then
					DebugPrint("[Main Loop] - No Engine part in car, teleporting to it")
					TeleportOnlyPlayer(VehicleModelCFrame)
				end
			end
		end
	end
	task.wait(1)
end
