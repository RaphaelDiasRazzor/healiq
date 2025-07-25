# HealIQ

**HealIQ** is a smart spell suggestion addon for healers in World of Warcraft. Originally built for Restoration Druids, it now includes basic support for multiple healing specializations through modular spec files. The addon helps you prioritize your next healing spell based on current combat context, active HoTs, procs, and cooldowns.

## 🧠 What It Does

- Displays optimal healing spell suggestions based on Wowhead Restoration Druid guide
- Tracks HoT durations (e.g. Lifebloom, Rejuvenation)
- Recognizes Clearcasting procs and emergency situations
- Shows Swiftmend combo opportunities and AoE healing priorities
- Alerts for cooldown-based healing (e.g. Wild Growth, Tranquility)
- Supports movement and configuration of suggestion UI
- Shows upcoming suggestions in a queue display
- Automatically detects specialization changes and loads the appropriate module
- Specialization modules register themselves with the engine for seamless multi-spec support
- Provides extensive strategy customization options

**Enhanced Strategy Features:**
- Efflorescence maintenance prioritization
- Smart Lifebloom tank management with bloom timing
- Clearcasting proc optimization
- Swiftmend + Wild Growth combo suggestions
- Grove Guardians charge pooling
- Wrath filler for mana restoration
- Configurable thresholds for all healing decisions

**Note:** HealIQ provides visual suggestions only. Due to Blizzard restrictions, spell casting must be done manually using your normal keybinds or action bars.

> HealIQ is inspired by Hekili, but for healing. It was designed with Restoration Druids in mind, but now includes experimental modules for other healing classes.

## 📦 Installation

### From CurseForge (Recommended)
- Download from [CurseForge](https://curseforge.com) using the CurseForge app or website
- Automatic updates and dependency management

### Manual Installation
1. Download the latest release from [GitHub Releases](https://github.com/djdefi/healiq/releases)
2. Unzip to your `Interface/AddOns/` directory
3. Enable the addon in the WoW AddOn menu
4. Type `/healiq` for basic options and slash commands (coming soon)

## 🔧 Configuration

- UI icon is movable (drag-and-drop)
- Suggestions shown via a single icon by default
- Queue preview shows upcoming spell suggestions
- Extensive strategy customization via `/healiq strategy` commands
- Rule enable/disable via `/healiq rules` commands
- All healing thresholds and priorities are tunable

**Strategy Configuration:**
- Access via `/healiq strategy list` to see all settings
- Modify with `/healiq strategy set <setting> <value>`
- Reset to optimal defaults with `/healiq strategy reset`
- See [STRATEGY.md](STRATEGY.md) for detailed configuration guide

## 📜 Planned Features

- DBM integration for upcoming damage phases
- Rule customization (enable/disable rules)
- Visual “queue” preview
- Support for hybrid Resto-DPS catweaving

## 💡 Why Use This?

Healing doesn’t follow a strict rotation, but there are patterns of optimal decision-making. HealIQ helps you build muscle memory and learn when to refresh HoTs, use procs, or prep cooldowns for big AoE.

## 🛠 For Developers

This addon is written in Lua using the WoW AddOn API.

To add support for another healing specialization, create a file in `Specs/` that
defines your spell table and an `IsSupported` method. At the end of the file,
register the module with `HealIQ.Engine:RegisterSpec("YourSpecName", module)` so
the core engine can load it automatically when the player swaps specs.

Contributions and suggestions welcome via [Issues](https://github.com/djdefi/healiq/issues) and PRs.

---

## 🔒 License

MIT License
