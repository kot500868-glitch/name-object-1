local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local mouse = player:GetMouse()

-- Создаем интерфейс
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ObjectNameGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = player:WaitForChild("PlayerGui")

-- Создаем кнопку
local Button = Instance.new("TextButton")
Button.Name = "ObjectNameButton"
Button.Size = UDim2.new(0, 220, 0, 55)
Button.Position = UDim2.new(0.5, -110, 0.8, 0)
Button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.TextSize = 18
Button.Font = Enum.Font.GothamBold
Button.Text = "Узнать название"
Button.Parent = ScreenGui

-- Скругление кнопки
local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 10)
Corner.Parent = Button

-- Переменная для выбранного объекта
local SelectedObject = nil

-- Нажатие на объект
mouse.Button1Down:Connect(function()
    local Target = mouse.Target

    if Target then
        SelectedObject = Target
        print("Выбран объект:", Target.Name)
    end
end)

-- Нажатие на кнопку
Button.Activated:Connect(function()
    if SelectedObject then
        Button.Text = SelectedObject.Name

        print("Название:", SelectedObject.Name)
        print("Путь:", SelectedObject:GetFullName())
    else
        Button.Text = "Сначала выбери предмет"
    end
end)
