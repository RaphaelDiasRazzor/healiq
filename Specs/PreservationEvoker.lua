-- HealIQ Specs/PreservationEvoker.lua
-- Support module for Preservation Evoker specialization

local addonName, HealIQ = ...

HealIQ.Specs = HealIQ.Specs or {}
HealIQ.Specs.PreservationEvoker = {}
local PreservationEvoker = HealIQ.Specs.PreservationEvoker

-- Placeholder spell list for Preservation Evoker
PreservationEvoker.SPELLS = {
    -- Example: Dream Breath
    DREAM_BREATH = {
        id = 382614,
        name = "Dream Breath",
        icon = "Interface\\Icons\\Ability_Evoker_DreamBreath",
        priority = 1,
    }
}

function PreservationEvoker:IsSupported()
    local _, class = UnitClass("player")
    if class ~= "EVOKER" then
        return false
    end
    local specIndex = GetSpecialization()
    return specIndex == 2 -- Preservation
end

if HealIQ and HealIQ.Engine and HealIQ.Engine.RegisterSpec then
    HealIQ.Engine:RegisterSpec("PreservationEvoker", PreservationEvoker)
end

return PreservationEvoker
