@echo off
REM GHGL Development Setup Script for Windows

setlocal enabledelayedexpansion

echo 🚀 Setting up GHGL Flask Application...

REM Check Python version
python --version
if %errorlevel% neq 0 (
    echo ❌ Python not found in PATH
    exit /b 1
)

echo ✓ Python is installed

REM Create virtual environment
if not exist "venv" (
    echo 📦 Creating virtual environment...
    python -m venv venv
)

REM Activate virtual environment
echo 🔧 Activating virtual environment...
call venv\Scripts\activate.bat

REM Upgrade pip
echo 📥 Upgrading pip...
python -m pip install --upgrade pip setuptools wheel

REM Install dependencies
echo 📥 Installing dependencies...
pip install -r requirements.txt

REM Setup environment file
if not exist ".env" (
    echo 📋 Creating .env file from template...
    copy .env.example .env
    echo ⚠️  Please update .env with your configuration
)

REM Install pre-commit hooks
echo 🎣 Installing pre-commit hooks...
pre-commit install

echo.
echo ✅ Setup complete!
echo.
echo Next steps:
echo 1. Activate virtual environment: venv\Scripts\activate.bat
echo 2. Run tests: make test
echo 3. Start development server: make dev
echo 4. Build Docker image: make docker-build

endlocal
