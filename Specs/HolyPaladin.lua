-- HealIQ Specs/HolyPaladin.lua
-- Support module for Holy Paladin specialization

local addonName, HealIQ = ...

HealIQ.Specs = HealIQ.Specs or {}
HealIQ.Specs.HolyPaladin = {}
local HolyPaladin = HealIQ.Specs.HolyPaladin

-- Placeholder spell list for Holy Paladin
HolyPaladin.SPELLS = {
    -- Example: Holy Shock
    HOLY_SHOCK = {
        id = 20473,
        name = "Holy Shock",
        icon = "Interface\\Icons\\Spell_Holy_SearingLight",
        priority = 1,
    }
}

function HolyPaladin:IsSupported()
    local _, class = UnitClass("player")
    if class ~= "PALADIN" then
        return false
    end
    local specIndex = GetSpecialization()
    return specIndex == 1 -- Holy
end

return HolyPaladin
