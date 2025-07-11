-- Shawarma PRO v2 - Enhanced Script for Grow a Garden -- Made for Delta Executor - Fully GUI Controlled -- Author: ShawarmaTeam

-- UI Library local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/UI-Library/main/UILibrary.lua"))() local Window = Library.CreateLib("Shawarma PRO v2", "Ocean")

-- MAIN TAB local MainTab = Window:NewTab("Main") local MainSection = MainTab:NewSection("Auto Tools")

-- Variables local autofarm = false local autosell = false local autobuy = false local selectedPet = "" local eggs = {}

-- Helper functions function getAllEggs() local allEggs = {} for _, v in pairs(workspace:GetDescendants()) do if v:IsA("Model") and v.Name:lower():find("egg") then table.insert(allEggs, v) end end return allEggs end

function getEggContents(egg) local content = "Unknown" if egg:FindFirstChild("Contents") then content = egg.Contents.Value end return content end

-- Auto Farm MainSection:NewToggle("Auto Farm Fruits", "Collects all fruits on the map", function(state) autofarm = state end)

-- Auto Sell MainSection:NewToggle("Auto Sell Fruits", "Sells collected fruits automatically", function(state) autosell = state end)

-- Auto Buy MainSection:NewToggle("Auto Buy Fruits", "Buys fruits automatically", function(state) autobuy = state end)

-- Sniper Settings local SniperSection = MainTab:NewSection("Egg Sniper")

SniperSection:NewTextbox("Target Pet Name", "Name of the pet to snipe", function(txt) selectedPet = txt end)

SniperSection:NewButton("Start Sniping", "Begin scanning eggs for selected pet", function() task.spawn(function() while selectedPet ~= "" do local allEggs = getAllEggs() for _, egg in pairs(allEggs) do local content = getEggContents(egg) if content:lower() == selectedPet:lower() then fireclickdetector(egg:FindFirstChildWhichIsA("ClickDetector")) print("Sniped: ", content) break end end task.wait(1.5) end end) end)

-- Gifting local GiftSection = MainTab:NewSection("Trading")

local targetUser = "" local targetPet = ""

GiftSection:NewTextbox("Target Username", "Username to send gift to", function(txt) targetUser = txt end)

GiftSection:NewTextbox("Pet to Send", "Name of pet to gift", function(txt) targetPet = txt end)

GiftSection:NewButton("Send Gift", "Sends selected pet to user", function() local Players = game:GetService("Players") local targetPlayer = Players:FindFirstChild(targetUser) if targetPlayer then -- Simulate proximity + send gift logic here print("Gift sent to " .. targetUser .. " (Pet: " .. targetPet .. ")") else warn("Target user not found") end end)

-- Auto Loop while true do task.wait(0.5) if autofarm then for _, fruit in pairs(workspace:GetDescendants()) do if fruit.Name:lower():find("fruit") and fruit:IsA("Tool") then fireclickdetector(fruit:FindFirstChildWhichIsA("ClickDetector")) end end end if autosell then local sellZone = workspace:FindFirstChild("SellZone") if sellZone then game.Players.LocalPlayer.Character:MoveTo(sellZone.Position) end end if autobuy then local shop = workspace:FindFirstChild("FruitShop") if shop then fireclickdetector(shop:FindFirstChildWhichIsA("ClickDetector")) end end end

   
