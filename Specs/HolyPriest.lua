-- HealIQ Specs/HolyPriest.lua
-- Support module for Holy Priest specialization

local addonName, HealIQ = ...

HealIQ.Specs = HealIQ.Specs or {}
HealIQ.Specs.HolyPriest = {}
local HolyPriest = HealIQ.Specs.HolyPriest

-- Placeholder spell list for Holy Priest
-- Actual priority logic and spells need to be implemented
HolyPriest.SPELLS = {
    -- Example: Holy Word: Serenity
    HOLY_WORD_SERENITY = {
        id = 2050,
        name = "Holy Word: Serenity",
        icon = "Interface\\Icons\\Spell_Holy_HolyBolt",
        priority = 1,
    }
}

function HolyPriest:IsSupported()
    local _, class = UnitClass("player")
    if class ~= "PRIEST" then
        return false
    end
    local specIndex = GetSpecialization()
    return specIndex == 2 -- Holy
end

if HealIQ and HealIQ.Engine and HealIQ.Engine.RegisterSpec then
    HealIQ.Engine:RegisterSpec("HolyPriest", HolyPriest)
end

return HolyPriest
