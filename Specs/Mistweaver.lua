-- HealIQ Specs/Mistweaver.lua
-- Support module for Mistweaver Monk specialization

local addonName, HealIQ = ...

HealIQ.Specs = HealIQ.Specs or {}
HealIQ.Specs.Mistweaver = {}
local Mistweaver = HealIQ.Specs.Mistweaver

-- Placeholder spell list for Mistweaver Monk
Mistweaver.SPELLS = {
    -- Example: Vivify
    VIVIFY = {
        id = 116670,
        name = "Vivify",
        icon = "Interface\\Icons\\spell_monk_vivify",
        priority = 1,
    }
}

function Mistweaver:IsSupported()
    local _, class = UnitClass("player")
    if class ~= "MONK" then
        return false
    end
    local specIndex = GetSpecialization()
    return specIndex == 2 -- Mistweaver
end

return Mistweaver

if HealIQ and HealIQ.Engine and HealIQ.Engine.RegisterSpec then
    HealIQ.Engine:RegisterSpec("Mistweaver", Mistweaver)
end
