@echo off
setlocal
cd /d "%~dp0"
where node >nul 2>nul
if errorlevel 1 (
  echo Node.js was not found. Install Node.js 20+ from https://nodejs.org/ and reopen this file.
  pause
  exit /b 1
)
if not exist .env (
  copy .env.example .env >nul
  echo Created .env from the example.
  echo IMPORTANT: Open .env and change ADMIN_PASSWORD and SESSION_SECRET before using CivicEye.
  notepad .env
)
if not exist node_modules (
  echo Installing CivicEye dependencies. This requires an internet connection...
  call npm install
  if errorlevel 1 (echo Installation failed. Check the error above.& pause & exit /b 1)
)
call npm start
pause
