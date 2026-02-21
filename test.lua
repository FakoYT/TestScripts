local nbvcuytrkijuhygt = Instance.new("ScreenGui")
local ActiveBtn = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")

if game.CoreGui:FindFirstChild("nbvcuytrkijuhygt") then
	game.CoreGui.nbvcuytrkijuhygt:Destroy()
end

nbvcuytrkijuhygt.Name = "nbvcuytrkijuhygt"
nbvcuytrkijuhygt.Parent = game.CoreGui
nbvcuytrkijuhygt.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ActiveBtn.Name = "ActiveBtn"
ActiveBtn.Parent = nbvcuytrkijuhygt
ActiveBtn.AnchorPoint = Vector2.new(0.5, 0.5)
ActiveBtn.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
ActiveBtn.BackgroundTransparency = 0.450
ActiveBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
ActiveBtn.BorderSizePixel = 0
ActiveBtn.Position = UDim2.new(0.0843750015, 0, 0.949403882, 0)
ActiveBtn.Size = UDim2.new(0.154687494, 0, 0.0805555582, 0)
ActiveBtn.Font = Enum.Font.FredokaOne
ActiveBtn.Text = "Autofarm: false"
ActiveBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ActiveBtn.TextScaled = true
ActiveBtn.TextSize = 14.000
ActiveBtn.TextWrapped = true

UICorner.CornerRadius = UDim.new(0, 18)
UICorner.Parent = ActiveBtn

UIStroke.Name = "UIStroke"
UIStroke.Color = Color3.fromRGB(255, 0, 0)
UIStroke.Thickness = 4.2
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Parent = ActiveBtn

local AutoFarm = false

ActiveBtn.MouseButton1Click:Connect(function()
	if AutoFarm == false then
		AutoFarm = true
		ActiveBtn.Text = "Autofarm: true"
		UIStroke.Color = Color3.fromRGB(0, 255, 0)
	else
		AutoFarm = false
		ActiveBtn.Text = "Autofarm: false"
		UIStroke.Color = Color3.fromRGB(255, 0, 0)
	end
end)

local Player = game.Players.LocalPlayer
local SearchedForName = "PitStop Repair2"
local MapFolder = game.Workspace:FindFirstChild("Map")
local SecondsToSell = 0
local DebugP = true

--Load repair station
Player:RequestStreamAroundAsync(Vector3.new(-832.043, 9.40005, -1300.34))

-- Load SellCar
Player:RequestStreamAroundAsync(Vector3.new(-1900.25, 4.57531, -783.911))

--AUTO CONFIRMATION
local prompt = game.Workspace:FindFirstChild("Map"):FindFirstChild("SellCar"):FindFirstChild("Prompt").ProximityPrompt

-- DELETING MAYBE ANTICHEAT LOGS
local Logs = game.ReplicatedStorage:WaitForChild("Events"):FindFirstChild("ServerLogs")
local Webbhoks = game.ReplicatedStorage:FindFirstChild("SmurklesLib"):FindFirstChild("Modules"):FindFirstChild("DiscordWebhook")
if Logs then
	Logs:Destroy()
end
if Webbhoks then
	Webbhoks:Destroy()
end

-- AutoConfirm
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ConfirmationRemote = ReplicatedStorage:WaitForChild("Events"):WaitForChild("HUD"):WaitForChild("Confirmation")

