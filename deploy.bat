@echo off
setlocal enabledelayedexpansion

rem ============================================================
rem  Hobby Debt Ledger - one-click deploy
rem  Edits live in public/. This script commits, pushes, deploys.
rem ============================================================

cd /d "%~dp0"

echo.
echo ============================================================
echo   Hobby Debt Ledger - Deploy
echo ============================================================
echo.

rem --- Show what's changed so you know what you're shipping ---
echo Changed files:
git status --short
echo.

rem --- Ask for a commit message (blank = timestamp) ---
set "MSG="
set /p "MSG=Commit message (blank for timestamp): "
if "!MSG!"=="" (
    for /f "tokens=1-3 delims=/- " %%a in ("%date%") do set "D=%%c-%%b-%%a"
    for /f "tokens=1-2 delims=:." %%a in ("%time%") do set "T=%%a:%%b"
    set "MSG=deploy !D! !T!"
)

echo.
echo === git add ===
git add .

echo.
echo === git commit ===
git commit -m "!MSG!"
if errorlevel 1 (
    echo   [info] nothing to commit, continuing
)

echo.
echo === git push ===
git push
if errorlevel 1 (
    echo.
    echo   [warn] git push failed - continuing with deploy anyway
    echo.
)

echo.
echo === firebase deploy ===
call firebase deploy --only hosting
if errorlevel 1 (
    echo.
    echo   [ERROR] firebase deploy failed
    echo.
    pause
    exit /b 1
)

echo.
echo ============================================================
echo   Done.
echo   Main app:    https://hobby-debt-ledger.web.app
echo   Forge admin: https://hobby-debt-ledger.web.app/forge
echo ============================================================
echo.
pause
