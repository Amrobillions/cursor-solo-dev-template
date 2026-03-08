@echo off
setlocal
echo ========================================
echo  [PROJECT_NAME] -- SETUP
echo ========================================
echo.

REM ---- PYTHON SETUP ----
REM echo [1/4] Checking Python...
REM python --version || (echo ERROR: Python not found && pause && exit /b 1)

REM echo [2/4] Creating virtual environment...
REM python -m venv .venv

REM echo [3/4] Activating and installing deps...
REM call .venv\Scripts\activate.bat
REM pip install -r requirements.txt

REM ---- NODE SETUP ----
REM echo [1/3] Checking Node...
REM node --version || (echo ERROR: Node not found && pause && exit /b 1)

REM echo [2/3] Installing packages...
REM npm install

REM ---- ENV SETUP ----
REM echo [3/3] Creating .env from template...
REM if not exist .env (copy .env.example .env && echo .env created) else (echo .env already exists)

echo.
echo ========================================
echo  Setup complete!
echo  Next: run.bat to start the project
echo ========================================
pause
