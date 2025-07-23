-- HealIQ Specs/DisciplinePriest.lua
-- Support module for Discipline Priest specialization

local addonName, HealIQ = ...

HealIQ.Specs = HealIQ.Specs or {}
HealIQ.Specs.DisciplinePriest = {}
local DisciplinePriest = HealIQ.Specs.DisciplinePriest

-- Placeholder spell list for Discipline Priest
DisciplinePriest.SPELLS = {
    -- Example: Power Word: Shield
    POWER_WORD_SHIELD = {
        id = 17,
        name = "Power Word: Shield",
        icon = "Interface\\Icons\\Spell_Holy_PowerWordShield",
        priority = 1,
    }
}

function DisciplinePriest:IsSupported()
    local _, class = UnitClass("player")
    if class ~= "PRIEST" then
        return false
    end
    local specIndex = GetSpecialization()
    return specIndex == 1 -- Discipline
end

return DisciplinePriest

if HealIQ and HealIQ.Engine and HealIQ.Engine.RegisterSpec then
    HealIQ.Engine:RegisterSpec("DisciplinePriest", DisciplinePriest)
end
