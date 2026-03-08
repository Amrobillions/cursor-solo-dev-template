@echo off
setlocal
echo ========================================
echo  [PROJECT_NAME] -- CLEAN
echo ========================================
echo.
echo Removing: __pycache__, .pyc, logs, dist...
echo.

REM Python cache
for /d /r . %%d in (__pycache__) do (
    if exist "%%d" (
        rd /s /q "%%d"
        echo Removed: %%d
    )
)
del /s /q *.pyc 2>nul
del /s /q *.pyo 2>nul

REM Logs
del /q logs\*.log 2>nul
echo Logs cleared.

REM Node (uncomment if needed)
REM if exist node_modules (rd /s /q node_modules && echo node_modules removed)
REM if exist dist (rd /s /q dist && echo dist removed)

echo.
echo Clean complete.
pause
