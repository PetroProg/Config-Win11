@echo off
chcp 65001 >nul
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
:: DARK THEME
:: ==========================================================

echo Enabling Dark Theme...

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" ^
 /v AppsUseLightTheme /t REG_DWORD /d 0 /f >nul

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" ^
 /v SystemUsesLightTheme /t REG_DWORD /d 0 /f >nul

echo [OK] Dark theme enabled.
echo.

:: ==========================================================
:: ALIGN TASKBAR TO THE LEFT
:: ==========================================================

echo Moving taskbar icons to the left...

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" ^
 /v TaskbarAl /t REG_DWORD /d 0 /f >nul

echo [OK] Taskbar icons aligned to left.
echo.

:: ==========================================================
:: SMALL TASKBAR ICONS
:: ==========================================================

:: Note: TaskbarSi may have no visual effect in Windows 11 22H2 and newer
:: as Microsoft removed native taskbar resizing without third-party utilities.
echo Setting small taskbar size...

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" ^
 /v TaskbarSi /t REG_DWORD /d 0 /f >nul

echo [OK] Taskbar icon size reduced.
echo.

:: ==========================================================
:: DISABLE TASK VIEW BUTTON
:: ==========================================================

echo Removing Task View button...

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" ^
 /v ShowTaskViewButton /t REG_DWORD /d 0 /f >nul

echo [OK] Task View disabled.
echo.

:: ==========================================================
:: SEARCH BAR CONFIGURATION
:: ==========================================================

echo Configuring search icon...

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" ^
 /v SearchboxTaskbarMode /t REG_DWORD /d 1 /f >nul

echo [OK] Search set to icon mode.
echo.

:: ==========================================================
:: WIDGETS / NEWS & INTERESTS
:: ==========================================================

echo Disabling Widgets and News feed...

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" ^
 /v TaskbarDa /t REG_DWORD /d 0 /f >nul

:: Disable the News and Interests feed itself (0 = disabled, not just hidden)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Feeds" ^
 /v ShellFeedsTaskbarViewMode /t REG_DWORD /d 2 /f >nul 2>&1

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Feeds" ^
 /v EnableFeeds /t REG_DWORD /d 0 /f >nul 2>&1

echo [OK] Widgets and News feed disabled.
echo.

:: ==========================================================
:: START MENU RECOMMENDATIONS
:: ==========================================================

echo Disabling Start menu recommendations...

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Start" ^
 /v ShowRecentList /t REG_DWORD /d 0 /f >nul 2>&1

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Start" ^
 /v ShowFrequentList /t REG_DWORD /d 0 /f >nul 2>&1

echo Start menu recommendations configured.
echo.

:: ==========================================================
:: DISABLE BING SEARCH & WEB SUGGESTIONS IN START MENU
:: ==========================================================

echo Disabling Bing search & web suggestions in Start menu...

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" ^
 /v BingSearchEnabled /t REG_DWORD /d 0 /f >nul

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" ^
 /v CortanaConsent /t REG_DWORD /d 0 /f >nul

reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" ^
 /v DisableSearchBoxSuggestions /t REG_DWORD /d 1 /f >nul 2>&1

:: ==========================================================
:: DISABLE CONSUMER SUGGESTIONS & PROMOTED APPS
:: ==========================================================

echo Disabling consumer suggestions and promoted apps...

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" ^
 /v SilentInstalledAppsEnabled /t REG_DWORD /d 0 /f >nul

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" ^
 /v SystemPaneSuggestionsEnabled /t REG_DWORD /d 0 /f >nul

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" ^
 /v SubscribedContent-338389Enabled /t REG_DWORD /d 0 /f >nul

echo [OK] Start menu search and recommendations sanitized.
echo.

:: ==========================================================
:: FILE EXPLORER -> THIS PC
:: ==========================================================

echo Setting File Explorer default location to "This PC"...

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" ^
 /v LaunchTo /t REG_DWORD /d 1 /f >nul

echo File Explorer will open "This PC".
echo.

:: ==========================================================
:: SHOW FILE EXTENSIONS
:: ==========================================================

echo Showing file extensions...

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" ^
 /v HideFileExt /t REG_DWORD /d 0 /f >nul

echo File extensions enabled (.exe, .txt, .jpg, etc.).
echo.

:: ==========================================================
:: SHOW HIDDEN FILES
:: ==========================================================

echo Enabling hidden files visibility...

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" ^
 /v Hidden /t REG_DWORD /d 1 /f >nul

echo [OK] Hidden files are now visible.
echo.

:: ==========================================================
:: FILE EXPLORER COMPACT MODE
:: ==========================================================

echo Enabling File Explorer compact mode (classic list density)...

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" ^
 /v UseCompactMode /t REG_DWORD /d 1 /f >nul

echo [OK] File Explorer compact mode enabled.
echo.

:: ==========================================================
:: SHOW FULL PATH IN TITLE BAR
:: ==========================================================

