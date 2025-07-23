-- HealIQ Specs/RestorationDruid.lua
-- Default spell definitions for Restoration Druid specialization

local addonName, HealIQ = ...

HealIQ.Specs = HealIQ.Specs or {}
HealIQ.Specs.RestorationDruid = {}
local RestorationDruid = HealIQ.Specs.RestorationDruid

-- Full spell table moved from Engine.lua
local function CreateSpells()
    local TT = HealIQ.Engine and HealIQ.Engine.TARGET_TYPES or {}
    return {
        -- Emergency/Major Cooldowns (Highest Priority)
    TRANQUILITY = {
        id = 740,
        name = "Tranquility",
        icon = "Interface\\Icons\\Spell_Nature_Tranquility",
        priority = 1,
        targets = {TT.SELF}, -- Channel on self, affects all nearby allies
        targetingDescription = "Channel while positioned near injured allies"
    },
    INCARNATION_TREE = {
        id = 33891,
        name = "Incarnation",
        icon = "Interface\\Icons\\Spell_Druid_Incarnation",
        priority = 2,
        targets = {TT.SELF}, -- Self-buff
        targetingDescription = "Activate when group healing is needed"
    },
    NATURES_SWIFTNESS = {
        id = 132158,
        name = "Nature's Swiftness",
        icon = "Interface\\Icons\\Spell_Nature_RavenForm",
        priority = 3,
        targets = {TT.SELF}, -- Self-buff for next spell
        targetingDescription = "Use before emergency heal cast"
    },
    
    -- Core Maintenance (High Priority - keep these active)
    EFFLORESCENCE = {
        id = 145205,
        name = "Efflorescence",
        icon = "Interface\\Icons\\Ability_Druid_Efflorescence",
        priority = 4, -- Higher priority per guide: "keep active as frequently as possible"
        targets = {TT.GROUND_TARGET}, -- Ground-targeted spell
        targetingDescription = "Place where group will be standing"
    },
    LIFEBLOOM = {
        id = 33763,
        name = "Lifebloom",
        icon = "Interface\\Icons\\INV_Misc_Herb_Felblossom",
        priority = 5, -- Higher priority per guide: "keep active on tank"
        targets = {TT.TANK, TT.FOCUS, TT.CURRENT_TARGET}, -- Tank maintenance
        targetingDescription = "Keep active on main tank or focus target"
    },
    
    -- Proc-based spells (High Priority when available)
    REGROWTH = {
        id = 8936,
        name = "Regrowth",
        icon = "Interface\\Icons\\Spell_Nature_ResistNature",
        priority = 6, -- Higher priority when used with Clearcasting
        targets = {TT.LOWEST_HEALTH, TT.CURRENT_TARGET, TT.TANK}, -- Direct heal
        targetingDescription = "Target needs immediate healing"
    },
    
    -- AoE Healing Combo
    SWIFTMEND = {
        id = 18562,
        name = "Swiftmend",
        icon = "Interface\\Icons\\INV_Relics_IdolofRejuvenation",
        priority = 7, -- Higher priority as setup for Wild Growth
        targets = {TT.CURRENT_TARGET, TT.LOWEST_HEALTH}, -- Target with HoTs
        targetingDescription = "Target must have Rejuvenation or Regrowth"
    },
    WILD_GROWTH = {
        id = 48438,
        name = "Wild Growth",
        icon = "Interface\\Icons\\Ability_Druid_WildGrowth",
        priority = 8, -- Often paired with Swiftmend
        targets = {TT.PARTY_MEMBER, TT.CURRENT_TARGET}, -- Smart heal around target
        targetingDescription = "Target near damaged party members"
    },
    
    -- Cooldown Management
    GROVE_GUARDIANS = {
        id = 102693,
        name = "Grove Guardians",
        icon = "Interface\\Icons\\Spell_Druid_Treant",
        priority = 9,
        targets = {TT.SELF}, -- Self-activated with charges
        targetingDescription = "Pool charges for big cooldowns"
    },
    FLOURISH = {
        id = 197721,
        name = "Flourish",
        icon = "Interface\\Icons\\Spell_Druid_WildGrowth",
        priority = 10,
        targets = {TT.SELF}, -- Affects all your HoTs
        targetingDescription = "Use when multiple HoTs are active"
    },
    
    -- Defensive/Utility
    IRONBARK = {
        id = 102342,
        name = "Ironbark",
        icon = "Interface\\Icons\\Spell_Druid_IronBark",
        priority = 11,
        targets = {TT.TANK, TT.CURRENT_TARGET, TT.FOCUS}, -- Damage reduction
        targetingDescription = "Prioritize tanks or targets taking heavy damage"
    },
    BARKSKIN = {
        id = 22812,
        name = "Barkskin",
        icon = "Interface\\Icons\\Spell_Nature_StoneSkinTotem",
        priority = 12,
        targets = {TT.SELF}, -- Self-defensive
        targetingDescription = "Use when taking damage"
    },
    
    -- Ramping HoTs (Lower priority during maintenance, higher during damage phases)
    REJUVENATION = {
        id = 774,
        name = "Rejuvenation",
        icon = "Interface\\Icons\\Spell_Nature_Rejuvenation",
        priority = 13,
        targets = {TT.PARTY_MEMBER, TT.CURRENT_TARGET, TT.TANK}, -- Basic HoT
        targetingDescription = "Apply to targets without HoT coverage"
    },
    
    -- Filler/Mana Management
    WRATH = {
        id = 5176,
        name = "Wrath",
        icon = "Interface\\Icons\\Spell_Nature_AbolishMagic",
        priority = 14,
        targets = {TT.CURRENT_TARGET}, -- Enemy target
        targetingDescription = "Use on enemies during downtime for mana restoration"
    },
    }
end

function RestorationDruid:GetSpells()
    if not self.SPELLS then
        self.SPELLS = CreateSpells()
    end
    return self.SPELLS
end

function RestorationDruid:IsSupported()
    local _, class = UnitClass("player")
    if class ~= "DRUID" then
        return false
    end
    local specIndex = GetSpecialization()
    return specIndex == 4 -- Restoration
end

return RestorationDruid

if HealIQ and HealIQ.Engine and HealIQ.Engine.RegisterSpec then
    HealIQ.Engine:RegisterSpec("RestorationDruid", RestorationDruid)
end
