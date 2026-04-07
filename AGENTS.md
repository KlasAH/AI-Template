# Antigravity Project Manifest

## Environment
- Frontend: Vue 3 (Vite + TypeScript)
- State Management: Pinia
- Architecture: Agentic Skill-based

## Instructions for Gemini
1. All UI components go into `src/components/`.
2. All core logic must be placed into `.agents/skills/[skill-name]/scripts/`.
3. Read the `wiki/` and `.agents/` directories before modifying features to ensure you use existing skills.

## Structure Guide
- `AGENTS.md`: Unified Repo Instructions (Gemini's System Prompt)
- `.agents/`: Shared skills directory (compatible with both)
- `wiki/`: LLM-generated knowledge
- `raw/`: Immutable source documents
- `.codex/`: Tool-specific configs
