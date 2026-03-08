# VIBE CODING MASTER FRAMEWORK
> Solo Dev · Cursor-First · Ship or Kill
> Last updated: 2026-03-08 | Based on: Cursor docs + Reddit + Medium + Community research

---

## PART 1 — RESEARCH FINDINGS (What the world actually knows)

### CURSOR REAL LIMITS (not marketing)
| Claim | Reality |
|-------|---------|
| 200K token context | Actual: ~70K–120K (internal truncation, silent) |
| .cursorrules works | DEPRECATED → use `.cursor/rules/*.mdc` |
| Cursor follows rules | Ignores them ~1/3 of time (community finding) |
| Reads full .mdc file | Reads top ~30 lines + last ~100 lines of long files |
| Agent mode = autonomous | Still needs your direction and checkpoints |

### CURSOR STRENGTHS (use these)
- Tab autocomplete is the best in market (fastest, most accurate)
- Full codebase context when you @-tag files correctly
- Visual inline diffs — best for reviewing changes
- Agent mode for multi-file tasks
- Plan Mode: reads, doesn't write → use for exploration
- MCP integrations for external tools

### CURSOR WEAKNESSES (defend against these)
- Context degrades in long sessions → start fresh chat often
- Rules are inconsistently applied → repeat critical rules in every prompt
- No persistent memory between sessions → memory files are your only fix
- Over-truncates large files → never reference files >300 lines without @-tagging
- "Forgets" earlier decisions mid-session → checkpoint commits often
- Hallucinations increase after ~60% context fill → use /compact or new chat

### WHAT TOP DEVELOPERS DO (distilled from research)
1. **PLAN before BUILD** — separate planning session before any code
2. **Memory Bank** — `.memory/` folder Cursor reads at session start
3. **One .mdc = one concern** — never mix topics in one rule file
4. **Critical rules on line 1** — not line 50
5. **Commit after every working step** — not at end of day
6. **`@docs/` references** — don't paste context into chat, reference files
7. **alwaysApply: true** only for truly universal rules (stack, naming)
8. **Never ask Cursor 2 things at once** — one task per prompt
9. **STATUS.md** — your session memory, updated every session end
10. **DONE.md frozen at start** — your scope lock, never edited mid-project

---

## PART 2 — THE SOLO DEV LAWS

### THE ONE LINE TEST (before touching Cursor)
> "I'm building **X** (what) for **Y** (who) so they can **Z** (do what)"
> If you can't write this in one sentence → you're not ready to build.

### CORE vs FEATURE (the only test that matters)
> Remove it. Does the app still work?
> **NO** = CORE (build first, never skip)
> **YES** = FEATURE (build after core ships)

### BUILD ORDER (always this sequence, never skip steps)
```
1. Data model      → what data exists?
2. Core logic      → what does it do?
3. Terminal test   → does it actually work?
4. API/interface   → how does it connect?
5. UI              → how does user see it?
6. Features        → only after step 5 is stable
```

### SCRATCH vs FORK DECISION
```
BUILD FROM SCRATCH IF:
  • Nothing close exists (truly unique domain)
  • Existing repos have wrong architecture
  • MVP is <500 lines total
  • Your core logic = your competitive edge

FORK/USE REPO IF:
  • Core logic already exists (auth, CRUD, API clients)
  • You need boilerplate (Next.js, FastAPI, etc.)
  • Saves >1 full day of work
  • It's infrastructure, not your product
```

### GITHUB REPO EXTRACTION PROTOCOL (when you find a good repo)
```
MUST DO before taking anything:
  1. Check stars (>100) + last commit (<6 months)
  2. Read README in 30 sec → does it fit?
  3. Check open issues (many bugs = danger)
  4. Read /src structure — understand what you're copying
  5. Copy ONLY what you need — strip everything else
  6. Log it in SOURCES.md with: repo URL + what you took + why
  7. NEVER copy license-incompatible code into commercial projects
```

### WHEN TO BRAINSTORM vs DOCUMENT
```
BRAINSTORM: before starting, messy ideas, MAX 15 min, nothing committed
DOCUMENT: only after something WORKS, to lock it in
NEVER: document what doesn't exist yet (it will change)
```

