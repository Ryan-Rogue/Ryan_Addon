---@type string
local addonName = ...
---@class ns
local addon = select(2, ...)


-- Default settings.
-----------------------------------------------------------
addon.db = {
    Evoker = {
        Prescience = {},
    },
    Rogue =  {
    },
    CTT = {
        ["stunned"] = {},
        ["knocked"] = {},
        ["knockImmuneFound"] = {},
        ["CCImmuneFound"] = {},
        ["ironWired"] = {},
        ["ironWiredImmuneFound"] = {},
    },
    Shaman = {
    },
}


addon.eventFrame = CreateFrame("Frame", addonName .. "EventFrame", UIParent)
addon.eventFrame:RegisterEvent("ADDON_LOADED")
addon.eventFrame:SetScript("OnEvent", function(_, event, ...)
    if event == "ADDON_LOADED" then
        local name = ...
        if name == addonName then
            addon.eventFrame:UnregisterEvent("ADDON_LOADED") -- only do it once
            if (type(Ryan_Addon) ~= "table") then Ryan_Addon = {} end -- our table did not exisit
            local db = Ryan_Addon
            for key in pairs(addon.db) do
                if (db[key] == nil) then db[key] = addon.db[key] end--  If our option is not present, set default value
            end

        end
    end
end)



-----------------------------------------------------------------
--Accept LFG Queues (I'm lazy and so are my users!)
------------------------------------------------------------------
LFDRoleCheckPopupAcceptButton:SetScript("OnShow", function() LFDRoleCheckPopupAcceptButton:Click(); end)