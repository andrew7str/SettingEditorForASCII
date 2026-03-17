#!/bin/bash

# Metadata
AUTHOR="Mr.exe"
GITHUB="github.com/andrew7str"
PROJECT_DIR=$(pwd)
BACKUP_DIR="$PROJECT_DIR/editor_backups"

# Path Editors
PATH_VSCODE="$HOME/.config/Code/User/settings.json"
PATH_ANTIGRAVITY="$HOME/.config/Antigravity/User/settings.json"

mkdir -p "$BACKUP_DIR"

check_install() {
    if [ -f "$1" ]; then echo -e "\e[32m[TERDETEKSI]\e[0m"; else echo -e "\e[31m[TIDAK ADA]\e[0m"; fi
}

while true; do
    clear
    echo "=========================================================="
    echo "       EDITOR CONFIG MANAGER - By $AUTHOR"
    echo "       Source: $GITHUB"
    echo "=========================================================="
    echo -n " 1. AntiGravity Editor   : " && check_install "$PATH_ANTIGRAVITY"
    echo -n " 2. VS Code Standard     : " && check_install "$PATH_VSCODE"
    echo "----------------------------------------------------------"
    echo " A. Backup Semua Config ke Folder Project"
    echo " B. Terapkan ASCII Config (Windows 1252)"
    echo " X. Keluar"
    echo "=========================================================="
    read -p "Pilih Menu: " opt

    case ${opt^^} in
        A)
            [ -f "$PATH_ANTIGRAVITY" ] && cp "$PATH_ANTIGRAVITY" "$BACKUP_DIR/antigravity.json"
            [ -f "$PATH_VSCODE" ] && cp "$PATH_VSCODE" "$BACKUP_DIR/vscode.json"
            echo "Backup Berhasil!" && sleep 2 ;;
        B)
            # Menggunakan Windows 1252 sesuai permintaan
            CONFIG_DATA='{"editor.fontFamily": "Cascadia Code, Courier New", "editor.lineHeight": 0, "files.encoding": "windows1252", "editor.fontLigatures": false}'
            [ -f "$PATH_ANTIGRAVITY" ] && echo "$CONFIG_DATA" > "$PATH_ANTIGRAVITY"
            [ -f "$PATH_VSCODE" ] && echo "$CONFIG_DATA" > "$PATH_VSCODE"
            echo "Konfigurasi Windows 1252 Diterapkan!" && sleep 2 ;;
        X) exit ;;
    esac
done
