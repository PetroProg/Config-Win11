# Windows 11 to Windows 10 Style Customizer (User-Level)

A collection of lightweight Batch scripts designed to customize the Windows 11 user interface to resemble the classic Windows 10 style without requiring administrative privileges.

## Features & Highlights

- **No Administrator Privileges Required**: All operations affect `HKCU` (HKEY_CURRENT_USER) registry keys only, making it fully usable on corporate or restricted PCs.
- **Safety First**: Automatically creates a registry backup on your Desktop before applying changes.
- **Easy Restoration**: Includes a dedicated script to revert all changes back to default Windows 11 behavior.

---

## Included Files

| Script File | Description |
| :--- | :--- |
| `config_win11.bat` | Applies Windows 10 visual tweaks to Windows 11. |
| `defaultconfig_win11.bat` | Restores standard Windows 11 interface settings. |

---

## What `desktop_tweaks.bat` Modifies

1. **Appearance & Theme**
   - Enables system-wide **Dark Theme**.
   - Disables window **Transparency Effects**.
   - Reduces unnecessary **UI Animations** for improved performance.
2. **Taskbar & Start Menu**
   - Aligns taskbar icons to the **Left**.
   - Reduces taskbar icon size (`TaskbarSi`).
   - Hides **Task View**, **Widgets**, and **Chat / Teams** buttons.
   - Sets Search to **Icon-only** mode.
   - Disables Start menu recommendations and recent files list.
3. **File Explorer & System**
   - Restores the **Classic Windows 10 Right-Click Context Menu**.
   - Configures File Explorer to open to **This PC** instead of Quick Access.
   - Enables visibility of **File Extensions** (`.exe`, `.txt`, `.jpg`, etc.).
   - Enables visibility of **Hidden Files and Folders**.
   - Restores classic **Desktop Icons** (*This PC*, *Recycle Bin*, *User Folder*).

---

## What `restore_defaults.bat` Reverts

1. Restores the default Windows 11 **Light Theme** and transparency.
2. Centers taskbar icons and restores standard Search bar / Task View / Widgets.
3. Reverts to the modern Windows 11 **Context Menu**.
4. Sets File Explorer back to open **Quick Access / Home**.
5. Hides file extensions and hidden system files.
6. Restores default desktop icons layout (Recycle Bin only).

---

## Usage Instructions

1. **Apply Tweaks**: Double-click `config_win11.bat`.
   - A backup folder named `Win11_Backup` will automatically be created on your Desktop (`%USERPROFILE%\Desktop\Win11_Backup`).
   - File Explorer will restart automatically to apply the new settings.
2. **Restore Defaults**: Double-click `defaultconfig_win11.bat`.
   - File Explorer will restart automatically to restore standard settings.

> **Note**: Some UI changes may require you to sign out and log back in (or restart your PC) to take full effect.
