-- Script de Forcefield com menu móvel

-- Criação do Gui para o menu
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local ForceFieldButton = Instance.new("TextButton")

-- Configurações do Gui
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- Configurações do Frame (menu)
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 2
Frame.Position = UDim2.new(0.4, 0, 0.4, 0)
Frame.Size = UDim2.new(0, 200, 0, 100)
Frame.Active = true
Frame.Draggable = true

-- Configurações do botão ForceField
ForceFieldButton.Parent = Frame
ForceFieldButton.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
ForceFieldButton.Size = UDim2.new(0, 180, 0, 50)
ForceFieldButton.Position = UDim2.new(0, 10, 0, 25)
ForceFieldButton.Text = "Ativar Forcefield"

-- Variável para controlar o ForceField
local forceFieldActive = false
local player = game.Players.LocalPlayer

-- Função para alternar o ForceField
ForceFieldButton.MouseButton1Click:Connect(function()
    if forceFieldActive then
        -- Desativa o ForceField
        if player.Character:FindFirstChild("ForceField") then
            player.Character.ForceField:Destroy()
        end
        ForceFieldButton.Text = "Ativar Forcefield"
    else
        -- Ativa o ForceField
        local forceField = Instance.new("ForceField")
        forceField.Parent = player.Character
        ForceFieldButton.Text = "Desativar Forcefield"
    end
    forceFieldActive = not forceFieldActive
end)
