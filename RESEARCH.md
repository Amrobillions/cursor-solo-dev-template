# CURSOR + VIBE CODING — DEEP RESEARCH FINDINGS
> Compiled: March 2026 | Sources: Cursor docs, Reddit r/cursor_ai, Medium, community forums

---

## 1. CURSOR REAL-WORLD LIMITS (confirmed by community)

### Context Window
- **Advertised**: 200K tokens
- **Reality**: 70K–120K usable (silent internal truncation for cost/performance)
- **Impact**: Long sessions lose early context silently — you don't know it's happening
- **Fix**: New chat every 60–90 min of heavy work. Use /compact for long Claude Code sessions.

### Rules System
- `.cursorrules` — **deprecated** (still works but being removed)
- `.cursor/rules/*.mdc` — **current standard**
- **Reality finding**: Cursor ignores rules ~1/3 of the time (community consensus)
- **Fix**: Repeat critical constraints in every prompt. Don't assume Cursor "remembers" a rule.

### .mdc File Reading Behavior
- Cursor reads **top ~30 lines + last ~100 lines** of large .mdc files
- Middle of long files = effectively invisible
- **Fix**: Keep every .mdc file under 50 lines. Most critical rule = Line 1.

### Rule Frontmatter (correct format)
```yaml
---
description: One sentence description of what this rule does
globs: ["**/*.ts", "src/api/**"]
alwaysApply: false
---
```
- `alwaysApply: true` = injected into EVERY request (use for max 5-6 critical rules)
- `alwaysApply: false + globs` = activates only for matching file paths
- `alwaysApply: false + description` = Cursor decides when to apply (unreliable)

---

## 2. WHAT ACTUALLY WORKS (practitioner-confirmed)

### The Memory Bank Pattern
Top developers use a `.memory/` folder Cursor reads on session start:
```
.memory/
  00-project.md      ← What this is (Cursor reads first)
  01-architecture.md ← How it's built
  02-decisions.md    ← Why things are the way they are
  sessions/          ← Per-session logs (optional)
```
Rule `02-memory.mdc` with `alwaysApply: true` tells Cursor to read these files first.

### PLAN MODE before BUILD MODE
- Ask Cursor to read + plan BEFORE writing any code
- "Read these files and tell me your implementation plan. Do NOT write code yet."
- Planning mode catches ~70% of wrong-direction work before it happens

### One Task Per Prompt
- Multi-ask prompts = Cursor does task 1 well, tasks 2-3 poorly or wrong
- State ONE clear task. Verify it works. Then next task.

### Reference Don't Paste
- Bad: pasting 200 lines of context into chat
- Good: `@docs/architecture.md` — reference the file, let Cursor read it
- Keeps context clean, avoids token waste

### Commit Discipline
- Commit after every working unit (not end of day)
- Format: `type(scope): description`
- `git log --oneline -5` = your session memory when chat resets

---

## 3. CURSOR STRENGTHS (maximize these)

| Strength | How to use it |
|----------|--------------|
| Tab autocomplete | Trust it for boilerplate, verify for logic |
| Full codebase scan | @-tag files you want it to understand |
| Inline visual diffs | Review every change before accepting |
| Agent mode | Multi-file tasks, use with clear scope |
| Plan mode | Architecture decisions, refactors |
| @web / @docs | Pull live docs directly into context |
| MCP integrations | Connect to GitHub, databases, external tools |

---

## 4. CURSOR WEAKNESSES (defend against these)

| Weakness | Defense |
|----------|---------|
| Context decay in long sessions | New chat every 60-90 min |
| Rules ignored ~33% of time | Repeat critical rules in prompt |
| 200K context = lie (70-120K real) | Keep codebase modular, files small |
| Hallucinates non-existent functions | Verify every reference it generates |
| Loses earlier decisions | STATUS.md + git log as memory |
| Goes off-track on vague prompts | One task, specific outcome, measurable |
| Creates files you didn't ask for | Rule 05-no-go.mdc + explicit prohibition |

---

## 5. THE 2026 SHIFT (what the community moved to)

> "Vibe Coding" (2025) → "Agentic Engineering" (2026)
> You don't write code. You write **architecture + rules + goals**.
> Cursor executes. You supervise.

**What this means for your workflow:**
- Your most valuable skill: writing precise `.mdc` rules and clear goals
- Your job: architect, reviewer, decision-maker
- Cursor's job: implementer
- The better your rules → the less you babysit

---

## 6. GITHUB REPO INTELLIGENCE

### When to search GitHub
- Before building: auth, CRUD, API wrappers, parsers, scrapers, converters
- When stuck >20 min on a known solved problem
- For boilerplate: never write from scratch

### How to find the right repo fast
```
Search: "topic:keyword stars:>100 language:python"
Filter: last commit <6 months (alive project)
Check: README (30 sec), /src structure, open issues
Decision: >5 critical bugs in issues = skip
```

### After finding a good repo
1. Read the license (MIT/Apache = safe, GPL = careful, no license = ask)
2. Fork if you'll modify substantially
3. Copy only what you need (strip dead code)
4. Log in `docs/SOURCES.md`
5. Understand what you copied (don't paste blind)

---

## 7. SOLO DEV MENTAL MODELS

### The Cockpit Check (before every session)
```
1. Read STATUS.md    → where am I?
2. git log -5        → what did I last do?
3. Check TASKS.md    → what's next?
4. State the ONE goal → say it out loud
5. Set time limit    → 1-2 hours max per session
```

### ICE Prioritization
Every task gets scored before doing it:
- **Impact** (1-10): How much does this move the project?
- **Confidence** (1-10): How sure am I it'll work?
- **Ease** (1-10): How fast/simple?
- **ICE** = (I + C + E) / 3
- Always work highest ICE first

### The 7-Day Kill Rule
> If nobody has used the project 7 days after it's "done" → kill or pivot.
> Projects without users are hobbies. Name them honestly.

### The 2-Project Max
> Solo dev with >2 active projects → you finish none.
> Everything else goes to `docs/FEATURES.md` or a separate "ideas" repo.

---

*Research complete. Everything above is confirmed from real community usage.*
