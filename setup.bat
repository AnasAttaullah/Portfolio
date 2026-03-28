@echo off
REM Dev Portfolio - Automated Setup Script for Windows
REM Run this AFTER installing Node.js, Hugo, and Go

setlocal enabledelayedexpansion

echo =========================================
echo Dev Portfolio - Setup Script (Windows)
echo =========================================
echo.

REM Check prerequisites
echo Checking prerequisites...

echo Checking Node.js...
where node >nul 2>nul
if errorlevel 1 (
    echo [X] Node.js NOT FOUND
    echo Please install Node.js from https://nodejs.org/
    pause
    exit /b 1
)
node --version

echo Checking npm...
where npm >nul 2>nul
if errorlevel 1 (
    echo [X] npm NOT FOUND
    pause
    exit /b 1
)
npm --version

echo Checking Hugo...
where hugo >nul 2>nul
if errorlevel 1 (
    echo [X] Hugo NOT FOUND
    echo Please install Hugo from https://gohugo.io/installation/
    pause
    exit /b 1
)
hugo version

echo Checking Go...
where go >nul 2>nul
if errorlevel 1 (
    echo [X] Go NOT FOUND
    echo Please install Go from https://golang.org/dl/
    pause
    exit /b 1
)
go version

echo.
echo [OK] All prerequisites found!
echo.

REM Clean up old installation
echo Cleaning up old installations...
if exist node_modules rmdir /s /q node_modules
if exist package-lock.json del package-lock.json
if exist go.sum del go.sum
echo [OK] Cleanup complete
echo.

REM Install dependencies
echo Installing Node.js dependencies...
call npm install
if errorlevel 1 (
    echo [X] npm install failed
    pause
    exit /b 1
)
echo [OK] Dependencies installed
echo.

REM Download Hugo modules
echo Downloading Hugo modules...
call hugo mod clean --all
call hugo mod get -u ./...
call hugo mod tidy
if errorlevel 1 (
    echo [X] Hugo modules download failed
    pause
    exit /b 1
)
echo [OK] Hugo modules downloaded
echo.

REM Verify installation
echo Verifying installation...
call npm run build
if errorlevel 1 (
    echo [X] Build verification failed
    pause
    exit /b 1
)
echo.

echo =========================================
echo [OK] Setup Complete!
echo =========================================
echo.
echo Next steps:
echo 1. Start development: npm run dev
echo 2. Open browser to:   http://localhost:1313
echo.
echo For more info, see SETUP.md
echo.
pause
