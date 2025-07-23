-- HealIQ Specs/RestorationShaman.lua
-- Support module for Restoration Shaman specialization

local addonName, HealIQ = ...

HealIQ.Specs = HealIQ.Specs or {}
HealIQ.Specs.RestorationShaman = {}
local RestorationShaman = HealIQ.Specs.RestorationShaman

-- Placeholder spell list for Restoration Shaman
RestorationShaman.SPELLS = {
    -- Example: Riptide
    RIPTIDE = {
        id = 61295,
        name = "Riptide",
        icon = "Interface\\Icons\\spell_nature_riptide",
        priority = 1,
    }
}

function RestorationShaman:IsSupported()
    local _, class = UnitClass("player")
    if class ~= "SHAMAN" then
        return false
    end
    local specIndex = GetSpecialization()
    return specIndex == 3 -- Restoration
end

return RestorationShaman

if HealIQ and HealIQ.Engine and HealIQ.Engine.RegisterSpec then
    HealIQ.Engine:RegisterSpec("RestorationShaman", RestorationShaman)
end
