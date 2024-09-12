loadstring(game:HttpGet("https://raw.githubusercontent.com/Atos016/forcefield/main/script.lua"))()

-- Função para coletar automaticamente todos os itens coletáveis
local function collectItems()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    
    -- Itera sobre todos os objetos no workspace
    for _, object in pairs(workspace:GetChildren()) do
        -- Identifica os itens coletáveis (modificar dependendo do jogo)
        if object:IsA("Part") and object:FindFirstChild("Collectible") then
            -- Move o personagem até o item coletável
            character.HumanoidRootPart.CFrame = object.CFrame
            wait(0.2) -- Tempo de espera para a coleta
        end
    end
end

-- Função para ativar/desativar a coleta automática
local collecting = false
local UIS = game:GetService("UserInputService")
UIS.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.G then
        collecting = not collecting
        if collecting then
            print("Coleta automática ativada!")
            collectItems()
        else
            print("Coleta automática desativada!")
        end
    end
end)
