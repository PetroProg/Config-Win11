@echo off
title Windows 11 -> Windows 10 Style (User Level)
color 0A
setlocal EnableExtensions

echo.
echo ==========================================================
echo       WINDOWS 11 -> WINDOWS 10 STYLE (USER LEVEL)
echo ==========================================================
echo.
echo Applying Windows 11 appearance tweaks...
echo.

:: ==========================================================
:: BACKUP CURRENT REGISTRY KEYS
:: ==========================================================

echo [1/15] Creating registry backup...

mkdir "%USERPROFILE%\Desktop\Win11_Backup" >nul 2>&1

reg export "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" ^
"%USERPROFILE%\Desktop\Win11_Backup\Explorer_Advanced.reg" /y >nul 2>&1

reg export "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" ^
"%USERPROFILE%\Desktop\Win11_Backup\Personalize.reg" /y >nul 2>&1

echo [OK] Backup created on Desktop.
echo.

:: ==========================================================
:: DARK THEME
:: ==========================================================

echo [2/15] Enabling Dark Theme...

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" ^
 /v AppsUseLightTheme /t REG_DWORD /d 0 /f >nul

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" ^
 /v SystemUsesLightTheme /t REG_DWORD /d 0 /f >nul

echo [OK] Dark theme enabled.
echo.

:: ==========================================================
:: ALIGN TASKBAR TO THE LEFT
:: ==========================================================

echo [3/15] Moving taskbar icons to the left...

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" ^
 /v TaskbarAl /t REG_DWORD /d 0 /f >nul

echo [OK] Taskbar icons aligned to left.
echo.

:: ==========================================================
:: SMALL TASKBAR ICONS
:: ==========================================================

echo [4/15] Setting small taskbar size...

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" ^
 /v TaskbarSi /t REG_DWORD /d 0 /f >nul

echo [OK] Taskbar icon size reduced.
echo.

:: ==========================================================
:: DISABLE TASK VIEW BUTTON
:: ==========================================================

echo [5/15] Removing Task View button...

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" ^
 /v ShowTaskViewButton /t REG_DWORD /d 0 /f >nul

echo [OK] Task View disabled.
echo.

:: ==========================================================
:: SEARCH BAR CONFIGURATION
:: ==========================================================

echo [6/15] Configuring search icon...

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" ^
 /v SearchboxTaskbarMode /t REG_DWORD /d 1 /f >nul

echo [OK] Search set to icon mode.
echo.

:: ==========================================================
:: WIDGETS / NEWS & INTERESTS
:: ==========================================================

echo [7/15] Disabling Widgets...

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" ^
 /v TaskbarDa /t REG_DWORD /d 0 /f >nul

echo [OK] Widgets disabled.
echo.

:: ==========================================================
:: CHAT / TEAMS ICON
:: ==========================================================

echo [8/15] Disabling Chat / Teams on taskbar...

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" ^
 /v TaskbarMn /t REG_DWORD /d 0 /f >nul

echo [OK] Chat icon disabled.
echo.

:: ==========================================================
:: START MENU RECOMMENDATIONS
:: ==========================================================

echo [9/15] Disabling Start menu recommendations...

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Start" ^
 /v ShowRecentList /t REG_DWORD /d 0 /f >nul 2>&1

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Start" ^
 /v ShowFrequentList /t REG_DWORD /d 0 /f >nul 2>&1

echo [OK] Start menu recommendations configured.
echo.

:: ==========================================================
:: FILE EXPLORER -> THIS PC
:: ==========================================================

echo [10/15] Setting File Explorer default location to "This PC"...

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" ^
 /v LaunchTo /t REG_DWORD /d 1 /f >nul

echo [OK] File Explorer will open "This PC".
echo.

:: ==========================================================
:: SHOW FILE EXTENSIONS
:: ==========================================================

echo [11/15] Showing file extensions...

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" ^
 /v HideFileExt /t REG_DWORD /d 0 /f >nul

echo [OK] File extensions enabled (.exe, .txt, .jpg, etc.).
echo.

:: ==========================================================
:: SHOW HIDDEN FILES
:: ==========================================================

echo [12/15] Enabling hidden files visibility...

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" ^
 /v Hidden /t REG_DWORD /d 1 /f >nul

echo [OK] Hidden files are now visible.
echo.

:: ==========================================================
:: DISABLE TRANSPARENCY EFFECTS
:: ==========================================================

echo [13/15] Disabling transparency effects...

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" ^
 /v EnableTransparency /t REG_DWORD /d 0 /f >nul

echo [OK] Transparency disabled.
echo.

:: ==========================================================
:: RESTORE CLASSIC CONTEXT MENU
:: ==========================================================

echo [14/15] Restoring classic right-click context menu...

reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" ^
 /ve /t REG_SZ /d "" /f >nul

echo [OK] Classic context menu enabled.
echo.

:: ==========================================================
:: DESKTOP ICONS
:: ==========================================================

echo [15/15] Enabling classic desktop icons...

set "ICONS=HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel"

:: This PC
reg add "%ICONS%" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 0 /f >nul

:: Recycle Bin
reg add "%ICONS%" /v "{645FF040-5081-101B-9F08-00AA002F954E}" /t REG_DWORD /d 0 /f >nul

:: User Folder
reg add "%ICONS%" /v "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" /t REG_DWORD /d 0 /f >nul

echo [OK] Desktop icons enabled.
echo.

:: ==========================================================
:: INTERFACE ANIMATION TWEAKS
:: ==========================================================

echo Optimizing UI animations...

reg add "HKCU\Control Panel\Desktop\WindowMetrics" ^
 /v MinAnimate /t REG_SZ /d 0 /f >nul

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" ^
 /v ListviewAlphaSelect /t REG_DWORD /d 0 /f >nul

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" ^
 /v ListviewShadow /t REG_DWORD /d 0 /f >nul

echo [OK] UI animations reduced.
echo.

:: ==========================================================
:: RESTART EXPLORER
:: ==========================================================

echo.
echo ==========================================================
echo Restarting Windows Explorer...
echo ==========================================================
echo.

taskkill /f /im explorer.exe >nul 2>&1

timeout /t 2 /nobreak >nul

start "" explorer.exe

timeout /t 3 /nobreak >nul

echo.
echo ==========================================================
echo                 DONE!
echo ==========================================================
echo.
echo Windows 11 has been customized to Windows 10 style.
echo.
echo Summary of changes:
echo.
echo   [OK] Left-aligned taskbar
echo   [OK] Small taskbar icons
echo   [OK] Disabled Task View
echo   [OK] Disabled Widgets
echo   [OK] Disabled Chat icon
echo   [OK] Search icon mode
echo   [OK] Classic context menu
echo   [OK] Dark mode enabled
echo   [OK] Desktop icons visible
echo   [OK] File extensions shown
echo   [OK] Hidden files shown
echo   [OK] File Explorer opens to "This PC"
echo   [OK] Transparency disabled
echo.
echo Backup location:
echo %USERPROFILE%\Desktop\Win11_Backup
echo.
echo ==========================================================
echo.
echo NOTE:
echo Some changes may require logging out or restarting Windows.
echo.
pause

endlocal