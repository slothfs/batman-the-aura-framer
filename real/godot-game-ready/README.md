# Godot Tutorial Components & Scripts

This is a ready-to-use Godot project containing scripts and components from RapidVectors.

## Quick Start

1. **Extract this ZIP file**
2. **Open with Godot 4.1+**
3. **Run the project** - Press F5 or click the Play button

## What's Included

### 📁 Project Structure

```
godot-game-ready/
├── project.godot              # Godot project configuration
├── scenes/
│   └── main.tscn              # Main startup scene
├── croptails_scripts/         # Croptails farming game scripts
│   ├── dialogue/              # Dialogue system
│   ├── resources/             # Game data resources
│   ├── scenes/                # Character, NPC, and UI scripts
│   └── scripts/               # Core game managers
├── base_scripts/              # Base state machine implementations
│   ├── state_machine_v1/      # State Machine v1
│   └── finite_state_machine/  # Finite State Machine
├── sprites/                   # Game sprite assets
│   └── chronobot/             # Chronobot character sprites
└── audio/                     # Game audio files
```

### 🎮 Game Components Available

#### **State Machine Systems**
- `base_scripts/state_machine_v1/` - Traditional node-based state machine
- `base_scripts/finite_state_machine/` - Finite state machine implementation

#### **Croptails Game Scripts** (Farming Game)
- **Player System**: Movement, actions, state management
- **NPC System**: Non-playable characters with dialogue
- **Component System**: Reusable game components
  - Collectible Component
  - Damage/Hurt Component
  - Interactable Component
  - Save Data Component
  - And many more...
- **Game Managers**: 
  - Game Manager
  - Inventory Manager
  - Save Game Manager
  - Day/Night Cycle Manager
  - Dialogue Manager
- **UI Screens**: Game menu, inventory, tools panel

### 🔧 How to Use These Scripts

1. **Study the Scripts**: Browse the `croptails_scripts/` folder to understand game architecture
2. **Copy Components**: Use these scripts as templates for your own projects
3. **State Machine Examples**: Check `base_scripts/` for state management patterns
4. **Component Pattern**: Learn the component-based architecture approach

### 📚 Key Features

✅ Complete game component examples
✅ Professional game architecture patterns
✅ State machine implementations
✅ Inventory and save system examples
✅ NPC and dialogue system
✅ UI management screens
✅ Day/night cycle system

### 💡 Next Steps

1. Open `croptails_scripts/` to explore the game scripts
2. Check the player.gd file to see the main player logic
3. Review the manager scripts to understand game systems
4. Use these patterns in your own Godot projects

### ⚙️ Requirements

- **Godot Engine 4.1 or later**
- No additional plugins or dependencies required

---

**Source**: RapidVectors Tutorial Components and Scripts
**GitHub**: https://github.com/rapidvectors/tutorial-components-and-scripts
