--[[ 
 ███████╗██╗  ██╗ █████╗ ██╗    ██╗ █████╗ ██████╗ ███╗   ███╗ █████╗ 
 ██╔════╝██║  ██║██╔══██╗██║    ██║██╔══██╗██╔══██╗████╗ ████║██╔══██╗
 ███████╗███████║███████║██║ █╗ ██║███████║██████╔╝██╔████╔██║███████║
 ╚════██║██╔══██║██╔══██║██║███╗██║██╔══██║██╔═══╝ ██║╚██╔╝██║██╔══██║
 ███████║██║  ██║██║  ██║╚███╔███╔╝██║  ██║██║     ██║ ╚═╝ ██║██║  ██║
 ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝     ╚═╝     ╚═╝╚═╝  ╚═╝ 
  ▬ Shawarma PRO | Grow a Garden | Delta Executor ▬
--]]

-- مكتبات أساسية
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3"))()
local Window = Library:CreateWindow("🌿 Shawarma PRO 🌿")

-- خدمات
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer

-- متغيرات
local SelectedPet = nil
local SelectedEgg = nil
local SniperEnabled = false
local AutoSell = false
local AutoBuy = false
local AutoFarm = false
local GiftPet = ""
local GiftTo = ""

-- أحداث اللعبة
local EggEvent = ReplicatedStorage:WaitForChild("Egg")
local FarmEvent = ReplicatedStorage:WaitForChild("Farm")
local SellEvent = ReplicatedStorage:WaitForChild("Sell")
local BuyEvent = ReplicatedStorage:WaitForChild("Buy")
local GiftEvent = ReplicatedStorage:WaitForChild("Gift")

-- واجهة اختيار الحيوان
local mainTab = Window:NewTab("الرئيسية")
local main = mainTab:NewSection("تحديد الحيوان")

local petList = {"Dragonfly", "Raccoon", "Plantowl", "Ladybug", "Snail", "Worm"} -- مثال فقط، عدل حسب اللعبة
main:NewDropdown("اختر الحيوان المطلوب", "يستخدمه الراندومايزر", petList, function(choice)
    SelectedPet = choice
end)

-- تفعيل الراندومايزر
main:NewToggle("تشغيل Sniper", "يحاول الحصول على الحيوان المختار", function(state)
    SniperEnabled = state
    if SniperEnabled then
        spawn(function()
            while SniperEnabled do
                for _, egg in pairs(workspace.Eggs:GetChildren()) do
                    local contents = egg:FindFirstChild("Contents")
                    if contents and contents.Value == SelectedPet then
                        EggEvent:FireServer(egg)
                        Library:Notify("تم العثور على " .. SelectedPet .. "!")
                        break
                    end
                end
                wait(0.5)
            end
        end)
    end
end)

-- Auto Farm Section
local farmTab = Window:NewTab("مزرعة")
local farm = farmTab:NewSection("التجميع")

farm:NewToggle("Auto Farm", "تجميع الفواكه تلقائياً", function(state)
    AutoFarm = state
    if AutoFarm then
        spawn(function()
            while AutoFarm do
                for _, fruit in pairs(workspace.Fruits:GetChildren()) do
                    if fruit:IsA("Part") then
                        firetouchinterest(player.Character.HumanoidRootPart, fruit, 0)
                        firetouchinterest(player.Character.HumanoidRootPart, fruit, 1)
                    end
                end
                wait(1)
            end
        end)
    end
end)

-- البيع والشراء
farm:NewToggle("Auto Sell", "بيع تلقائي", function(state)
    AutoSell = state
    if AutoSell then
        spawn(function()
            while AutoSell do
                SellEvent:FireServer()
                wait(3)
            end
        end)
    end
end)

farm:NewToggle("Auto Buy", "شراء عشوائي تلقائي", function(state)
    AutoBuy = state
    if AutoBuy then
        spawn(function()
            while AutoBuy do
                BuyEvent:FireServer()
                wait(2)
            end
        end)
    end
end)

-- واجهة الإهداء
local giftTab = Window:NewTab("الإهداء")
local gift = giftTab:NewSection("Send Gift")

gift:NewTextbox("اسم الشخص", "اكتب يوزر الشخص", function(txt)
    GiftTo = txt
end)

gift:NewDropdown("اختر الحيوان", "سيتم إرساله كهدية", petList, function(txt)
    GiftPet = txt
end)

gift:NewButton("إرسال", "إرسال الهدية للشخص", function()
    if GiftTo ~= "" and GiftPet ~= "" then
        GiftEvent:FireServer(GiftTo, GiftPet)
        Library:Notify("تم إرسال " .. GiftPet .. " إلى " .. GiftTo)
    else
        Library:Notify("يرجى تحديد الحيوان والشخص")
    end
end)

-- الحماية من الـ Kick
local mt = getrawmetatable(game)
setreadonly(mt, false)
local old = mt.__namecall

mt.__namecall = newcclosure(function(self, ...)
    local args = {...}
    if getnamecallmethod() == "Kick" then
        return warn("[Shawarma PRO]: منع محاولة طرد")
    end
    return old(self, ...)
end)

-- ختامية
local aboutTab = Window:NewTab("حول")
local about = aboutTab:NewSection("معلومات")
about:NewLabel("Shawarma PRO v1.0 ✅")
about:NewLabel("تم بواسطة ChatGPT")
about:NewLabel("يدعم Grow a Garden الرسمية")
Library:Notify("Shawarma PRO جاهز للاستخدام ✅")
