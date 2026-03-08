# Source code

- **core/** — business logic (the brain)
- **api/** — data in/out (the pipes)
- **ui/** — user interface (the face)
- **utils/** — shared helpers (the tools)

Add your entry point here: `main.[ext]` (e.g. `main.py`, `main.ts`).

Build order: data model → core logic → terminal test → API → UI → features.
