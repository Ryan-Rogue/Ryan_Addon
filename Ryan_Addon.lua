---@type string
local addonName = ...
---@class ns
local addon = select(2, ...)

local ADDON_VERSION = 2 -- Increment this when you want to reset defaults


-- Default settings.
-----------------------------------------------------------
local defualt = {
    Evoker = {
        Prescience = {},
    },
    Rogue =  {},
    CTT = {
        ["disorient"] = {},
        ["disorientImmuneFound"] = {},
        ["incapacitate"] = {},
        ["incapacitateImmuneFound"] = {},
        ["silence"] = {},
        ["silenceImmuneFound"] = {},
        ["stun"] = {},
        ["stunImmuneFound"] = {},
        ["root"] = {},
        ["rootImmuneFound"] = {},
        ["disarm"] = {},
        ["disarmImmuneFound"] = {},
        ["taunt"] = {},
        ["tauntImmuneFound"] = {},
        ["knockback"] = {},
        ["knockbackImmuneFound"] = {},
    },
    Shaman = {},
    DeathKnight = {},
    DemonHunter = {},
    Druid = {},
    Hunter = {},
    Mage = {},
    Monk = {},
    Paladin = {},
    Priest = {},
    Warlock = {},
    Warrior = {}
}

local type = type


addon.eventFrame = CreateFrame("Frame", addonName .. "EventFrame", UIParent)
addon.eventFrame:RegisterEvent("ADDON_LOADED")
addon.eventFrame:SetScript("OnEvent", function(_, event, ...)
    if event == "ADDON_LOADED" then
        local name = ...
        if name == addonName then
            addon.eventFrame:UnregisterEvent("ADDON_LOADED") -- Only do it once
            --Create the table
            if _G[addonName] == nil then _G[addonName] = {{ version = ADDON_VERSION }} end --create the table

            -- Check version and reset if outdated
            if _G[addonName].version ~= ADDON_VERSION then
                _G[addonName] = { version = ADDON_VERSION } -- Reset the table
            end

            Ryan_Addon = _G[addonName]

            -- Initialize missing sections with defaults
            for key in pairs(defualt) do
                if Ryan_Addon[key] == nil then
                    Ryan_Addon[key] = defualt[key]
                end
            end
        end
    end
end)

-----------------------------------------------------------------
--Accept LFG Queues (I'm lazy and so are my users!)
------------------------------------------------------------------
LFDRoleCheckPopupAcceptButton:SetScript("OnShow", function() LFDRoleCheckPopupAcceptButton:Click(); end)