### THE END PROBLEM (scope creep = project death for solo devs)
> Before every project write the DONE CARD and freeze it:
```
PROJECT: _______________
DONE WHEN: [max 2 sentences, specific and measurable]
WILL NOT BUILD: [kill list — at least 3 things]
DEADLINE: _______________
MAX FEATURES BEFORE SHIP: ___
```

### PRIORITIZATION METHOD (for tasks)
Use **ICE Score** — simple, fast, solo-friendly:
```
Impact  (1-10): How much does this move the project forward?
Confidence (1-10): How sure am I this will work?
Ease (1-10): How fast/simple to implement?

ICE = (Impact + Confidence + Ease) / 3
Always work highest ICE first.
```

### VERSIONING
```
v0.0.x  broken / experimental
v0.x.0  core works, incomplete
v1.0.0  DONE definition is met → ship it
v1.x.0  post-ship features
v2.0.0  breaking architectural change
```

### TERMINAL vs UI DECISION
```
Use TERMINAL for:
  • Testing logic/data
  • Running scripts and automation
  • Debugging
  • First 80% of every build
  • Anything without a real user

Use UI for:
  • User-facing interaction
  • After terminal version works and is tested
  • When input is complex enough to need forms
  • Demos / sharing with others

New UI per project?
  YES if user-facing product
  NO if internal tool or script
  ALWAYS: keep a /ui-components reference to reuse from
```

---

## PART 3 — CURSOR RULES SYSTEM (how it actually works)

### RULE FILE TYPES
```
alwaysApply: true  → injected into EVERY request (use sparingly, <10 rules)
alwaysApply: false + globs → only activates for matching files
alwaysApply: false + description → cursor decides when relevant
```

### MDC FILE STRUCTURE (required frontmatter)
```yaml
---
description: One sentence — what this rule does and when to apply it
globs: ["src/**/*.ts", "src/**/*.tsx"]
alwaysApply: false
---
# Rule content here (KEEP UNDER 50 lines total)
```

### RULE FILES IN THIS TEMPLATE
```
.cursor/rules/
  00-project.mdc     → alwaysApply:true  — stack, project name, language
  01-code-style.mdc  → alwaysApply:true  — naming, formatting, patterns
  02-memory.mdc      → alwaysApply:true  — how to use .memory/ folder
  03-workflow.mdc    → alwaysApply:false — planning, commits, task flow
  04-repo-rules.mdc  → alwaysApply:false — what to do when using external repos
  05-no-go.mdc       → alwaysApply:true  — absolute prohibitions (SHORT)
```

### THE GOLDEN CURSOR PROMPT (use this to start every session)
```
Before starting:
1. Read STATUS.md — understand where we are
2. Read .memory/00-project.md — remember what this is
3. Read DONE.md — remember what the end looks like
4. Your task today: [SINGLE CLEAR TASK]
5. Do NOT create new files unless I explicitly ask
6. Commit with descriptive message after each working step
```

---

## PART 4 — PROJECT HEALTH MENTAL MODELS

### THE COCKPIT CHECK (before every session)
```
✓ Read STATUS.md — where am I?
✓ Check TASKS.md — what's next?
✓ Check git log --oneline -5 — what did I last do?
✓ State the ONE goal for this session
✓ Set a time limit for this session
```

### THE 7-DAY RULE
> If nobody (including you) has used the project in 7 days after "finishing" it → kill it or pivot.
> A project with no user is a hobby. That's fine — but name it honestly.

### MAX 2 ACTIVE PROJECTS (solo dev law)
> More than 2 = you finish none.
> Keep FEATURES.md as the graveyard for ideas — they live there, not in your head.

### CLEAN CODE SIGNALS (how to know your code is healthy)
```
✓ Any file >300 lines → split it
✓ Any function >30 lines → split it  
✓ Any function doing >1 thing → split it
✓ If you can't explain what a file does in 1 sentence → rename/refactor
✓ No file should surprise you when you open it
```

---

*This framework is a living document. Update it when you discover something that works better.*
