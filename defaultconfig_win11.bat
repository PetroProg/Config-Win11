@echo off
chcp 65001 > nul
echo Restoring default Windows 11 settings...

:: 1. Enable light theme (default)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /t REG_DWORD /d 1 /f > nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUsesLightTheme" /t REG_DWORD /d 1 /f > nul

:: 2. Hide desktop icons (keep Recycle Bin only)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 1 /f > nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" /t REG_DWORD /d 1 /f > nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{645FF040-5081-101B-9F08-00AA002F954E}" /t REG_DWORD /d 0 /f > nul

:: 3. Restore Search bar on Taskbar (default search box)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 2 /f > nul

:: 4. Restore Task View button
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t REG_DWORD /d 1 /f > nul

:: 5. Center taskbar icons (Windows 11 default)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAl" /t REG_DWORD /d 1 /f > nul

:: 6. Restore default taskbar icon size
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSi" /t REG_DWORD /d 1 /f > nul

:: 7. Restore default context menu (remove classic Windows 10 style)
reg delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f > nul 2>&1

:: 8. Set File Explorer default location to Home / Quick Access
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d 2 /f > nul

:: 9. Hide file extensions
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d 1 /f > nul

:: 10. Hide hidden files
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d 2 /f > nul

:: 11. Enable transparency effects
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d 1 /f > nul

:: 12. Enable Widgets / News
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarDa" /t REG_DWORD /d 1 /f > nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Feeds" /v "ShellFeedsTaskbarViewMode" /t REG_DWORD /d 0 /f > nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Feeds" /v "EnableFeeds" /t REG_DWORD /d 1 /f > nul 2>&1

:: 13. Enable Start menu recommendations
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Start" /v "ShowRecentList" /t REG_DWORD /d 1 /f > nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Start" /v "ShowFrequentList" /t REG_DWORD /d 1 /f > nul 2>&1

:: 14. Restore UI animations
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d 1 /f > nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewAlphaSelect" /t REG_DWORD /d 1 /f > nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewShadow" /t REG_DWORD /d 1 /f > nul

:: 15. Hide seconds in taskbar clock
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSecondsInSystemClock" /t REG_DWORD /d 0 /f > nul

:: 16. Restore standby timeout to 5 minutes
powercfg /change standby-timeout-ac 5
powercfg /change standby-timeout-dc 5

:: Restart Windows Explorer to apply changes
echo Restarting Windows Explorer...
taskkill /f /im explorer.exe > nul
timeout /t 2 /nobreak > nul
start explorer.exe

echo Done! All settings have been restored to default Windows 11 behavior.
pause