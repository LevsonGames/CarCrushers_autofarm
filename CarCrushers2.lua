local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
local Window = Library.CreateLib("Levson_games farm", "RJTheme3")
local Tab = Window:NewTab("Nuke escape")
local Tab2 = Window:NewTab("Nuke farm")
local Tab3 = Window:NewTab("Autofarm")
local Section = Tab:NewSection("Escape metods")
local Section2 = Tab2:NewSection("nuke farm")
local Section3 = Tab3:NewSection("autofarm")
local A_1 = "LAA"
local A_2 = true
local A_3 = 1
local Event = game:GetService("ReplicatedStorage").rE.Components.Region.AllocateSeat
Section:NewButton("Boat escape", "Boat escape", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.EnergyCore_Session.Boat.Seats.Seat.CFrame
    wait(1)
    Event:FireServer(A_1, A_2, A_3)
end)
Section:NewButton("Heli escape", "Heli escape", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.EnergyCore_Session.Helicopter.Seats.Seat.CFrame
    wait(1)
    Event:FireServer(A_1, A_2, A_3)
end)
Section2:NewButton("nuke farm", "(for nuke gamepass owners!)", function()
    local press = game.Workspace.EnergyCore.ControlRoom.SelfDestruct.Prompt
    local press2 = game.Workspace.EnergyCore.ControlRoom.Enable.Prompt
    local A_1 = "LAA"
    local A_2 = true
    local A_3 = 1
    local Event = game:GetService("ReplicatedStorage").rE.Components.Region.AllocateSeat
    repeat
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.EnergyCore.ControlRoom.Glass.CFrame
    wait(0.5)
    fireproximityprompt(press.Main)
    wait(0.5)
    fireproximityprompt(press.Main)
    wait(12)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.EnergyCore_Session.Helicopter.Seats.Seat.CFrame
    wait(1)
    Event:FireServer(A_1, A_2, A_3)
    wait(180)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.EnergyCore.ControlRoom.Glass.CFrame
    wait(0.5)
    fireproximityprompt(press2.Main)
    wait(1250)
    until nil
end)
Section3:NewButton("autofarm", "(money farm)", function()
        -- services
    local players = game:GetService("Players")
    local rs = game:GetService("ReplicatedStorage")
    local runs = game:GetService("RunService")

    -- variables
    local lp = players.LocalPlayer
    local vehicleInfo = rs:WaitForChild("VehicleInformation")
    local carCollection = workspace.CarCollection
    local rfSpawnVehicle = rs:WaitForChild("rF").SpawnVehicle
    local lavaPart = workspace.Crushers["Volcano Pit"].Scripted.Lava
    local sp = workspace.Lobby.SpawnPoints.Spawn1
    local guiScript = getsenv(lp.PlayerGui:WaitForChild("GUIs"))
    local openFunc = guiScript["OpenDealership"]
    local spawnFunc = guiScript["SpawnButton"]

    -- functions
    local function getCurrentCar()
    local car = carCollection:FindFirstChild(lp.Name)
    if not car then return nil end
    
    local model = car:FindFirstChild("Car")
    if not model then return nil end

    local isNotBroken =
        model:FindFirstChild("Wheels"):FindFirstChildOfClass("Part") and
        model:FindFirstChild("Body"):FindFirstChild("Engine"):FindFirstChildOfClass("MeshPart")

    return isNotBroken and model or nil
    end

    local function getCharacter()
    return lp.Character or lp.CHaracterAdded:Wait()
    end

    local function getMoney()
    return lp.Money.Value
    end

    local function canSpawn()
    return lp.SpawnTimer.Value <= 0
    end

    local function spawnBestCar()
    openFunc()
    spawnFunc(true, Enum.UserInputState.Begin)
    end

    local function destroyCar()
    local hum = getCharacter():FindFirstChildOfClass("Humanoid")
    local hrp = getCharacter():FindFirstChild("HumanoidRootPart")

    if not hum or not hrp then return end

    local car = getCurrentCar()

    repeat task.wait() until car.PrimaryPart ~= nil

    -- Death to the car!!!
    repeat task.wait()
        car = getCurrentCar()
        if not car then return end

        car.PrimaryPart.Velocity = Vector3.new(0, 250, 0)
        car.PrimaryPart.CFrame *= CFrame.Angles(180, 0, 0)

        task.wait(.25)

        car.PrimaryPart.Velocity = Vector3.new(0, -250, 0)
        car.PrimaryPart.CFrame *= CFrame.Angles(180, 0, 0)

        task.wait(.25)
    until not car
    end

    -- main
    while task.wait() do
    local character = getCharacter()

    if not character then return end

    if canSpawn() then
        spawnBestCar()
        destroyCar()
    end
    end
end)
Section3:NewButton("anti afk", "anti afk", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/KazeOnTop/Rice-Anti-Afk/main/Wind", true))()
end)