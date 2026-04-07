---
name: gravity-engine
description: Complex physics engine for antigravity simulation
---

# Gravity Engine Skill

This skill provides the core mathematical models for the antigravity simulation. Use it to validate physics-based UI changes.

## Validation Loop
1. Draft the physical field algorithm.
2. Ensure mathematical purity (no UI mixed in).
3. Calculate theoretical forces and run boundary checks.
4. If boundary checks fail, revise the formula. Do not apply to UI until passing.

## Examples
- `simulate_field_interaction` requires calculating vector outputs. The agent tests this with Node.js in `scripts/` before sending to the app.
- G-force boundary calculations exceed standard limits. The agent flags an error output rather than letting the UI crash.

## Guidelines
- The gravity vector is represented as a scalar and assumes a frictionless vacuum state unless specifically modified.
- All calculations must use `requestAnimationFrame` hooks when integrated into Vue 3, not raw `setInterval`.
- Keep mathematical logic in `scripts/` encapsulated purely as standard javascript without DOM dependencies.
