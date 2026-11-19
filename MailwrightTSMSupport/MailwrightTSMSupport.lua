local mailwright = Mailwright
if type(mailwright) ~= "table" or type(mailwright.BuildUI) ~= "function" then
    return
end

local SETTINGS_OFFSET_X = -65
local SETTINGS_RELATIVE_LEVEL = 650

local function ApplySettingsButtonLayout()
    local mailFrame = MailFrame
    if not mailFrame or not mailFrame:IsVisible() then
        return
    end

    local button = mailwright.settingsButton
    local close = MailFrameCloseButton or mailFrame.CloseButton
    if not close or type(button) ~= "table" or type(button.IsObjectType) ~= "function"
        or not button:IsObjectType("Button") or button:GetParent() ~= mailFrame then
        return
    end

    local level = mailFrame:GetFrameLevel() + SETTINGS_RELATIVE_LEVEL
    if button:GetFrameLevel() ~= level then
        button:SetFrameLevel(level)
    end

    local point, relativeTo, relativePoint, x, y = button:GetPoint(1)
    if button:GetNumPoints() ~= 1 or point ~= "RIGHT" or relativeTo ~= close
        or relativePoint ~= "LEFT" or x ~= SETTINGS_OFFSET_X or y ~= 0 then
        button:ClearAllPoints()
        button:SetPoint("RIGHT", close, "LEFT", SETTINGS_OFFSET_X, 0)
    end
end

local watchingMailFrame = false
local function AfterBuildUI()
    -- MailFrame may become available after this addon is loaded.
    if not watchingMailFrame and MailFrame then
        MailFrame:HookScript("OnShow", ApplySettingsButtonLayout)
        watchingMailFrame = true
    end
    ApplySettingsButtonLayout()
end

hooksecurefunc(mailwright, "BuildUI", AfterBuildUI)
AfterBuildUI()
