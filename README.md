# Windows 11 to Windows 10 Style Customizer (User-Level)

A collection of lightweight Batch scripts designed to customize the Windows 11 user interface to resemble the classic Windows 10 style without requiring administrative privileges.

## Features & Highlights

- **No Administrator Privileges Required**: All operations affect `HKCU` (HKEY_CURRENT_USER) registry keys and user-level system settings, making it fully usable on standard accounts.
- **Easy Restoration**: Includes a dedicated script (`defaultconfig_win11.bat`) to revert changes back to default Windows 11 behavior.

---

## Included Files

| Script File | Description |
| :--- | :--- |
| `config_win11.bat` | Applies Windows 10 visual tweaks, system preferences, language options, and optional software installations to Windows 11. |
| `defaultconfig_win11.bat` | Restores standard Windows 11 interface settings, timeout configurations, and default system behavior. |

---

## What `config_win11.bat` Modifies

1. **Appearance & Theme**
   - Enables system-wide **Dark Theme**.
   - Disables window **Transparency Effects**.
   - Optimizes and reduces unnecessary **UI Animations** for improved performance.
2. **Taskbar & Clock**
   - Aligns taskbar icons to the **Left**.
   - Reduces taskbar icon size (`TaskbarSi`).
   - Displays **Seconds in System Clock** (`ShowSecondsInSystemClock`).
   - Hides **Task View**, **Widgets / News & Interests** buttons.
   - Sets Search to **Icon-only** mode.
   - Disables Start menu recommendations and recent files list.
3. **File Explorer & System**
   - Restores the **Classic Windows 10 Right-Click Context Menu**.
   - Configures File Explorer to open to **This PC** instead of Quick Access / Home.
   - Enables visibility of **File Extensions** (`.exe`, `.txt`, `.jpg`, etc.).
   - Enables visibility of **Hidden Files and Folders**.
   - Restores classic **Desktop Icons** (*This PC*, *Recycle Bin*, *User Folder*).
4. **Audio & Power Settings**
   - Mutes master speaker volume to **0%**.
   - Sets system idle sleep timeout to **60 minutes** (1 hour).
5. **Language & Software**
   - Updates keyboard layouts: removes German (`de-DE`) and adds Russian (`ru-RU`).
   - Checks and installs **Brave Browser** via `winget` (if not already installed).

---

## What `defaultconfig_win11.bat` Reverts

1. Restores default Windows 11 **Light Theme** and transparency.
2. Centers taskbar icons and restores standard Taskbar size, Search box, Task View, and Widgets.
3. Hides seconds from the taskbar clock.
4. Reverts to the modern Windows 11 **Context Menu**.
5. Sets File Explorer back to open **Quick Access / Home**.
6. Hides file extensions and hidden system files.
7. Restores default desktop icons layout (Recycle Bin only).
8. Restores UI animations and Start menu recommendations.
9. Resets standby sleep timeout back to **5 minutes**.

---

## Usage Instructions

1. **Apply Tweaks**: Double-click `config_win11.bat`.
   - The script will process registry tweaks, system configurations, and restart Windows Explorer automatically to apply changes.
2. **Restore Defaults**: Double-click `defaultconfig_win11.bat`.
   - File Explorer will restart automatically to restore standard Windows 11 settings.

> **Note**: Some UI changes or language layout updates may require you to sign out and log back in (or restart your PC) to take full effect.