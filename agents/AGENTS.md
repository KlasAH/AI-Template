# Antigravity Project Manifest (System Prompt)

## Environment
- Frontend: Vue 3 (Vite + TypeScript)
- State Management: Pinia
- Architecture: Agentic Skill-based

## Instructions for Gemini
1. **Component Logic**: All Vue 3 components must be placed strictly into `src/components/`. Use modern Vue 3 `<script setup>` syntax.
2. **Core Capabilities**: All physical calculations or business logic must be placed into `.agents/skills/`.
3. **Knowledge Retrieval**: Always read the `wiki/` directory before writing code. Treat `src/` as runtime and `wiki/` as your persistent memory banks.

## Structure Guide
- `.agents/AGENTS.md`: Unified Repo Instructions (Current File)
- `.agents/skills/`: Capability registry & instructions with YAML frontmatter.
- `wiki/`: Your persistent memory for requirements and logic.
- `src/`: The front-end view layer.
- `raw/`: Immutable source documents.
- `.codex/`: Tool-specific configurations.
