#!/bin/bash

# Metadata
AUTHOR="Mr.exe"
GITHUB="github.com/andrew7str"
PROJECT_DIR=$(pwd)
BACKUP_DIR="$PROJECT_DIR/editor_backups"

# Path Editors
PATH_VSCODE="$HOME/.config/Code/User/settings.json"
PATH_ANTIGRAVITY="$HOME/.config/Antigravity/User/settings.json"
PATH_SUBLIME="$HOME/.config/sublime-text/Packages/User/Preferences.sublime-settings"

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
    echo -n " 3. Sublime Text         : " && check_install "$PATH_SUBLIME"
    echo "----------------------------------------------------------"
    echo " A. Backup Semua Config ke Folder Project"
    echo " B. Restore/Terapkan ASCII-Ready Config"
    echo " X. Keluar"
    echo "=========================================================="
    read -p "Pilih Menu: " opt

    case ${opt^^} in
        A)
            [ -f "$PATH_ANTIGRAVITY" ] && cp "$PATH_ANTIGRAVITY" "$BACKUP_DIR/antigravity.json" && echo "✅ AntiGravity Backed up"
            [ -f "$PATH_VSCODE" ] && cp "$PATH_VSCODE" "$BACKUP_DIR/vscode.json" && echo "✅ VSCode Backed up"
            sleep 2 ;;
        B)
            echo '{"editor.fontFamily": "Cascadia Code, Courier New", "editor.lineHeight": 0, "files.encoding": "cp437"}' > "$BACKUP_DIR/ascii_fix.json"
            [ -f "$PATH_ANTIGRAVITY" ] && cp "$BACKUP_DIR/ascii_fix.json" "$PATH_ANTIGRAVITY" && echo "🚀 AntiGravity Optimized!"
            [ -f "$PATH_VSCODE" ] && cp "$BACKUP_DIR/ascii_fix.json" "$PATH_VSCODE" && echo "🚀 VSCode Optimized!"
            sleep 2 ;;
        X) exit ;;
    esac
done
