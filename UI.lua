-- Little - Auto JJs UI.lua
-- Author: ChatGPT (feito pro Little)

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local UI = {}
UI.Version = "1.0"
UI.Language = "pt-br"
UI.Rainbow = false
UI.Parent = nil
UI.UIElements = {}

-- Criar a UI
function UI:CreateUI()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "LittleAutoJJs"
    screenGui.ResetOnSpawn = false

    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.BackgroundColor3 = Color3.fromHex("#1F1F1F")
    mainFrame.Size = UDim2.new(0, 280, 0, 450) -- largura x altura (altura 1.6x a largura)
    mainFrame.Position = UDim2.new(0.05, 0, 0.3, 0)
    mainFrame.AnchorPoint = Vector2.new(0,0)
    mainFrame.Parent = screenGui
    mainFrame.ClipsDescendants = true
    mainFrame.BorderSizePixel = 0

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = mainFrame

    -- Cabeçalho
    local header = Instance.new("Frame")
    header.Name = "Header"
    header.Size = UDim2.new(1, 0, 0, 60)
    header.BackgroundTransparency = 1
    header.Parent = mainFrame

    local titleLittle = Instance.new("TextLabel")
    titleLittle.Name = "TitleLittle"
    titleLittle.Text = "Little"
    titleLittle.Font = Enum.Font.GothamBold
    titleLittle.TextSize = 28
    titleLittle.TextColor3 = Color3.fromHex("#00FF88")
    titleLittle.BackgroundTransparency = 1
    titleLittle.Position = UDim2.new(0, 15, 0, 10)
    titleLittle.Size = UDim2.new(0, 80, 0, 40)
    titleLittle.TextXAlignment = Enum.TextXAlignment.Left
    titleLittle.Parent = header

    local titleDash = Instance.new("TextLabel")
    titleDash.Name = "TitleDash"
    titleDash.Text = " - "
    titleDash.Font = Enum.Font.GothamBold
    titleDash.TextSize = 28
    titleDash.TextColor3 = Color3.new(1,1,1)
    titleDash.BackgroundTransparency = 1
    titleDash.Position = UDim2.new(0, 90, 0, 10)
    titleDash.Size = UDim2.new(0, 20, 0, 40)
    titleDash.TextXAlignment = Enum.TextXAlignment.Left
    titleDash.Parent = header

    local titleAutoJJs = Instance.new("TextLabel")
    titleAutoJJs.Name = "TitleAutoJJs"
    titleAutoJJs.Text = "Auto JJs"
    titleAutoJJs.Font = Enum.Font.GothamBold
    titleAutoJJs.TextSize = 28
    titleAutoJJs.TextColor3 = Color3.new(1,1,1)
    titleAutoJJs.BackgroundTransparency = 1
    titleAutoJJs.Position = UDim2.new(0, 110, 0, 10)
    titleAutoJJs.Size = UDim2.new(0, 110, 0, 40)
    titleAutoJJs.TextXAlignment = Enum.TextXAlignment.Left
    titleAutoJJs.Parent = header

    local levelLabel = Instance.new("TextLabel")
    levelLabel.Name = "LevelLabel"
    levelLabel.Text = "Lvl 33"
    levelLabel.Font = Enum.Font.GothamBold
    levelLabel.TextSize = 20
    levelLabel.TextColor3 = Color3.fromRGB(255, 60, 60)
    levelLabel.BackgroundTransparency = 1
    levelLabel.Position = UDim2.new(1, -70, 0, 15)
    levelLabel.Size = UDim2.new(0, 60, 0, 30)
    levelLabel.TextXAlignment = Enum.TextXAlignment.Right
    levelLabel.Parent = header

    -- Função para criar labels e inputs
    local function CreateLabelAndInput(parent, labelText, defaultText, posY, width, isNumberOnly)
        width = width or 140
        local container = Instance.new("Frame")
        container.Name = labelText:gsub("%s+", "").."Container"
        container.BackgroundTransparency = 1
        container.Size = UDim2.new(1, 0, 0, 50)
        container.Position = UDim2.new(0, 0, 0, posY)
        container.Parent = parent

        local label = Instance.new("TextLabel")
        label.Name = "Label"
        label.Text = labelText
        label.Font = Enum.Font.Gotham
        label.TextSize = 18
        label.TextColor3 = Color3.new(1,1,1)
        label.BackgroundTransparency = 1
        label.Position = UDim2.new(0, 15, 0, 0)
        label.Size = UDim2.new(0, 100, 0, 20)
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = container

        local input = Instance.new("TextBox")
        input.Name = labelText:gsub("%s+", "")
        input.Text = defaultText
        input.Font = Enum.Font.Gotham
        input.TextSize = 20
        input.TextColor3 = Color3.new(1,1,1)
        input.BackgroundColor3 = Color3.fromHex("#000000")
        input.Position = UDim2.new(0, 15, 0, 25)
        input.Size = UDim2.new(0, width, 0, 30)
        input.ClearTextOnFocus = false
        input.TextStrokeTransparency = 1
        input.TextWrapped = false
        input.Parent = container
        input.BackgroundTransparency = 0
        input.BorderSizePixel = 0

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 6)
        corner.Parent = input

        if isNumberOnly then
            input:GetPropertyChangedSignal("Text"):Connect(function()
                input.Text = input.Text:gsub("[^%d]", "")
            end)
        end

        return input
    end

    -- Start at input
    local startAtInput = CreateLabelAndInput(mainFrame, "Start at:", "1", 70, 140, true)

    -- Finish at input
    local finishAtInput = CreateLabelAndInput(mainFrame, "Finish at:", "6", 130, 140, true)

    -- End prefix input (menor largura)
    local endPrefixInput = CreateLabelAndInput(mainFrame, "End Prefix:", "!", 190, 60, false)

    -- Jump toggle container
    local toggleContainer = Instance.new("Frame")
    toggleContainer.Name = "ToggleContainer"
    toggleContainer.BackgroundTransparency = 1
    toggleContainer.Size = UDim2.new(1, 0, 0, 50)
    toggleContainer.Position = UDim2.new(0, 0, 0, 250)
    toggleContainer.Parent = mainFrame

    local toggleLabel = Instance.new("TextLabel")
    toggleLabel.Name = "ToggleLabel"
    toggleLabel.Text = "Jump:"
    toggleLabel.Font = Enum.Font.Gotham
    toggleLabel.TextSize = 18
    toggleLabel.TextColor3 = Color3.new(1,1,1)
    toggleLabel.BackgroundTransparency = 1
    toggleLabel.Position = UDim2.new(0, 15, 0, 10)
    toggleLabel.Size = UDim2.new(0, 100, 0, 30)
    toggleLabel.TextXAlignment = Enum.TextXAlignment.Left
    toggleLabel.Parent = toggleContainer

    local toggleButton = Instance.new("TextButton")
    toggleButton.Name = "ToggleButton"
    toggleButton.BackgroundColor3 = Color3.fromHex("#555555")
    toggleButton.Position = UDim2.new(0, 110, 0, 10)
    toggleButton.Size = UDim2.new(0, 50, 0, 30)
    toggleButton.AutoButtonColor = false
    toggleButton.Parent = toggleContainer

    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, 50)
    toggleCorner.Parent = toggleButton

    local toggleCircle = Instance.new("Frame")
    toggleCircle.Name = "ToggleCircle"
    toggleCircle.BackgroundColor3 = Color3.fromHex("#AAAAAA")
    toggleCircle.Position = UDim2.new(0.22, 0, 0.5, 0)
    toggleCircle.Size = UDim2.new(0, 20, 0, 20)
    toggleCircle.AnchorPoint = Vector2.new(0.5, 0.5)
    toggleCircle.Parent = toggleButton

    local circleCorner = Instance.new("UICorner")
    circleCorner.CornerRadius = UDim.new(0, 50)
    circleCorner.Parent = toggleCircle

    -- Botão play
    local playButton = Instance.new("TextButton")
    playButton.Name = "Play"
    playButton.BackgroundColor3 = Color3.fromHex("#000000")
    playButton.Size = UDim2.new(0, 100, 0, 60)
    playButton.Position = UDim2.new(0.5, 0, 1, -80)
    playButton.AnchorPoint = Vector2.new(0.5, 0)
    playButton.AutoButtonColor = false
    playButton.Parent = mainFrame

    local playCorner = Instance.new("UICorner")
    playCorner.CornerRadius = UDim.new(0, 16)
    playCorner.Parent = playButton

    local playIcon = Instance.new("TextLabel")
    playIcon.Name = "PlayIcon"
    playIcon.Text = "▶️"
    playIcon.Font = Enum.Font.GothamBold
    playIcon.TextSize = 30
    playIcon.TextColor3 = Color3.new(1,1,1)
    playIcon.BackgroundTransparency = 1
    playIcon.Size = UDim2.new(1, 0, 1, 0)
    playIcon.Parent = playButton

    -- Guardar referências dos elementos para o script usar
    UI.UIElements = {
        Start = startAtInput,
        End = finishAtInput,
        Prefix = endPrefixInput,
        Circle = toggleCircle,
        Slide = toggleButton,
        Play = playButton,
        MainFrame = mainFrame,
    }

    screenGui.Parent = UI.Parent or game:GetService("CoreGui")

    -- Controle do toggle jump
    UI.Toggled = false
    toggleButton.MouseButton1Click:Connect(function()
        if UI.Toggled then
            UI.Toggled = false
            TweenService:Create(toggleCircle, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Position = UDim2.new(0.22, 0, 0.5, 0),
            }):Play()
            TweenService:Create(toggleButton, TweenInfo.new(0.3), {
                BackgroundColor3 = Color3.fromHex("#555555"),
            }):Play()
        else
            UI.Toggled = true
            TweenService:Create(toggleCircle, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Position = UDim2.new(0.78, 0, 0.5, 0),
            }):Play()
            TweenService:Create(toggleButton, TweenInfo.new(0.3), {
                BackgroundColor3 = Color3.fromRGB(37, 150, 255),
            }):Play()
        end
    end)

    -- Função arrastar para mobile (toda a MainFrame)
    local dragging = false
    local dragInput, mousePos, framePos

    local function update(input)
        local delta = input.Position - mousePos
        mainFrame.Position = UDim2.new(
            math.clamp(framePos.X.Scale + delta.X / workspace.CurrentCamera.ViewportSize.X, 0, 1),
            framePos.X.Offset + delta.X,
            math.clamp(framePos.Y.Scale + delta.Y / workspace.CurrentCamera.ViewportSize.Y, 0, 1),
            framePos.Y.Offset + delta.Y
        )
    end

    mainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            mousePos = input.Position
            framePos = mainFrame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    mainFrame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end

function UI:SetVersion(version)
    self.Version = version
end

function UI:SetLanguage(lang)
    self.Language = lang
end

function UI:SetRainbow(rainbow)
    self.Rainbow = rainbow
end

function UI:SetParent(parent)
    self.Parent = parent
    if not self.UIElements.MainFrame then
        self:CreateUI()
    else
        self.UIElements.MainFrame.Parent = parent
    end
end

function UI:getUI()
    return self.UIElements.MainFrame
end

return UI
