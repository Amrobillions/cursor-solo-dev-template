@echo off
setlocal
echo ========================================
echo  [PROJECT_NAME] -- SESSION START
echo  THE COCKPIT CHECK
echo ========================================
echo.

echo --- STATUS ---
type STATUS.md
echo.

echo --- LAST 5 COMMITS ---
git log --oneline -5 2>nul || echo (no git history yet)
echo.

echo --- ACTIVE TASKS ---
findstr /n "[ ]" TASKS.md 2>nul | findstr "Active" >nul
type TASKS.md | findstr "[ ]" 2>nul
echo.

echo ========================================
echo  Before you start: state your ONE goal
echo  for this session out loud.
echo  Then open Cursor and paste the session
echo  start prompt from CURSOR_PROMPT.md
echo ========================================
pause
