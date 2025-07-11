
-- Shawarma Pro V2 – Enhanced Egg Detector & Animal Searcher for Grow a Garden Map
-- Supports full list of egg types and contained animal mappings

local GUI = DeltaGUI:CreateWindow("🥙 Shawarma Pro V2 – Egg Tool", 430, 250)
GUI.Options.BackgroundColor = Color3.new(0.13,0.13,0.18)
GUI:AddLabel("🎯 اختر نوع الحيوان للبحث:", 16)
local animalInput = GUI:AddInput("")
animalInput.PlaceholderText = "مثال: Ladybug, Dragonfly, Wormling"

local eggTypes = {
    ["Common Egg"] = {"Ladybug", "Ant", "Wormling"},
    ["Rare Egg"] = {"Dragonfly", "Snail", "Glowbug"},
    ["Bug Egg"] = {"Beetle", "Stag Beetle", "Firebug"},
    ["Golden Egg"] = {"Goldfly", "Shiny Ant", "Royal Worm"},
    ["Mystery Egg"] = {"????", "???"}
}

local modeDropdown = GUI:AddDropdown({"Random Spawn Once", "Auto Search Until Found"})
local startBtn = GUI:AddButton("ابدأ التشغيل", Color3.new(0.2,0.8,0.2))
local stopBtn = GUI:AddButton("أوقف التشغيل", Color3.new(0.9,0.2,0.2))
GUI:AddDivider()
local statusLabel = GUI:AddLabel("الحالة: جاهز", 14)

local target = ""
local mode = "Random Spawn Once"
local running = false
local found = false
local markers = {}

local function getEggs()
    local success, eggs = pcall(function()
        return world and world.Map and world.Map.Eggs and world.Map.Eggs:GetAll()
    end)
    return success and eggs or {}
end

local function getEggContent(egg)
    if egg:FindFirst("Contents") and egg.Contents:IsA("StringValue") then
        return egg.Contents.Value
    end
    return nil
end

local function detectEggType(animalName)
    for eggName, animals in pairs(eggTypes) do
        for _, name in ipairs(animals) do
            if name:lower() == animalName:lower() then
                return eggName
            end
        end
    end
    return "Unknown"
end

local function markEgg(egg, content)
    if markers[egg] then return end
    local mark = DeltaGUI:CreateBillboard(egg.Position + Vector3.new(0,2,0))
    mark.Text = "[ " .. content .. " ]"
    mark.Pulse = true
    mark.PulseScale = 1.25
    mark.PulseSpeed = 1.5
    mark.Color = Color3.new(0.95, 0.85, 0.1)
    mark.Parent = egg
    markers[egg] = mark
end

local function clearMarks()
    for egg, mark in pairs(markers) do
        if mark and mark.Parent then mark:Destroy() end
    end
    markers = {}
end

local function randomSpawn()
    statusLabel.Text = "🔄 محاولة Spawn جديدة..."
    local success = pcall(function()
        if world and world.Map and world.Map.Eggs and world.Map.Eggs.TriggerSpawn then
            world.Map.Eggs:TriggerSpawn()
        end
    end)
    if not success then
        statusLabel.Text = "⚠️ لم يتم تنفيذ Spawn - تحقق من الماب"
    end
    wait(0.3)
    scanEggs()
end

function scanEggs()
    clearMarks()
    for _, egg in ipairs(getEggs()) do
        local content = getEggContent(egg)
        if content then
            markEgg(egg, content)
            if mode == "Auto Search Until Found" and content:lower() == target:lower() then
                found = true
                running = false
                DeltaGUI:PlaySound("Ping")
                statusLabel.Text = "✅ تم العثور على: " .. content
                return true
            end
        end
    end
    return false
end

local function loopSearch()
    statusLabel.Text = "🔎 جاري البحث عن: " .. target
    while running and not found do
        scanEggs()
        wait(0.2)
    end
    if not found and not running then
        statusLabel.Text = "⏹️ توقف مؤقت - لم يتم العثور"
    end
end

startBtn.OnClick:Connect(function()
    target = animalInput.Text
    mode = modeDropdown.Value
    if mode == "Auto Search Until Found" and target == "" then
        statusLabel.Text = "⚠️ اكتب اسم الحيوان للبحث"
        return
    end
    if running then return end
    running = true
    found = false
    statusLabel.Text = "🚀 التشغيل جاري..."
    markers = {}
    if mode == "Random Spawn Once" then
        randomSpawn()
    else
        loopSearch()
    end
end)

stopBtn.OnClick:Connect(function()
    running = false
end)
