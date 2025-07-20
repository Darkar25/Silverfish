<img width="64" height="64" alt="SilverFish icon HD" src="https://github.com/user-attachments/assets/25cf00c8-26c6-41e2-ac58-276f1a7e7414" align="left" hspace="15" />

Silverfish is an experiment exploring what would happen if a shaderpack developer turned to the dark side, creating a shader with visual "enhancements" rather than genuine visual enhancements.


## Disclaimer

Please be aware that Silverfish is an experimental project created solely for research and to explore the technical capabilities of shaderpacks. It is **not** intended to be used as a cheating tool on public multiplayer servers.

Using features like X-Ray or ESP on servers where they are prohibited will likely violate their terms of service and can result in a permanent ban. The author does not condone cheating and is not responsible for any punitive action taken against your account. **Use at your own risk.**

## Features

### X-Ray
See ores through walls.

- **Rendering:**
  - **Textured mode:** Renders the ore's texture on top of everything else.
  - **Glow mode:** Renders a soft glow around the selected ores.
    - Allows you to select a glow color for all ores or for specific mods.
  - **Chams mode:** Renders ores in different colors based on whether they are directly visible or behind a wall.
    - Allows you to select the colors for visible and invisible ores.
  - *Multiple modes can be enabled simultaneously (Textured mode is incompatible with Chams mode).*
- **Configuration:**
  - **Base set:** Defines a base set of ores (all or empty).
  - **Known ore groups:** Allows you to override the base set by forcibly including or excluding specific types of ores from being x-rayed.
  - **Mod groups:** Allows you to override the base set by forcibly including or excluding specific mods from being x-rayed.
  - **Advanced mode:** Allows you to include or exclude specific ores from being x-rayed.

### ESP
See entities through walls.

- **Rendering:**
  - **Textured mode:** Renders the entity's texture on top of everything else.
  - **Glow mode:** Renders a soft glow around the selected entities.
    - Allows you to select a glow color for all entities or for specific entity groups.
  - **Chams mode:** Renders entities in different colors based on whether they are directly visible or behind a wall.
    - Allows you to select the colors for visible and invisible entities.
  - *Multiple modes can be enabled simultaneously (Textured mode is incompatible with Chams mode).*
- **Configuration:**
  - **Base set:** Defines a base set of entities (all or empty).
  - **Entity groups:** Allows you to override the base set by forcibly including or excluding specific types of entities from the ESP.
  - **Advanced mode:** Allows you to include or exclude specific entities from the ESP.

### Chest ESP
See tile entities (like chests) through walls.

- **Rendering:**
  - **Textured mode:** Renders the tile entity's texture on top of everything else.
  - **Glow mode:** Renders a soft glow around the selected tile entities.
    - Allows you to select the glow color.
  - **Chams mode:** Renders tile entities in different colors based on whether they are directly visible or behind a wall.
    - Allows you to select the colors for visible and invisible tile entities.
  - *Multiple modes can be enabled simultaneously (Textured mode is incompatible with Chams mode).*
- **Configuration:**
  - Allows you to select which tile entities to display with ESP.

### Fullbright
Makes everything appear fully lit, allowing you to see clearly in the dark.

### Cave Finder
See caves through walls.
- Allows you to configure the transparency of the caves.

### No Weather
Disables rain and snow effects.

### Kill Switch
Quickly disables all features, making the shader behave like the vanilla renderer.

## Tested Versions
- **1.7.10** (OptiFine)
- **1.21.4** (OptiFine & Iris)

Probably works on all minecraft versions from 1.7.2 to the latest with OptiFine & Iris.

## Installation guide
1. Download the Silverfish shaderpack
2. Navigate to your minecraft directory (%appdata%/.minecraft/)
3. Drop the "Silverfish" folder in the "shaderpacks" directory
4. Select the "Silverfish" shaderpack in the OptiFine/Iris shaderpack selection list