ConfirmationRemote.OnClientInvoke = function(message)

	if string.find(string.lower(message), "sell") or string.find(string.lower(message), "sprzedać") then
		return true
	end

	return true 
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
Player.CharacterAdded:Connect(function(character)
	Player.PlayerGui:WaitForChild("HUD"):WaitForChild("Notifications").ChildAdded:Connect(function(textL)
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
end)

Player.PlayerGui:WaitForChild("HUD"):WaitForChild("Notifications").ChildAdded:Connect(function(textL)
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
	local FakePlate = game.Workspace:FindFirstChild("DrivingPlatePart")
	local mileageVal = Player:FindFirstChild("PlayerData"):FindFirstChild("Status"):FindFirstChild("KMs")
	local targetKm = tonumber(mileageVal.Value) + additionalKm
	local seat = Vehicle:FindFirstChildWhichIsA("VehicleSeat", true)
	local carRoot = GetCarRoot(Vehicle)
	FakePlate.Position = FakePlatePosition
	task.wait(0.1)
	teleportBrokenCar(Vehicle, FakePlate.CFrame * CFrame.new(0, 5, 0))

	task.wait(0.5)

	local lastUpdate = tick()

	while tonumber(mileageVal.Value) < targetKm do
		if seat then
			if not seat.Occupant then
				TeleportOnlyPlayer(seat.CFrame)
			end

			local speed = math.random(150, 220)
			local wobble = math.sin(tick() * 4) * 15

			seat.Throttle = 1
			seat.Steer = math.sin(tick() * 6) 

			seat.AssemblyLinearVelocity = (seat.CFrame.LookVector * speed) + (seat.CFrame.RightVector * wobble) + Vector3.new(0, -10, 0)

			seat.AssemblyAngularVelocity = Vector3.new(0, math.random(-2, 2), 0)
		else
			return false
		end

		FakePlate.CFrame = CFrame.new(carRoot.Position.X, FakePlatePosition.Y, carRoot.Position.Z)

		if tick() - lastUpdate > 1 then
			lastUpdate = tick()
		end
		if AutoFarm == false then
			teleportBrokenCar(Vehicle, SafePlaceAfterStop)
			return false
		end

		task.wait() 
	end

	if seat then seat.AssemblyLinearVelocity = Vector3.new(0,0,0) end
	return true
end

function FindRepairShop() -- Get repair station model
	for _, v in pairs(MapFolder:GetChildren()) do
		if v.Name == SearchedForName then
			if v:FindFirstChild("NoCleanup") then
				return v, v:FindFirstChild("NoCleanup")
			else
				Player:RequestStreamAroundAsync(Vector3.new(-832.043, 9.40005, -1300.34))
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
				Player:RequestStreamAroundAsync(v.PrimaryPart and v.PrimaryPart.Position or v:GetModelCFrame().Position)
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

function PainCar(Vehicle) -- Paint car if rusted
	local ValuesFolder = Vehicle:FindFirstChild("Values")
	if Player.Character then
		if Player.Character:FindFirstChild("Humanoid") then
			Player.Character.Humanoid.Sit = false
		end
	end
	task.wait()
	if ValuesFolder then
		local PaintColor = ValuesFolder:FindFirstChild("PaintColor")
		if PaintColor then
			if string.find(PaintColor.Value, "Rust") then
				local PaintRemote = game.ReplicatedStorage:FindFirstChild("Events"):FindFirstChild("Vehicles"):FindFirstChild("SetPaint")
				if PaintRemote then
					DebugPrint("Painting car")
					PaintRemote:FireServer("Car", Vehicle, Color3.new(0.129412, 0.129412, 0.129412))
				end
			else
				DebugPrint("Car already painted")
			end
		end
	end
end


function WaitUntilRepaired(part) -- Waits until part is repaired
	if part:GetAttribute("Wear") == 0 then
		return
	end

	repeat
		part:GetAttributeChangedSignal("Wear"):Wait()
	until part:GetAttribute("Wear") == 0 or AutoFarm == false
	if AutoFarm == false then
		return false
	end
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
			
			task.wait(0.2)
			attempts = attempts + 1
			
			local distance = (seat.Position - targetCFrame.Position).Magnitude
		until distance < 5 or attempts > 15 or AutoFarm == false
		if AutoFarm == false then
			return false
		end
		
		return true
	else
		return nil
	end
end

function FindBestCar() -- returns the most expensive car that can be bought
	local Vehicles = game.Workspace:WaitForChild("Vehicles")
	local Money = tonumber(game.Players.LocalPlayer:WaitForChild("PlayerData"):WaitForChild("Status"):WaitForChild("Money").value)
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
		-- Load sell car guy
		DebugWarn("SellCar guy not found, requesting stream")
		Player:RequestStreamAroundAsync(Vector3.new(-1900.25, 4.57531, -783.911))
		return false
	end
	local SellCarGuyHRP = SellCargGuy:FindFirstChild("HumanoidRootPart")
	if not SellCarGuyHRP then
		-- Load sell car guy
		DebugWarn("SellCar guy HRP not found, requesting stream")
		Player:RequestStreamAroundAsync(SellCargGuy:GetModelCFrame().Position)
		return false
	end
	
	local prompt = game.Workspace:FindFirstChild("Map"):FindFirstChild("SellCar"):FindFirstChild("Prompt").ProximityPrompt
	if SellCarGuyHRP and prompt then
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
				repeat
					DebugPrint("repeating until car sold")
					TeleportOnlyPlayer(SellCarGuyHRP.CFrame * CFrame.new(math.random(-5, 5), math.random(0, 5), -5))
					task.wait(0.3)
					fireproximityprompt(prompt)
				until GetCurrentCar() == nil or AutoFarm == false
				if AutoFarm == false then
					return false
				end
				return true
			else
				return true
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
				return true
			else
				return true
			end
		end
		return false
	else
		if game.Workspace:FindFirstChild("Map"):FindFirstChild("SellCar") then
			Player:RequestStreamAroundAsync(game.Workspace:FindFirstChild("Map"):FindFirstChild("SellCar"):GetModelCFrame().Position)
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
				DebugPrint(engineVal:FindFirstChild("EngineBlock").Value)
				if engineVal:FindFirstChild("EngineBlock") and engineVal.EngineBlock.Value ~= "" and engineVal.EngineBlock.Value ~= " "  then
					success = true
					break
				end
				task.wait(0.1)
			end

			if not success then
				DebugWarn("Could not install engine block!")
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
				if Owner == Player.Name and mPart.Name == "Injectors" and mPart.Name == "Sparkplugs" and mPart.Name == "TimingBelt" then
					table.insert(Parts, mPart)
				end
			end
		end
		
		if #Parts > 0 and #Parts > 5 then
			for _, mPart in pairs(Parts) do
				mPart.PrimaryPart.CFrame = TrashPart.PrimaryPart.CFrame
				task.wait(0.2)
			end
		end
		
	end
end

function StartGrindingMachines(ToGrindParts, GMachinesTable, RepairingParts)
	for index, Rpart in pairs(ToGrindParts) do
		Rpart.PrimaryPart.CFrame = GMachinesTable[index]:FindFirstChild("Detector").CFrame
		task.wait(0.2)
		local Button = GMachinesTable[index]:FindFirstChild("Button")
		local ParticleE = GMachinesTable[index]:FindFirstChild("Drill"):FindFirstChild("Attachment"):FindFirstChild("CUTS")
		if Button and ParticleE then
			repeat
				fireclickdetector(Button:FindFirstChild("ClickDetector"))
				task.wait(0.2)
				Rpart.PrimaryPart.CFrame = GMachinesTable[index]:FindFirstChild("Detector").CFrame
			until ParticleE.Enabled == true or AutoFarm == false
			if AutoFarm == false then
				return false
			end
		else
			return false
		end
		table.insert(RepairingParts, Rpart)
	end
	return RepairingParts
end

function StartWashingMachines(ToWashParts, PWashersTable, RepairingParts)
	for index, Rpart in pairs(ToWashParts) do
		Rpart.PrimaryPart.CFrame = PWashersTable[index]:FindFirstChild("Detector").CFrame
		task.wait(0.2)
		local Button = PWashersTable[index]:WaitForChild("Faucet")
		local ParticleE = PWashersTable[index]:FindFirstChild("Water"):FindFirstChild("Attachment"):FindFirstChild("MAIN SPRAY")
		if Button and ParticleE then
			repeat
				fireclickdetector(Button:FindFirstChild("ClickDetector"))
				task.wait(0.2)
				Rpart.PrimaryPart.CFrame = PWashersTable[index]:FindFirstChild("Detector").CFrame
			until ParticleE.Enabled == true or AutoFarm == false
			if AutoFarm == false then
				return false
			end
		else
			return false
		end
		table.insert(RepairingParts, Rpart)
	end
	return RepairingParts
end

function StartChargingMachines(ToChargeParts, BChargersTable, RepairingParts)
	for index, Rpart in pairs(ToChargeParts) do
		Rpart.PrimaryPart.CFrame = BChargersTable[index]:FindFirstChild("Detector").CFrame
		task.wait(0.2)
		local Button = BChargersTable[index]:FindFirstChild("Button")
		local ParticleE = BChargersTable[index]:FindFirstChild("Clamps"):FindFirstChild("Negative"):FindFirstChild("Clamp"):FindFirstChild("Primary"):FindFirstChild("Particles")
		if Button and ParticleE then
			repeat
				fireclickdetector(Button:FindFirstChild("ClickDetector"))
				task.wait(0.2)
				Rpart.PrimaryPart.CFrame = BChargersTable[index]:FindFirstChild("Detector").CFrame
			until ParticleE.Enabled == true or AutoFarm == false
			if AutoFarm == false then
				return false
			end
		else
			return false
		end
		table.insert(RepairingParts, Rpart)
	end
	return RepairingParts
end

function FixParts()
	local CurrentCar = GetCurrentCar()

	local RepairShop, TeleportPart = FindRepairShop()

	if CurrentCar and RepairShop and TeleportPart then
		local GMachinesTable = GetMachines(RepairShop, "GrindingMachine")
		local BChargersTable = GetMachines(RepairShop, "BatteryCharger")
		local PWashersTable = GetMachines(RepairShop, "PartsWasher")

		if GMachinesTable == nil or BChargersTable == nil or PWashersTable == nil then
			return false
		end

		local VehicleParts = GetVehicleParts(CurrentCar)
		if VehicleParts and #VehicleParts > 0 then -- Remove every part
			task.wait(1)
			TeleportOnlyPlayer(TeleportPart.CFrame * CFrame.new(0, 1, 4))
			task.wait(0.3)

			for _, part in pairs(VehicleParts) do
				RemovePart(CurrentCar, part)
				task.wait(0.1)
			end
		end

		task.wait(0.3)
		local ToRepair = GetWearedMovableParts()
		if ToRepair and #ToRepair > 0 then
			local RepairingParts = {}

			local ToGrindParts = GetToMachineParts(ToRepair, "GrindingMachine")
			local ToWashParts = GetToMachineParts(ToRepair, "PartsWasher")
			local ToChargeParts = GetToMachineParts(ToRepair, "BatteryCharger")

			if ToGrindParts and #ToGrindParts > 0 then -- To grinding machine parts fixing
				if #GMachinesTable >= #ToGrindParts then -- When theres enough machines
					local GrindingTable = StartGrindingMachines(ToGrindParts, GMachinesTable, RepairingParts)
					if GrindingTable then
						RepairingParts = GrindingTable
					else
						return false
					end
				else
					repeat
						task.wait(0.5)
					until GetMachines(RepairShop, "GrindingMachine") and #GetMachines(RepairShop, "GrindingMachine") >= #ToGrindParts or AutoFarm == false

					if AutoFarm == false then
						return false
					end

					-- Fix parts
					local GrindingTable = StartGrindingMachines(ToGrindParts, GMachinesTable, RepairingParts)
					if GrindingTable then
						RepairingParts = GrindingTable
					else
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
						return false
					end
				else
					repeat
						task.wait(0.5)
					until GetMachines(RepairShop, "PartsWasher") and #GetMachines(RepairShop, "PartsWasher") >= #ToWashParts or AutoFarm == false

					if AutoFarm == false then
						return false
					end

					-- Fix parts
					local WashingTable = StartWashingMachines(ToWashParts, PWashersTable, RepairingParts)
					if WashingTable then
						RepairingParts = WashingTable
					else
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
						return false
					end
				else
					repeat
						task.wait(0.5)
					until GetMachines(RepairShop, "BatteryCharger") and #GetMachines(RepairShop, "BatteryCharger") >= #ToChargeParts or AutoFarm == false

					if AutoFarm == false then
						return false
					end

					-- Fix parts
					local ChargingTable = StartChargingMachines(ToChargeParts, BChargersTable, RepairingParts)
					if ChargingTable then
						RepairingParts = ChargingTable
					else
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
					local WaitUntilEngine = WaitUntilRepaired(EngineBlock)
					if WaitUntilEngine == false then
						return false
					end
				end
				task.wait(0.1)
				-- wait until repair for other parts
				for _, part in pairs(RepairingParts) do
					local WaitUntilRepaired = WaitUntilRepaired(part)
					if WaitUntilRepaired == false then
						return false
					end
				end
				-- Installing other parts
				local InstallingParts = InstallAllParts(CurrentCar)
				if InstallingParts then
					return true
				else 
					return false
				end
			else
				local InstallingParts = InstallAllParts(CurrentCar)
				if InstallingParts then
					return true
				else 
					return false
				end
			end
		else
			-- No parts to repair - install all
			local InstallPartsSucc = InstallAllParts(CurrentCar)
			if InstallPartsSucc then
				return true
			else
				return false
			end
		end
	else
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

function BuyBestCar()
	local BestCar = FindBestCar()
	if BestCar then
		local BestCarEngine = BestCar:FindFirstChild("Body"):FindFirstChild("Engine")
		local ClickD = BestCar:FindFirstChild("ClickDetector")
		if BestCarEngine and ClickD then
			ClickD.MaxActivationDistance = 1000
			repeat
				local BestCar = FindBestCar()
				local BestCarEngine = BestCar:FindFirstChild("Body"):FindFirstChild("Engine")
				local ClickD = BestCar:FindFirstChild("ClickDetector")
				if BestCarEngine and ClickD then
					ClickD.MaxActivationDistance = 1000
					TeleportOnlyPlayer(BestCarEngine.CFrame)
					task.wait(0.3)
					fireclickdetector(ClickD)
					task.wait(1)
				else
					return false
				end

			until GetCurrentCar() ~= nil or AutoFarm == false
			if AutoFarm == false then
				return false
			end
			return true
		else
			return false
		end
	else
		return false
	end
end

while true do
	if AutoFarm == true then
		local currentCar = GetCurrentCar()

		if not currentCar then
			DebugPrint("Status: No car - buying new...")
			local bought = BuyBestCar()
			if not bought then
				DebugWarn("Could not buy a car - waiting 5s")
				task.wait(2)
			end
		else
			PainCar(currentCar)
			local condition = GetCarCondition(currentCar)
			local vParts = GetVehicleParts(currentCar) or {}

			local FoundNeededPart = false

			if vParts and #vParts > 0 then
				for _, partN in pairs(vParts) do
					if partN == "EngineBlock" or partN == "ExhaustManifold" or partN == "Transmission" or partN == "CylinderHead" or partN == "AirIntake" then
						FoundNeededPart = true
					end
				end
			end

			if condition < 100 then 
				DebugPrint("Status: Car needs repair (Condition: " .. condition .. "%)")
				local success = FixParts()
				if not success then
					DebugWarn("Something went wrong while fixing parts, retrying...")
				end
			else
				if FoundNeededPart then
					InstallAllParts(currentCar)
					DebugPrint("Everything installed")
				end
				task.wait(0.2)
				local AutoDrive = DriveDistance(currentCar, 1.2)
				if not AutoDrive then
					DebugWarn("Something went wrong while driving.")
				end

				if AutoFarm == true then
					DebugPrint("Status: Selling car...")
					local sold = SellCar(currentCar)
					if sold then
						print("--- CAR SOLD ---")
						task.wait(1)
						CleanUpUselessParts()
					else
						DebugWarn("Selling error, retrying...")
					end
				end
			end
		end
	end
	task.wait(1)
end