echo Enabling full path in File Explorer title bar...

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState" ^
 /v FullPath /t REG_DWORD /d 1 /f >nul

echo [OK] Full path in title bar enabled.
echo.

:: ==========================================================
:: SHOW DRIVE LETTERS FIRST
:: ==========================================================

echo Displaying drive letters before drive names...

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" ^
 /v ShowDriveLettersFirst /t REG_DWORD /d 4 /f >nul

echo [OK] Drive letters display configured.
echo.

:: ==========================================================
:: DISABLE TRANSPARENCY EFFECTS
:: ==========================================================

echo Disabling transparency effects...

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" ^
 /v EnableTransparency /t REG_DWORD /d 0 /f >nul

echo [OK] Transparency disabled.
echo.

:: ==========================================================
:: RESTORE CLASSIC CONTEXT MENU
:: ==========================================================

echo Restoring classic right-click context menu...

reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" ^
 /ve /t REG_SZ /d "" /f >nul

echo [OK] Classic context menu enabled.
echo.

:: ==========================================================
:: DESKTOP ICONS
:: ==========================================================

echo Enabling classic desktop icons...

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
:: KEYBOARD LAYOUTS (PURGE GERMAN & FORCE FR-CH / RU-RU)
:: ==========================================================

echo Updating keyboard layouts...

powershell -NoProfile -Command ^
 "$langs = Get-WinUserLanguageList; " ^
 "$langs = $langs | Where-Object { $_.LanguageTag -notlike 'de*' }; " ^
 "if (-not ($langs | Where-Object { $_.LanguageTag -eq 'ru-RU' })) { $langs.Add('ru-RU') }; " ^
 "Set-WinUserLanguageList -LanguageList $langs -Force; " ^
 "Set-WinDefaultInputMethodOverride -InputTip '040c:0000100c'; " ^
 "Remove-ItemProperty -Path 'HKCU:\Control Panel\International\User Profile' -Name 'de-CH' -ErrorAction SilentlyContinue; " ^
 "Remove-ItemProperty -Path 'HKCU:\Control Panel\International\User Profile' -Name 'de-DE' -ErrorAction SilentlyContinue; " ^
 "Stop-Process -Name 'ctfmon' -Force -ErrorAction SilentlyContinue; " ^
 "Start-Process 'ctfmon.exe'" >nul 2>&1

:: Clean registry preload and forced overrides
reg add "HKCU\Keyboard Layout\Preload" /v "1" /t REG_SZ /d "0000100c" /f >nul
reg add "HKCU\Keyboard Layout\Preload" /v "2" /t REG_SZ /d "00000419" /f >nul
reg delete "HKCU\Keyboard Layout\Preload" /v "3" /f >nul 2>&1
reg delete "HKCU\Keyboard Layout\Preload" /v "4" /f >nul 2>&1

:: Remove phantom German layouts from registry profile
reg delete "HKCU\Control Panel\International\User Profile\de-CH" /f >nul 2>&1
reg delete "HKCU\Control Panel\International\User Profile\de-DE" /f >nul 2>&1

echo [OK] Keyboard layout updated (French and Russian only).
echo.

:: ==========================================================
:: SHOW SECONDS IN TASKBAR CLOCK
:: ==========================================================

echo [16] Enabling seconds in taskbar clock...

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" ^
 /v ShowSecondsInSystemClock /t REG_DWORD /d 1 /f >nul

echo [OK] Taskbar clock seconds enabled.
echo.

:: ==========================================================
:: MUTE MASTER AUDIO VOLUME
:: ==========================================================

echo Setting audio volume to 0...

powershell -NoProfile -Command ^
 "$wScript = New-Object -ComObject WScript.Shell; " ^
 "1..50 | ForEach-Object { $wScript.SendKeys([char]174) }" >nul 2>&1

echo [OK] Master volume muted.
echo.

:: ==========================================================
:: SET SYSTEM SLEEP / TIMEOUT (1 HOUR)
:: ==========================================================

echo Setting system idle timeout to 60 minutes...

powercfg /change standby-timeout-ac 60
powercfg /change standby-timeout-dc 60

echo [OK] System timeout set to 60 minutes.
echo.

:: ==========================================================
:: DISABLE STICKY KEYS SHORTCUT (5x SHIFT)
:: ==========================================================

echo Disabling Sticky Keys keyboard shortcut...

reg add "HKCU\Control Panel\Accessibility\StickyKeys" ^
 /v Flags /t REG_SZ /d "506" /f >nul

echo [OK] Sticky Keys shortcut disabled.
echo.

:: ==========================================================
:: POWERSHELL EXECUTION POLICY (CURRENT USER)
:: ==========================================================

echo Configuring PowerShell ExecutionPolicy for CurrentUser...

powershell -NoProfile -Command ^
 "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force" >nul 2>&1

