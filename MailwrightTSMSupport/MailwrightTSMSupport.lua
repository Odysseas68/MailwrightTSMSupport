local mailwright = Mailwright
if type(mailwright) ~= "table" or type(mailwright.BuildUI) ~= "function" then
    return
end

local ORIGINAL_RELATIVE_LEVEL = 10
local SETTINGS_OFFSET_X = -65
local SETTINGS_RELATIVE_LEVEL = 650
local appliedLayouts = setmetatable({}, { __mode = "k" })

local function GetCloseAnchorOffset(button, close)
    if button:GetNumPoints() ~= 1 then
        return
    end

    local point, relativeTo, relativePoint, x, y = button:GetPoint(1)
    if point == "RIGHT" and relativeTo == close and relativePoint == "LEFT" and y == 0 then
        return x
    end
end

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

    local applied = appliedLayouts[button]
    if applied == false then
        return
    end

    local buttonLevel = button:GetFrameLevel()
    if applied then
        -- Once an observed edit replaces our layout, leave this instance alone.
        if GetCloseAnchorOffset(button, applied.close) ~= SETTINGS_OFFSET_X or buttonLevel ~= applied.level then
            appliedLayouts[button] = false
        end
        return
    end

    local parentLevel = mailFrame:GetFrameLevel()
    if GetCloseAnchorOffset(button, close) ~= 0 or buttonLevel ~= parentLevel + ORIGINAL_RELATIVE_LEVEL then
        return
    end

    local level = parentLevel + SETTINGS_RELATIVE_LEVEL
    button:SetFrameLevel(level)
    button:ClearAllPoints()
    button:SetPoint("RIGHT", close, "LEFT", SETTINGS_OFFSET_X, 0)
    appliedLayouts[button] = { close = close, level = level }
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
