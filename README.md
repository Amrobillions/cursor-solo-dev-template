# Cursor Solo Dev Template

> I'm just the pilot of this rocket — or F-16, or whatever. Claude is my assistant; Cursor is my execution and ops guy. Done by Cursor, for all Cursors around the globe. Let's go.

A **Cursor-first project template** for solo devs: rules, memory, status, and scope (DONE) so you can ship or kill without scope creep. Use it for every new project.

---

## Use this template

1. Click **Use this template** → **Create a new repository** (or clone and push to your own repo).
2. Fill in the placeholders below and in `memory/00-project.md`, `docs/DONE.md`.
3. Run `scripts/setup.bat` and start building.

Philosophy and research-backed practices: **[FRAMEWORK.md](FRAMEWORK.md)**.

---

## What’s inside

| Part | Purpose |
|------|--------|
| `.cursor/rules/*.mdc` | Cursor rule files (project, code style, memory, workflow, no-go) — Cursor loads these automatically |
| `memory/` | AI context Cursor reads each session (project, architecture, decisions) |
| `STATUS.md` | 3-line session anchor: NOW / NEXT / BLOCKED |
| `docs/DONE.md` | Frozen v1.0 definition + kill list (no scope creep) |
| `TASKS.md` | What you’re building + ICE priority |
| `src/core`, `api`, `ui`, `utils` | Scaffold for brain / pipes / face / tools |
| `scripts/*.bat` | setup, run, test, clean (Windows) |

---

## Who it’s for

- Solo devs using **Cursor** (or similar AI-assisted editors).
- Anyone who wants a **lightweight workflow**: one-line pitch, build order, commit discipline, and a single place for “what’s done” and “what we’re not building.”

---

## Contributing

Improvements and ideas are welcome. See **[CONTRIBUTING.md](CONTRIBUTING.md)**.

---

## License

MIT — see [LICENSE](LICENSE). Use it, fork it, adapt it.

---

# Your project (fill in after “Use this template”)

# [PROJECT_NAME]

> [ONE LINE — I'm building X for Y so they can Z]

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
.cursor/rules/→ Cursor rule files (.mdc)
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
See `VERSION`. Full history in `CHANGELOG.md`.

## Status
See `STATUS.md`.
