# CURSOR PROMPT — Generate Full Project Template

> Copy this entire prompt into Cursor Agent mode to scaffold a new project.
> Replace ALL [PLACEHOLDERS] before running.

---

## PROMPT (paste into Cursor)

```
You are scaffolding a new solo developer project. Follow every instruction exactly.

PROJECT INFO:
- Name: [PROJECT_NAME]
- One line: I'm building [WHAT] for [WHO] so they can [DO WHAT]
- Stack: [e.g. Python + FastAPI + PostgreSQL / Next.js + TypeScript / etc.]
- Type: [CLI tool / Web app / API / Script / Bot]

TASK: Create the full project structure below. Do NOT write any logic yet.
Only create folders and files with the correct starter content.

═══════════════════════════════════════════
FOLDER STRUCTURE TO CREATE:
═══════════════════════════════════════════

[PROJECT_NAME]/
├── .cursor/
│   └── rules/
│       ├── 00-project.mdc
│       ├── 01-code-style.mdc
│       ├── 02-memory.mdc
│       ├── 03-workflow.mdc
│       ├── 04-repo-rules.mdc
│       └── 05-no-go.mdc
│
├── .memory/
│   ├── 00-project.md
│   ├── 01-architecture.md
│   ├── 02-decisions.md
│   └── sessions/
│       └── .gitkeep
│
├── docs/
│   ├── DONE.md
│   ├── FEATURES.md
│   └── SOURCES.md
│
├── src/
│   ├── core/
│   │   └── .gitkeep
│   ├── api/
│   │   └── .gitkeep
│   ├── ui/
│   │   └── .gitkeep
│   └── utils/
│       └── .gitkeep
│
├── tests/
│   └── .gitkeep
│
├── scripts/
│   ├── setup.bat
│   ├── run.bat
│   ├── test.bat
│   └── clean.bat
│
├── logs/
│   └── .gitkeep
│
├── STATUS.md
├── TASKS.md
├── CHANGELOG.md
├── VERSION
├── README.md
└── .gitignore

═══════════════════════════════════════════
FILE CONTENTS TO GENERATE:
═══════════════════════════════════════════

--- FILE: .cursor/rules/00-project.mdc ---
---
description: Core project identity. Always read this first.
alwaysApply: true
---
# Project: [PROJECT_NAME]
## What it does
[ONE LINE DESCRIPTION]
## Stack
[TECH STACK]
## Language rules
- [Primary language] only
- File naming: snake_case for Python, camelCase for JS/TS
- Always use typed parameters
## Critical paths
- Core logic: src/core/
- Entry point: src/main.[ext]
- Tests: tests/

--- FILE: .cursor/rules/01-code-style.mdc ---
---
description: Code style and naming conventions
alwaysApply: true
---
# Code Style
## Rules (NEVER violate)
- Functions do ONE thing only
- No file exceeds 300 lines → split it
- No function exceeds 30 lines → split it  
- Meaningful names only (no x, tmp, foo)
- Error handling on every external call
- Comment WHY not WHAT
## Forbidden
- Any hardcoded credentials
- print/console.log in production code
- TODO comments (use TASKS.md instead)

--- FILE: .cursor/rules/02-memory.mdc ---
---
description: Memory system — read .memory/ files before every task
alwaysApply: true
---
# Memory Protocol
## On session start: READ THESE IN ORDER
1. STATUS.md (current state)
2. .memory/00-project.md (what this is)
3. .memory/01-architecture.md (how it's built)
## Before any significant change: CHECK
- .memory/02-decisions.md (why things are the way they are)
## After completing a task: UPDATE
- STATUS.md (3 lines: NOW / NEXT / BLOCKED)
- .memory/02-decisions.md (if architectural decision was made)
## Session log (when asked):
- Create .memory/sessions/YYYY-MM-DD-[title].md

--- FILE: .cursor/rules/03-workflow.mdc ---
---
description: Task workflow and commit discipline
alwaysApply: false
globs: []
---
# Workflow Rules
## Before writing any code
1. State the single task in one sentence
2. Check if it touches CORE or FEATURE
3. If CORE: do it now. If FEATURE: add to TASKS.md first
## Commit rules
- Commit after every working unit
- Format: type(scope): description
- Types: feat / fix / refactor / docs / chore
## Task updates
- Mark TASKS.md when done: [x] with date
- Add unexpected findings to .memory/02-decisions.md

--- FILE: .cursor/rules/04-repo-rules.mdc ---
---
description: Rules for using external repos and libraries
alwaysApply: false
---
# External Repo Protocol
## Before taking code from any external source
1. Check license compatibility
2. Document in docs/SOURCES.md: URL + what + why
3. Strip to minimum — no dead code
4. Run tests after integrating
## Search GitHub when
- Building auth, CRUD, API clients, parsers (don't reinvent)
- Saving >1 day of work
## NEVER copy
- Untested code into core logic
- Code you don't understand
- Anything with no license info

--- FILE: .cursor/rules/05-no-go.mdc ---
---
description: Absolute prohibitions. Never do these.
alwaysApply: true
---
# NEVER DO
- Create new files without being asked
- Delete files without confirmation  
- Change architecture without approval
- Add dependencies without asking
- Mix multiple tasks in one session
- Modify DONE.md (it is frozen)
- Skip updating STATUS.md after completion

--- FILE: .memory/00-project.md ---
# [PROJECT_NAME]
## The One Line
I'm building [WHAT] for [WHO] so they can [DO WHAT].
## Status
Version: 0.0.1
Phase: CORE BUILD
Started: [DATE]
## Stack
[TECH STACK]
## Entry Points
[Fill when first file is created]
## Key Dependencies
[Fill as added]

--- FILE: .memory/01-architecture.md ---
# Architecture
## Overview
[Fill after first design decision]
## Data Flow
[Fill after core logic exists]
## Key Files
[Fill as project grows]
## Why this structure
[Fill as decisions are made]

--- FILE: .memory/02-decisions.md ---
# Architectural Decisions
## Format: [DATE] — [Decision] — [Why]

[DATE] — Project initialized — Starting fresh, no existing repo fits

--- FILE: docs/DONE.md ---
# DONE — v1.0 Definition (FROZEN — DO NOT EDIT AFTER FIRST COMMIT)

## This project is DONE when:
[Write 1-2 specific, measurable sentences. e.g. "A user can log in, create 3 types of items, and export to CSV."]

## Will NOT be in v1.0 (Kill List):
- [ ] [Feature you are cutting]
- [ ] [Feature you are cutting]
- [ ] [Feature you are cutting]

## Deadline:
[DATE or "none set"]

--- FILE: docs/FEATURES.md ---
# Features Backlog
> Ideas live here. NOT in your head. NOT in code comments.
> ICE Score: Impact(1-10) + Confidence(1-10) + Ease(1-10) / 3

| # | Feature | ICE Score | Notes | Status |
|---|---------|-----------|-------|--------|
| 1 | example feature | 7.0 | add later | BACKLOG |

## Graveyard (killed features — keep for reference)
| Feature | Why killed | Date |
|---------|-----------|------|

--- FILE: docs/SOURCES.md ---
# External Sources Log
> Every repo, library, or code snippet taken from outside must be logged here.

| Date | Source URL | What was taken | Why | License |
|------|-----------|----------------|-----|---------|
| [DATE] | — | — | — | — |

--- FILE: STATUS.md ---
# Project Status

NOW: Project initialized. Setting up core structure.
NEXT: Define data model in src/core/
BLOCKED: Nothing

Last updated: [DATE]

--- FILE: TASKS.md ---
# Tasks

## Active Sprint
| # | Task | ICE | Created | Done |
|---|------|-----|---------|------|
| 1 | Define data model | - | [DATE] | [ ] |
| 2 | Build core logic | - | [DATE] | [ ] |
| 3 | Terminal test | - | [DATE] | [ ] |

## Done
| # | Task | Completed |
|---|------|-----------|

## Blocked
| # | Task | Blocker |
|---|------|---------|

--- FILE: CHANGELOG.md ---
# Changelog
> Format: ## [VERSION] — YYYY-MM-DD

## [0.0.1] — [DATE]
### Added
- Project initialized
- Template structure created

--- FILE: VERSION ---
0.0.1

--- FILE: scripts/setup.bat ---
@echo off
echo ========================================
echo  [PROJECT_NAME] — SETUP
echo ========================================
echo.

REM Install dependencies
echo [1/3] Installing dependencies...
REM pip install -r requirements.txt
REM npm install

echo [2/3] Creating .env from template...
REM copy .env.example .env

echo [3/3] Running initial tests...
REM python -m pytest tests/ -v

echo.
echo Setup complete. Run: run.bat
pause

--- FILE: scripts/run.bat ---
@echo off
echo ========================================
echo  [PROJECT_NAME] — RUNNING
echo ========================================
echo.
REM python src/main.py
REM npm run dev
pause

--- FILE: scripts/test.bat ---
@echo off
echo ========================================
echo  [PROJECT_NAME] — TESTS
echo ========================================
echo.
REM python -m pytest tests/ -v --tb=short
REM npm test
pause

--- FILE: scripts/clean.bat ---
@echo off
echo ========================================
echo  [PROJECT_NAME] — CLEAN
echo ========================================
echo Removing: __pycache__, .pyc, logs, node_modules?
echo.
for /d /r . %%d in (__pycache__) do @if exist "%%d" rd /s /q "%%d"
del /s /q *.pyc 2>nul
del /s /q logs\*.log 2>nul
echo Clean done.
pause

--- FILE: README.md ---
# [PROJECT_NAME]

> [ONE LINE DESCRIPTION]

## What it does
[2-3 sentences]

## Quick start
\`\`\`bash
scripts/setup.bat
scripts/run.bat
\`\`\`

## Project structure
\`\`\`
src/core/    → business logic
src/api/     → data in/out
src/ui/      → user interface
src/utils/   → helpers
tests/       → tests
docs/        → documentation
.memory/     → AI context files (read by Cursor)
scripts/     → .bat automation
\`\`\`

## Status
See STATUS.md

## Version
See VERSION file + CHANGELOG.md

--- FILE: .gitignore ---
# Python
__pycache__/
*.py[cod]
*.egg-info/
.venv/
venv/
.env

# Node
node_modules/
.next/
dist/
.env.local

# Logs
logs/*.log
*.log

# OS
.DS_Store
Thumbs.db

# Secrets
*.key
*.pem
secrets/
.env

# Cursor personal rules
.cursor/rules/personal.mdc

═══════════════════════════════════════════
AFTER CREATING ALL FILES:
═══════════════════════════════════════════
1. Run: git init && git add . && git commit -m "chore: project template initialized"
2. Update STATUS.md with today's date
3. Update .memory/00-project.md with actual project details
4. Fill in docs/DONE.md — the DONE definition (do this NOW, not later)
5. Tell me: "Template ready. What's the first core task?"
```
