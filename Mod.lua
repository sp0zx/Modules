local module = {}

local D = game:GetObjects("rbxassetid://71707380892807")[1]
D.Parent = game.Players.LocalPlayer.PlayerGui

local Last = 0

function module.LoadIntro()
    local Dex = D
    local WelcFrame = Dex.WelcomeFrame
    local TweenTime = 0.5

    WelcFrame:TweenSizeAndPosition(UDim2.new(0, 500, 0, 300), UDim2.new(0.5, 0, 0.5, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, TweenTime)

    for i, v in pairs(WelcFrame:GetDescendants()) do
        if v:IsA('TextLabel') then
            v:SetAttribute("TT", v.TextTransparency)
            v.TextTransparency = 1
        end
    end

    for i, v in pairs(WelcFrame:GetDescendants()) do
        if v:IsA('TextLabel') then
            v:SetAttribute("TT", v.TextTransparency)
            v.TextTransparency = 1
        end
    end

    task.wait(TweenTime - tonumber(TweenTime / 2.5))
    local TextTT = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

    for i, v in pairs(WelcFrame:GetDescendants()) do
        if v:IsA('TextLabel') and v.Parent.Name ~= "Progress" then
            v.Position = UDim2.new(v.Position.X.Scale, v.Position.X.Offset, v.Position.Y.Scale - 0.05, v.Position.Y.Offset)
            v:TweenPosition(UDim2.new(v.Position.X.Scale, v.Position.X.Offset, v.Position.Y.Scale + 0.05, v.Position.Y.Offset), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.25)
            game:GetService('TweenService'):Create(v, TextTT, { TextTransparency = 0 }):Play()
        end
    end
end

function module.LoadProgress(ProgNUMB)
    local Dex = D
    local WelcFrame = Dex.WelcomeFrame
    local Progress = WelcFrame.Content.Main.Progress
    local Number = tostring(ProgNUMB)

    for i, Label in pairs(Progress:GetChildren()) do
        if Label:IsA('TextLabel') and string.find(Label.Name, Number) then
            local TextTT = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            Label.Position = UDim2.new(Label.Position.X.Scale - 0.05, Label.Position.X.Offset, Label.Position.Y.Scale, Label.Position.Y.Offset)
            Label:TweenPosition(UDim2.new(Label.Position.X.Scale + 0.05, Label.Position.X.Offset, Label.Position.Y.Scale, Label.Position.Y.Offset), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.25)
            game:GetService('TweenService'):Create(Label, TextTT, { TextTransparency = 0 }):Play()
        end
    end
end

function module.SetProgressBar(targetPercent)
    local Dex = D
    local WelcFrame = Dex:WaitForChild("WelcomeFrame")
    local ProgressLine = WelcFrame.Content.Main.Progress.Line
    local UIGRAD = ProgressLine:WaitForChild("UIGradient")

    local proxy = Instance.new("NumberValue")
    proxy.Value = Last

    local tween = game:GetService("TweenService"):Create(proxy, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
        Value = math.clamp(tonumber(targetPercent), 0, 1)
    })
    tween:Play()

    local connection
    connection = proxy:GetPropertyChangedSignal("Value"):Connect(function()
        local v = proxy.Value
        pcall(function()
            UIGRAD.Color = ColorSequence.new {
                ColorSequenceKeypoint.new(0.0, Color3.fromRGB(11, 190, 255)),
                ColorSequenceKeypoint.new(math.clamp(v - 0.05, 0, 1), Color3.fromRGB(11, 190, 255)),
                ColorSequenceKeypoint.new(v, Color3.fromRGB(80, 80, 80)),
                ColorSequenceKeypoint.new(1.0, Color3.fromRGB(80, 80, 80))
            }
        end)
    end)

    tween.Completed:Connect(function()
        connection:Disconnect()
        Last = targetPercent
    end)
end

function module.CompleteIntro()
    local Dex = D
    local WelcFrame = Dex.WelcomeFrame
    local TweenTime = 0.5
    local TextTT = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

    for i, v in pairs(WelcFrame:GetDescendants()) do
        if (v:IsA('TextLabel') or v:IsA('TextButton')) and v.Text ~= "DEX" then
            v:TweenPosition(UDim2.new(v.Position.X.Scale, v.Position.X.Offset, v.Position.Y.Scale - 0.05, v.Position.Y.Offset), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.4)
            game:GetService('TweenService'):Create(v, TextTT, { TextTransparency = 1 }):Play()
        end
    end

    wait(0.5)
    local ImgT = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

    for i, v in pairs(WelcFrame:GetDescendants()) do
        if v:IsA('Frame') then
            game:GetService('TweenService'):Create(v, ImgT, { BackgroundTransparency = 1 }):Play()
        elseif v:IsA('ImageLabel') then
            game:GetService('TweenService'):Create(v, ImgT, { ImageTransparency = 1 }):Play()
        elseif v:IsA('UIStroke') then
            game:GetService('TweenService'):Create(v, ImgT, { Transparency = 1 }):Play()
        elseif (v:IsA('TextLabel') or v:IsA('TextButton')) and v.Text ~= "DEX" then
            game:GetService('TweenService'):Create(v, ImgT, { TextTransparency = 1 }):Play()
        end
    end

    WelcFrame:TweenSizeAndPosition(UDim2.new(0, 32, 0, 32), UDim2.new(0.5, 0, 0.5, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, TweenTime)
    game:GetService('TweenService'):Create(WelcFrame.UICorner, ImgT, { CornerRadius = UDim.new(0, 4) }):Play()

    game:GetService('TweenService'):Create(WelcFrame.Content.Main.Title, ImgT, { TextSize = 16 }):Play()
    game:GetService('TweenService'):Create(WelcFrame.Content.Main.Title, ImgT, { Size = UDim2.new(1, 0, 1, 0) }):Play()
    game:GetService('TweenService'):Create(WelcFrame.Content.Main.Title, ImgT, { AnchorPoint = Vector2.new(0.5, 0.5) }):Play()
    game:GetService('TweenService'):Create(WelcFrame.Content.Main.Title, ImgT, { Position = UDim2.new(0.5, 0, 0.5, 0) }):Play()

    local ImgT = TweenInfo.new(TweenTime, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

    game:GetService('TweenService'):Create(WelcFrame.Content.Main, ImgT, { Size = UDim2.new(1, 0, 1, 0) }):Play()
    game:GetService('TweenService'):Create(WelcFrame.Content.Main, ImgT, { Position = UDim2.new(0, 0, 0, 0) }):Play()

    game:GetService('TweenService'):Create(WelcFrame.Content, ImgT, { Size = UDim2.new(1, 0, 1, 0) }):Play()
    game:GetService('TweenService'):Create(WelcFrame.Content, ImgT, { Position = UDim2.new(0, 0, 0, 0) }):Play()

    task.wait(1)

    game:GetService('TweenService'):Create(WelcFrame, ImgT, { Position = UDim2.new(0.5, 0, -0.057, 0) }):Play()
    game:GetService('TweenService'):Create(WelcFrame, ImgT, { AnchorPoint = Vector2.new(0.5, 0) }):Play()
    game:GetService('TweenService'):Create(WelcFrame, ImgT, { BackgroundTransparency = 0.2 }):Play()
end

return module
