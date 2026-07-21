@echo off
REM Plant Disease Detection System - Startup Script
REM Just double-click this file to start the app!

echo ========================================
echo   Plant Disease Detection System
echo   Starting Application...
echo ========================================
echo.

set ROOT_DIR=%~dp0
set BACKEND_DIR=%ROOT_DIR%backend
set VENV_PYTHON=%ROOT_DIR%.venv\Scripts\python.exe

REM Check if venv exists
if not exist "%VENV_PYTHON%" (
    echo ERROR: Virtual environment not found!
    echo Please run: python -m venv .venv
    echo Then run: .venv\Scripts\pip.exe install -r backend\requirements.txt
    pause
    exit /b 1
)

REM Check if backend exists
if not exist "%BACKEND_DIR%\main.py" (
    echo ERROR: backend\main.py not found!
    pause
    exit /b 1
)

echo Checking for existing server on port 8000...
for /f "tokens=5" %%a in ('netstat -aon ^| find ":8000" ^| find "LISTENING"') do (
    echo Found existing server. Stopping it...
    taskkill /F /PID %%a >nul 2>&1
    timeout /t 2 /nobreak >nul
)

echo.
echo Starting Backend Server...
echo Server will be available at: http://localhost:8000
echo.
echo Press Ctrl+C to stop the server
echo.

REM Open browser after 3 seconds
start /B timeout /t 3 /nobreak >nul && start http://localhost:8000

REM Start the server using the venv Python directly
cd /d "%BACKEND_DIR%"
"%VENV_PYTHON%" main.py

cd /d "%ROOT_DIR%"
pause
