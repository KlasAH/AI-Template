---
name: core-logic
description: Capability registry for generating Vue 3 components and core physics algorithms.
---

# Core Logic Skill

Use this skill when tasked with generating or updating the frontend codebase (`src/`) and verifying calculations.

## Execution Workflow (Plan-Validate-Execute)
1. **Plan**: Analyze the user logic requirement. Retrieve context from `wiki/concepts/`.
2. **Validate**: Ensure the proposed Vue component or physics script respects constraints:
   - Uses `<script setup>` for Vue.
   - Places purely physical utilities into `.agents/skills/` (for engine use) vs `src/utils/` (for production use).
3. **Execute**: Write the file to disk and log changes to `wiki/log.md`.

## Examples
- The user requests a new Navbar component. You check `wiki/` for styles, generate `src/components/Navbar.vue`, and document in `wiki/log.md`.
- The user requests an update to physics calculation flow. You review `.agents/skills/gravity-engine/scripts/` to ensure no conflicting methods exist before modifying the core.

## Guidelines
- Do not make UI components stateful if they don't need to be. Rely on Pinia or props.
- Document any major architectural decisions in `wiki/concepts/`.
- Ensure component names use Multi-Word format (e.g. `AppHeader.vue`).
