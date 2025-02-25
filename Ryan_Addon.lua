---@type string
local addonName = ...
---@class ns
local addon = select(2, ...)

local ADDON_VERSION = 2 -- Increment this when you want to reset defaults

-- Default settings.
-----------------------------------------------------------
addon.db = {
    version = ADDON_VERSION,
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

            -- Ensure Ryan_Addon table exists
            if type(Ryan_Addon) ~= "table" then
                Ryan_Addon = {}
            end

            -- Check version and reset if outdated
            if Ryan_Addon.version ~= ADDON_VERSION then
                Ryan_Addon = { version = ADDON_VERSION } -- Reset the table
            end

            local db = Ryan_Addon
            -- Initialize missing sections with defaults
            for key in pairs(addon.db) do
                if db[key] == nil then
                    db[key] = addon.db[key]
                end
            end
        end
    end
end)



-----------------------------------------------------------------
--Accept LFG Queues (I'm lazy and so are my users!)
------------------------------------------------------------------
LFDRoleCheckPopupAcceptButton:SetScript("OnShow", function() LFDRoleCheckPopupAcceptButton:Click(); end)