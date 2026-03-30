@echo off
:: Daniel-AI — One-command setup (Windows)
:: Usage: git clone <repo> && cd ai_daniel && setup.bat

set "CLAUDE_DIR=%USERPROFILE%\.claude"
set "CLAUDE_MD=%CLAUDE_DIR%\CLAUDE.md"
set "SCRIPT_DIR=%~dp0"

if not exist "%CLAUDE_DIR%" mkdir "%CLAUDE_DIR%"

if exist "%CLAUDE_MD%" (
    echo Backing up existing CLAUDE.md to CLAUDE.md.bak
    copy "%CLAUDE_MD%" "%CLAUDE_MD%.bak" >nul
)

copy /Y "%SCRIPT_DIR%CLAUDE.md" "%CLAUDE_MD%" >nul

echo Daniel-AI installed.
echo CLAUDE.md copied to: %CLAUDE_MD%
echo.
echo Open any project. Start Claude. Daniel-AI is active.
