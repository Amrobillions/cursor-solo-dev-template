# [PROJECT_NAME]

**Template:** Copy this folder, fill in the placeholders (README, memory/00-project.md, docs/DONE.md), then run `scripts/setup.bat` and start building.

> [ONE LINE — I'm building X for Y so they can Z]

---

## What it does
[2-3 sentences. Plain language. No jargon.]

## Quick start
```bash
scripts/setup.bat    # install dependencies
scripts/run.bat      # run the project
scripts/test.bat     # run tests
scripts/clean.bat    # clean cache/logs
```

## Project structure
```
src/core/     → business logic (the brain)
src/api/      → data in/out (the pipes)
src/ui/       → user interface (the face)
src/utils/    → shared helpers (the tools)
tests/        → tests
docs/         → documentation
memory/       → AI context files (Cursor reads these)
.cursor/rules/→ Cursor rule files (.mdc) — edit here so Cursor sees them
scripts/      → .bat automation
```

## Key files
| File | Purpose |
|------|---------|
| STATUS.md | Where the project is RIGHT NOW |
| TASKS.md | What's being built + ICE priority |
| docs/DONE.md | What v1.0 looks like (frozen) |
| CHANGELOG.md | What changed and when |
| VERSION | Current version |

## Version
See `VERSION` file. Full history in `CHANGELOG.md`.

## Status
See `STATUS.md`.
