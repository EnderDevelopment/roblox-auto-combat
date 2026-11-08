# AutoStrike Roblox Script

AutoStrike is a server-side Roblox script for adding configurable touch-triggered kill zones to an experience you own or are authorized to edit. Place parts in the designated Workspace folder, and player characters that touch them are eliminated.

## Install

1. Open your experience in Roblox Studio.
2. Create a normal `Script` in `ServerScriptService`.
3. Copy the contents of `AutoKill.server.lua` into the script.
4. Create a folder named `AutoKillParts` in `Workspace`. If it is missing, the script creates it when it runs.
5. Add one or more `BasePart` objects to the folder, directly or inside nested models or folders.
6. Make sure each kill part has `CanTouch` enabled, then position and size the parts as needed.

## Use

1. Run the experience in Roblox Studio.
2. When a player character touches a part inside `Workspace.AutoKillParts`, the server sets the character’s Humanoid health to zero.
3. Add or remove parts while the experience is running; the script connects and disconnects touch handling as descendants change.

The script ignores non-player models and characters whose Humanoid is already dead. For a kill floor, use a large anchored part; set `CanCollide` to false if players should pass through it.

---

More Roblox script projects by EnderDevelopment: https://github.com/EnderDevelopment

Project page: https://dash.enderdevelopment.com/community/56f64f90-264f-4def-ac4c-3731be6f766b?utm_source=github&utm_medium=readme&utm_campaign=auto_publish&utm_content=56f64f90-264f-4def-ac4c-3731be6f766b
