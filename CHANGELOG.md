# Changelog

v0.4 - 04/01/2024

- Weight and Movement:
  - Increased weight limit before fatigue from 30kg to 35kg (matches vanilla COP and offers a more vanilla gameplay experience).
  - Increased maximum weight for movement from 50kg to 60kg (aligns with vanilla values across all three STALKER games).
- Player Character Properties (Aligned with CS):
  - Adjusted movement properties (run, walk, sprint, etc.) to match CS values. These values provide a more balanced gameplay experience for the player character, as observed during testing.

v0.3 - 03/18/2024

- Restored more vanilla behavior for medical items and food. Changes:
  - Using medical items no longer penalizes stamina.
  - Food no longer restores stamina.
- Made red hit marks invisible on HUD from mutants and NPCs (optional feature).
- Slowed the sprint speed down to a much more reasonable pace.

v0.2 - 03/09/2024

- Updated mini-addon InGameSubs for PRP v1.2 to v0.3.

v0.1 - 03/02/2024

- Enabled automatic ammo boxing.
- Enabled better bullet piercing (from CS).
- Enabled quieting the starting nightvision sound and the ending nightvision sound.
- Enabled the NPC ability to turn off flashlights.
- Enabled Uncle Yar will charge for repairs.
- Enabled real weapon names.
- Enabled less fog on clear days, more fog on cloudy days.
- Enabled receiving Flint's loot as reward.
- Enabled medic replacement for Tremor.
- Enabled anabiotic fix and Svarog fix.
- Reduced max_item_mass (weight limit before fatigue) from 50kg to 30kg.
- Reduced max_walk_weight (maximum weight for movement) from 60kg to 50kg.
- Enabled reduced head bobbing.
- Implemented ZRP/SRP-style named quick-saves: Press "S" in the main menu to create a named save file during gameplay.
- Enabled no enemy minimap spots.
- Hidden grenade indicator on HUD.
- Muted NPC detection sounds on PDA.
- Hidden NPC counter number on HUD.
- Hidden ammo counter on HUD.
- Made crosshair smaller.
- Removed some elements on minimap and HUD:
  - Minimap:
    - Direction of current objective.
    - Red hit shoot mark.
  - HUD:
    - NPC counter indicator.
- Hidden grenade shell ammo counter on HUD.
- Removed quick slot on HUD.
- Enabled smaller inventory grids.
- Hidden scroll bar by default in actor_menu_16.xml (as in SRP).
- Enabled making quest items removable.
- Disabled tagging NPCs through the binoculars.
- Disabled sound notification of detected NPCs through the binoculars.
- Disabled sound notification of NPCs trough modified scopes.
- Enabled ZRP flashlight beam.
- Fixed the scope (and binocular) views when running the game in 16:9 resolutions (included optional patch when running the game in DX10 and DX11).
- Set COP FOV to 67.5 (match SOC/CS).
- Implemented SRP hide/restore HUD feature:
  - Disabled feature by default.
  - HUD instantly reappears in-game upon restoring, removing the need to return from the main menu.
  - HUD instantly disappears in-game upon hiding, removing the need to return from the main menu.
- Add new functionality to PRP Modifier:
  - Added ability to enable/disable HUD from the main menu.
- Implemented mini-addon InGameSubs for PRP (Added subs and PDA messages to the English sounds used in-game. ).
- Removed 1s timeout effect to some PDA messages.
- Implemented Medicine Mod for PRP compatibility and addressed audio issues:
  - Adapted Medicine Mod for seamless integration with PRP.
  - Fixed minor audio inconsistencies related to consumable items.
  - Added long usage and sound effects for all consumable items.
- Enabled no intro movies.
- Added optional LuaJIT library to improve performance.
- Enabled no weapon sway on strafe.
- Improved inventory icon for RPG-7 (from SRP).
- Made Random Treasure Mod compatible with Mini Repack (PRP Modifier).
