@echo off
echo.
echo ##################################################
echo ##           STEP 1: UPDATING APPS              ##
echo ##################################################
echo.
winget update --all --include-unknown --accept-source-agreements --accept-package-agreements

echo.
echo === Waiting for winget to complete... ===
timeout /t 5 /nobreak

echo.
echo #######################################################################
echo ##           STEP 2: Checking for system file corruption             ##
echo #######################################################################
echo.
sfc /scannow

echo.
echo ##################################################################
echo ##           STEP 3: Checking Windows Image Health              ##
echo ##################################################################
echo.
DISM /Online /Cleanup-Image /ScanHealth
DISM /Online /Cleanup-Image /RestoreHealth

echo.
echo ###############################################################
echo ##           STEP 4: Installing Windows Updates              ##
echo ###############################################################
echo.
powershell.exe -ExecutionPolicy Bypass -File "%~dp0update-windows.ps1"

pause
