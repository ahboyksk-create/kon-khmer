-- [[ Blox Fruits Simple Farm - No Key System ]] --

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("MY PRIVATE SCRIPT (NO KEY)", "BloodTheme")

-- Tab សម្រាប់ Farm
local Tab1 = Window:NewTab("Auto Farm")
local Section1 = Tab1:NewSection("Level Farm")

Section1:NewToggle("Auto Farm Level", "វាយបិសាចឡើង Level", function(state)
    _G.AutoFarm = state
    while _G.AutoFarm do
        wait(0.1)
        -- កូដត្រង់នេះសម្រាប់ស្វែងរកបិសាច និង Teleport (ត្រូវការសរសេរ Function បន្ថែម)
        print("Farming...") 
    end
end)

-- Tab សម្រាប់ Fruit
local Tab2 = Window:NewTab("Fruit Stuff")
local Section2 = Tab2:NewSection("Fruit Management")

Section2:NewButton("Grab Fruits", "រើសផ្លែឈើលើដីទាំងអស់", function()
    for _, v in pairs(game.Workspace:GetChildren()) do
        if v:IsA("Tool") and v:Handle():FindFirstChild("TouchInterest") then
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Handle, 0)
        end
    end
end)

Section2:NewButton("Auto Store Fruit", "ទុកផ្លែឈើក្នុងឃ្លាំង", function()
    for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") and string.find(v.Name, "Fruit") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", v:GetAttribute("FruitName"), v)
        end
    end
end)
