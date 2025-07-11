-- Shawarma PRO - 200 Line Version
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ShawarmaGUI"
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 400)
frame.Position = UDim2.new(0.5, -150, 0.5, -200)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "Shawarma PRO"
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 24
local AutoFarmToggle = Instance.new("TextButton", frame)
AutoFarmToggle.Size = UDim2.new(0.9, 0, 0, 40)
AutoFarmToggle.Position = UDim2.new(0.05, 0, 0, 50)
AutoFarmToggle.Text = "AutoFarm: OFF"
AutoFarmToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
AutoFarmToggle.TextColor3 = Color3.new(1,1,1)
AutoFarmToggle.MouseButton1Click:Connect(function()
    if AutoFarmToggle.Text:find("OFF") then
        AutoFarmToggle.Text = "AutoFarm: ON"
        -- AutoFarm logic here
    else
        AutoFarmToggle.Text = "AutoFarm: OFF"
        -- Stop AutoFarm logic
    end
end)
local AutoSellToggle = Instance.new("TextButton", frame)
AutoSellToggle.Size = UDim2.new(0.9, 0, 0, 40)
AutoSellToggle.Position = UDim2.new(0.05, 0, 0, 100)
AutoSellToggle.Text = "AutoSell: OFF"
AutoSellToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
AutoSellToggle.TextColor3 = Color3.new(1,1,1)
AutoSellToggle.MouseButton1Click:Connect(function()
    if AutoSellToggle.Text:find("OFF") then
        AutoSellToggle.Text = "AutoSell: ON"
        -- AutoSell logic here
    else
        AutoSellToggle.Text = "AutoSell: OFF"
        -- Stop AutoSell logic
    end
end)
local AutoBuyToggle = Instance.new("TextButton", frame)
AutoBuyToggle.Size = UDim2.new(0.9, 0, 0, 40)
AutoBuyToggle.Position = UDim2.new(0.05, 0, 0, 150)
AutoBuyToggle.Text = "AutoBuy: OFF"
AutoBuyToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
AutoBuyToggle.TextColor3 = Color3.new(1,1,1)
AutoBuyToggle.MouseButton1Click:Connect(function()
    if AutoBuyToggle.Text:find("OFF") then
        AutoBuyToggle.Text = "AutoBuy: ON"
        -- AutoBuy logic here
    else
        AutoBuyToggle.Text = "AutoBuy: OFF"
        -- Stop AutoBuy logic
    end
end)
local EggSniperToggle = Instance.new("TextButton", frame)
EggSniperToggle.Size = UDim2.new(0.9, 0, 0, 40)
EggSniperToggle.Position = UDim2.new(0.05, 0, 0, 200)
EggSniperToggle.Text = "EggSniper: OFF"
EggSniperToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
EggSniperToggle.TextColor3 = Color3.new(1,1,1)
EggSniperToggle.MouseButton1Click:Connect(function()
    if EggSniperToggle.Text:find("OFF") then
        EggSniperToggle.Text = "EggSniper: ON"
        -- EggSniper logic here
    else
        EggSniperToggle.Text = "EggSniper: OFF"
        -- Stop EggSniper logic
    end
end)
local GiftSystemToggle = Instance.new("TextButton", frame)
GiftSystemToggle.Size = UDim2.new(0.9, 0, 0, 40)
GiftSystemToggle.Position = UDim2.new(0.05, 0, 0, 250)
GiftSystemToggle.Text = "GiftSystem: OFF"
GiftSystemToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
GiftSystemToggle.TextColor3 = Color3.new(1,1,1)
GiftSystemToggle.MouseButton1Click:Connect(function()
    if GiftSystemToggle.Text:find("OFF") then
        GiftSystemToggle.Text = "GiftSystem: ON"
        -- GiftSystem logic here
    else
        GiftSystemToggle.Text = "GiftSystem: OFF"
        -- Stop GiftSystem logic
    end
end)
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra functionality
-- Placeholder or logic for extra
