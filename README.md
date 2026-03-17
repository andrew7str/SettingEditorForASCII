# 🛠️ Editor ASCII Optimizer

A specialized utility to manage and optimize text editor configurations for **Extended ASCII (CP437)** and custom command-line displays.

## 👤 Developer Information
- **Developed by:** Mr.exe
- **GitHub:** [andrew7str](https://github.com/andrew7str)
- **Reference:** [ASCII for CMD Guide](https://andrew-exe.blogspot.com/2024/10/ascii-for-cmd.html)

## 📋 Features
- **Auto-Detection:** Detects installed editors (AntiGravity, VS Code).
- **Project-Based Backup:** Saves your configurations directly inside the project folder.
- **One-Click Optimization:** Instantly applies:
  - **Line Height:** Optimized to prevent gaps in vertical bars (`║`).
 
## 📋 Optimization Specs
Tool ini secara otomatis mengatur editor kamu agar:
- **Encoding:** `Windows 1252` (Western) - Sesuai standar blog Andrew-exe.
- **Font:** `Cascadia Code` (Monospaced).
- **Line Height:** `0` (Rapat sempurna).
- **Ligatures:** `Disabled` (Mencegah penggabungan karakter).

## 🚀 How to Use
### Linux
1. Place `setup_editor.sh` in your project folder.
2. Run `chmod +x setup_editor.sh`.
3. Execute `./setup_editor.sh`.

### Windows
1. Place `setup_editor.bat` in your project folder.
2. Double-click the file to run.

## 📖 ASCII Table Reference
The custom display uses the Extended ASCII table (Codes 128-255). For a full list of characters used in this project, visit:
👉 [Andrew-exe ASCII for CMD](https://andrew-exe.blogspot.com/2024/10/ascii-for-cmd.html)

---
*Maintained with ❤️ by Mr.exe*
