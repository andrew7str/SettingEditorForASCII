@echo off
setlocal enabledelayedexpansion

set "AUTHOR=Mr.exe"
set "GITHUB=github.com/andrew7str"
set "BACKUP_DIR=%~dp0editor_backups"
if not exist "%BACKUP_DIR%" mkdir "%BACKUP_DIR%"

:menu
cls
echo ==========================================================
echo        EDITOR CONFIG MANAGER - By %AUTHOR%
echo        Source: %GITHUB%
echo ==========================================================
set "VS_PATH=%APPDATA%\Code\User\settings.json"
set "AG_PATH=%APPDATA%\Antigravity\User\settings.json"

echo  1. AntiGravity Editor   : !AG_STATUS!
if exist "%AG_PATH%" (echo [TERDETEKSI]) else (echo [TIDAK ADA])
echo  2. VS Code Standard     : 
if exist "%VS_PATH%" (echo [TERDETEKSI]) else (echo [TIDAK ADA])
echo ----------------------------------------------------------
echo  [A] Backup Semua Config ke Project
echo  [B] Terapkan ASCII-Ready Config (Font + CP437)
echo  [X] Keluar
echo ==========================================================
set /p opt="Pilih Menu: "

if /i "%opt%"=="A" (
    if exist "%AG_PATH%" copy /y "%AG_PATH%" "%BACKUP_DIR%\antigravity.json"
    if exist "%VS_PATH%" copy /y "%VS_PATH%" "%BACKUP_DIR%\vscode.json"
    echo ✅ Backup selesai di folder editor_backups
    pause
    goto menu
)
if /i "%opt%"=="B" (
    echo {"editor.fontFamily": "Cascadia Code", "editor.lineHeight": 0, "files.encoding": "cp437"} > "%BACKUP_DIR%\temp.json"
    if exist "%AG_PATH%" copy /y "%BACKUP_DIR%\temp.json" "%AG_PATH%"
    if exist "%VS_PATH%" copy /y "%BACKUP_DIR%\temp.json" "%VS_PATH%"
    echo 🚀 ASCII Config Applied!
    pause
    goto menu
)
if /i "%opt%"=="X" exit
goto menu