echo [OK] PowerShell ExecutionPolicy set to RemoteSigned.
echo.

:: ==========================================================
:: INSTALL BRAVE BROWSER (USER SCOPE)
:: ==========================================================

echo Checking Brave Browser...

set "BRAVE_INSTALLED=0"
if exist "%ProgramFiles%\BraveSoftware\Brave-Browser\Application\brave.exe" set "BRAVE_INSTALLED=1"
if exist "%ProgramFiles(x86)%\BraveSoftware\Brave-Browser\Application\brave.exe" set "BRAVE_INSTALLED=1"
if exist "%ProgramW6432%\BraveSoftware\Brave-Browser\Application\brave.exe" set "BRAVE_INSTALLED=1"
if exist "%LocalAppData%\BraveSoftware\Brave-Browser\Application\brave.exe" set "BRAVE_INSTALLED=1"
if exist "%LocalAppData%\Microsoft\WindowsApps\brave.exe" set "BRAVE_INSTALLED=1"
where brave >nul 2>&1 && set "BRAVE_INSTALLED=1"

if "%BRAVE_INSTALLED%"=="1" (
    echo [OK] Brave is already installed.
    goto SkipBrave
)

echo Installing Brave Browser via winget (User Scope), please wait...
winget install --id Brave.Brave -e --source winget --scope user --silent --accept-package-agreements --accept-source-agreements
if not errorlevel 1 (
    echo [OK] Brave Browser installed successfully.
) else (
    echo [WARNING] Brave installation failed. Install manually from https://brave.com
)

:SkipBrave
echo.

:: ==========================================================
:: INSTALL ANTIGRAVITY (USER SCOPE)
:: ==========================================================

echo Checking Antigravity...

set "ANTIGRAVITY_INSTALLED=0"
if exist "%ProgramFiles%\Antigravity\Antigravity.exe" set "ANTIGRAVITY_INSTALLED=1"
if exist "%ProgramFiles(x86)%\Antigravity\Antigravity.exe" set "ANTIGRAVITY_INSTALLED=1"
if exist "%ProgramW6432%\Antigravity\Antigravity.exe" set "ANTIGRAVITY_INSTALLED=1"
if exist "%LocalAppData%\Programs\Antigravity\Antigravity.exe" set "ANTIGRAVITY_INSTALLED=1"
where antigravity >nul 2>&1 && set "ANTIGRAVITY_INSTALLED=1"
where agy >nul 2>&1 && set "ANTIGRAVITY_INSTALLED=1"

if "%ANTIGRAVITY_INSTALLED%"=="1" (
    echo [OK] Antigravity is already installed.
    goto SkipAntigravity
)

echo Installing Antigravity (User Scope), please wait...
where winget >nul 2>&1
if not errorlevel 1 (
    winget install --id Google.Antigravity -e --source winget --scope user --silent --override "/CURRENTUSER /SILENT /NORESTART" --accept-package-agreements --accept-source-agreements
)

if exist "%LocalAppData%\Programs\Antigravity\Antigravity.exe" (
    echo [OK] Antigravity installed successfully.
    goto SkipAntigravity
)

echo Downloading official Antigravity user installer...
powershell -NoProfile -Command ^
 "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; " ^
 "$installer = Join-Path $env:TEMP 'AntigravitySetup.exe'; " ^
 "try { " ^
 "  Invoke-WebRequest -Uri 'https://edgedl.me.gvt1.com/edgedl/release2/j0qc3/antigravity/stable/2.5.5-4923483625488384/windows-x64/Antigravity.exe' -OutFile $installer -UseBasicParsing; " ^
 "  Start-Process -FilePath $installer -ArgumentList '/CURRENTUSER /SILENT /NORESTART' -Wait; " ^
 "} catch { " ^
 "  Write-Host ('Download error: ' + $_.Exception.Message); " ^
 "} finally { " ^
 "  Remove-Item -Path $installer -Force -ErrorAction SilentlyContinue; " ^
 "}"

if exist "%LocalAppData%\Programs\Antigravity\Antigravity.exe" (
    echo [OK] Antigravity installed successfully.
) else (
    echo [WARNING] Antigravity installation failed. Install manually.
)

:SkipAntigravity
echo.

:: ==========================================================
:: RESTART EXPLORER / SHELL TO APPLY CHANGES
:: ==========================================================

echo Restarting Windows Explorer and modern shell...
taskkill /f /im explorer.exe >nul 2>&1
taskkill /f /im StartMenuExperienceHost.exe >nul 2>&1
taskkill /f /im ShellExperienceHost.exe >nul 2>&1

timeout /t 1 /nobreak >nul

tasklist /fi "imagename eq explorer.exe" 2>nul | find /i "explorer.exe" >nul
if errorlevel 1 (
    start "" "%windir%\explorer.exe"
)

timeout /t 2 /nobreak >nul

echo.
echo [DONE] All Windows 10 style tweaks have been applied successfully.
pause