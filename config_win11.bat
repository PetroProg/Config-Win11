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

if exist "%ProgramFiles%\BraveSoftware\Brave-Browser\Application\brave.exe" (
    echo [OK] Brave is already installed.
) else if exist "%ProgramFiles(x86)%\BraveSoftware\Brave-Browser\Application\brave.exe" (
    echo [OK] Brave is already installed.
) else if exist "%LocalAppData%\BraveSoftware\Brave-Browser\Application\brave.exe" (
    echo [OK] Brave is already installed.
) else (
    where winget >nul 2>&1
    if not errorlevel 1 (
        echo Installing Brave Browser via winget (User Scope), please wait...
        winget install --id Brave.Brave -e --source winget --scope user --silent --accept-package-agreements --accept-source-agreements
        if not errorlevel 1 (
            echo [OK] Brave Browser installed.
        ) else (
            echo [WARNING] Brave installation failed. Install manually from https://brave.com
        )
    ) else (
        echo [WARNING] winget not found. Cannot auto-install Brave.
        echo Please install manually from https://brave.com
    )
)
echo.

:: ==========================================================
:: INSTALL ANTIGRAVITY (USER SCOPE)
:: ==========================================================

echo Checking Antigravity...

if exist "%ProgramFiles%\Antigravity\Antigravity.exe" (
    echo [OK] Antigravity is already installed.
) else if exist "%ProgramFiles(x86)%\Antigravity\Antigravity.exe" (
    echo [OK] Antigravity is already installed.
) else if exist "%LocalAppData%\Programs\Antigravity\Antigravity.exe" (
    echo [OK] Antigravity is already installed.
) else (
    where winget >nul 2>&1
    if not errorlevel 1 (
        echo Installing Antigravity via winget (User Scope), please wait...
        winget install --id Google.Antigravity -e --source winget --scope user --silent --accept-package-agreements --accept-source-agreements
        if not errorlevel 1 (
            echo [OK] Antigravity installed successfully.
        ) else (
            echo [WARNING] Antigravity installation failed. Check package ID or install manually.
        )
    ) else (
        echo [WARNING] winget not found. Cannot auto-install Antigravity.
    )
)
echo.

:: ==========================================================
:: INSTALL VISUAL STUDIO CODE (USER SCOPE)
:: ==========================================================

echo Checking Visual Studio Code...

where code >nul 2>&1
if not errorlevel 1 (
    echo [OK] Visual Studio Code is already installed and in PATH.
) else if exist "%LocalAppData%\Programs\Microsoft VS Code\Code.exe" (
    echo [OK] Visual Studio Code is already installed.
) else (
    where winget >nul 2>&1
    if not errorlevel 1 (
        echo Installing Visual Studio Code via winget (User Scope), please wait...
        winget install --id Microsoft.VisualStudioCode -e --source winget --scope user --silent --accept-package-agreements --accept-source-agreements
        if not errorlevel 1 (
            echo [OK] Visual Studio Code installed successfully.
        ) else (
            echo [WARNING] VS Code installation failed. Install manually from https://code.visualstudio.com
        )
    ) else (
        echo [WARNING] winget not found. Cannot auto-install VS Code.
    )
)
echo.

:: ==========================================================
:: INSTALL GIT BASH (USER SCOPE)
:: ==========================================================

echo Checking Git Bash...

where git >nul 2>&1
if not errorlevel 1 (
    echo [OK] Git is already installed and in PATH.
) else if exist "%LocalAppData%\Programs\Git\cmd\git.exe" (
    echo [OK] Git is already installed.
) else (
    where winget >nul 2>&1
    if not errorlevel 1 (
        echo Installing Git Bash via winget (User Scope), please wait...
        winget install --id Git.Git -e --source winget --scope user --silent --accept-package-agreements --accept-source-agreements
        if not errorlevel 1 (
            echo [OK] Git Bash installed successfully.
        ) else (
            echo [WARNING] Git Bash installation failed. Install manually from https://git-scm.com
        )
    ) else (
        echo [WARNING] winget not found. Cannot auto-install Git Bash.
    )
)
echo.

:: ==========================================================
:: CONFIGURE GIT DEFAULT EDITOR
:: ==========================================================

echo Configuring Git default editor...

powershell -NoProfile -Command ^
 "if (Get-Command git -ErrorAction SilentlyContinue) { git config --global core.editor 'code --wait' }" >nul 2>&1

echo [OK] Git default editor checked.
echo.

:: ==========================================================
:: DEVELOPER CONTEXT MENUS (USER LEVEL)
:: ==========================================================

echo Registering developer context menus (Open with Code, Git Bash Here)...

:: Locate VS Code executable path
set "VSCODE_EXE="
if exist "%LocalAppData%\Programs\Microsoft VS Code\Code.exe" (
    set "VSCODE_EXE=%LocalAppData%\Programs\Microsoft VS Code\Code.exe"
) else (
    for /f "delims=" %%i in ('where code.cmd 2^>nul') do (
        if exist "%%~dpi..\Code.exe" set "VSCODE_EXE=%%~dpi..\Code.exe"
    )
)

if defined VSCODE_EXE (
    :: Right-click on file
    reg add "HKCU\Software\Classes\*\shell\VSCode" /ve /t REG_SZ /d "Open with Code" /f >nul
    reg add "HKCU\Software\Classes\*\shell\VSCode" /v "Icon" /t REG_SZ /d "\"%VSCODE_EXE%\"" /f >nul
    reg add "HKCU\Software\Classes\*\shell\VSCode\command" /ve /t REG_SZ /d "\"%VSCODE_EXE%\" \"%%1\"" /f >nul

    :: Right-click on directory
    reg add "HKCU\Software\Classes\Directory\shell\VSCode" /ve /t REG_SZ /d "Open with Code" /f >nul
    reg add "HKCU\Software\Classes\Directory\shell\VSCode" /v "Icon" /t REG_SZ /d "\"%VSCODE_EXE%\"" /f >nul
    reg add "HKCU\Software\Classes\Directory\shell\VSCode\command" /ve /t REG_SZ /d "\"%VSCODE_EXE%\" \"%%V\"" /f >nul

    :: Right-click on directory background
    reg add "HKCU\Software\Classes\Directory\Background\shell\VSCode" /ve /t REG_SZ /d "Open with Code" /f >nul
    reg add "HKCU\Software\Classes\Directory\Background\shell\VSCode" /v "Icon" /t REG_SZ /d "\"%VSCODE_EXE%\"" /f >nul
    reg add "HKCU\Software\Classes\Directory\Background\shell\VSCode\command" /ve /t REG_SZ /d "\"%VSCODE_EXE%\" \"%%V\"" /f >nul
)

:: Locate Git Bash executable path
set "GIT_BASH_EXE="
if exist "%LocalAppData%\Programs\Git\git-bash.exe" (
    set "GIT_BASH_EXE=%LocalAppData%\Programs\Git\git-bash.exe"
) else if exist "%ProgramFiles%\Git\git-bash.exe" (
    set "GIT_BASH_EXE=%ProgramFiles%\Git\git-bash.exe"
) else if exist "%ProgramFiles(x86)%\Git\git-bash.exe" (
    set "GIT_BASH_EXE=%ProgramFiles(x86)%\Git\git-bash.exe"
)

if defined GIT_BASH_EXE (
    :: Right-click on directory
    reg add "HKCU\Software\Classes\Directory\shell\git_shell" /ve /t REG_SZ /d "Git Bash Here" /f >nul
    reg add "HKCU\Software\Classes\Directory\shell\git_shell" /v "Icon" /t REG_SZ /d "\"%GIT_BASH_EXE%\"" /f >nul
    reg add "HKCU\Software\Classes\Directory\shell\git_shell\command" /ve /t REG_SZ /d "\"%GIT_BASH_EXE%\" \"--cd=%%1\"" /f >nul

    :: Right-click on directory background
    reg add "HKCU\Software\Classes\Directory\Background\shell\git_shell" /ve /t REG_SZ /d "Git Bash Here" /f >nul
    reg add "HKCU\Software\Classes\Directory\Background\shell\git_shell" /v "Icon" /t REG_SZ /d "\"%GIT_BASH_EXE%\"" /f >nul
    reg add "HKCU\Software\Classes\Directory\Background\shell\git_shell\command" /ve /t REG_SZ /d "\"%GIT_BASH_EXE%\" \"--cd=%%V\"" /f >nul
)

echo [OK] Developer context menus registered.
echo.

:: ==========================================================
:: REMOVE ONEDRIVE SYSTEM TRAY ICON
:: ==========================================================

echo Hiding OneDrive icon from system tray...

:: Prevent OneDrive from autostarting with Windows
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "OneDrive" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "OneDriveSetup" /f >nul 2>&1

:: Kill running OneDrive process
taskkill /f /im OneDrive.exe >nul 2>&1

echo [OK] OneDrive autostart disabled and icon removed.
echo.

:: ==========================================================
:: UNPIN MICROSOFT STORE & PIN BRAVE TO TASKBAR
:: ==========================================================

echo Managing Taskbar pinned icons...

powershell -NoProfile -Command ^
 "$path = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband'; " ^
 "if (Test-Path $path) { " ^
 "  $bytes = Get-ItemPropertyValue -Path $path -Name 'Favorites' -ErrorAction SilentlyContinue; " ^
 "}" >nul 2>&1

:: Delete pinned Taskbar shortcuts via shell XML/Registry profile
powershell -NoProfile -Command ^
 "$TaskbandPath = '$env:APPDATA\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar'; " ^
 "Get-ChildItem -Path $TaskbandPath -Filter '*Microsoft Store*' -ErrorAction SilentlyContinue | Remove-Item -Force; " ^
 "$BravePath = 'C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe'; " ^
 "if (-not (Test-Path $BravePath)) { $BravePath = 'C:\Program Files (x86)\BraveSoftware\Brave-Browser\Application\brave.exe' }; " ^
 "if (-not (Test-Path $BravePath)) { $BravePath = \"$env:LOCALAPPDATA\BraveSoftware\Brave-Browser\Application\brave.exe\" }; " ^
 "if (Test-Path $BravePath) { " ^
 "  $wsh = New-Object -ComObject WScript.Shell; " ^
 "  $sc = $wsh.CreateShortcut(\"$TaskbandPath\Brave.lnk\"); " ^
 "  $sc.TargetPath = $BravePath; " ^
 "  $sc.Save(); " ^
 "}" >nul 2>&1

echo [OK] Taskbar pins updated.
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
echo   [OK] Small taskbar icons (where supported)
echo   [OK] Disabled Task View
echo   [OK] Disabled Widgets and News feed
echo   [OK] Search icon mode
echo   [OK] Classic context menu
echo   [OK] Dark mode enabled
echo   [OK] Desktop icons visible
echo   [OK] File extensions shown
echo   [OK] Hidden files shown
echo   [OK] File Explorer compact mode enabled
echo   [OK] Full path in File Explorer title bar
echo   [OK] File Explorer opens to "This PC"
echo   [OK] Transparency disabled
echo   [OK] Bing search and app suggestions disabled
echo   [OK] Sticky Keys shortcut disabled
echo   [OK] PowerShell ExecutionPolicy set to RemoteSigned (CurrentUser)
echo   [OK] Brave Browser checked/installed (User Scope)
echo   [OK] Antigravity checked/installed (User Scope)
echo   [OK] Visual Studio Code checked/installed (User Scope)
echo   [OK] Git Bash checked/installed (User Scope)
echo   [OK] Developer context menus registered ("Open with Code", "Git Bash Here")
echo.
echo ==========================================================
echo.
echo NOTE:
echo Some changes may require logging out or restarting Windows.
echo If the News feed icon still appears, right-click the taskbar,
echo choose "Widgets" settings, or restart the PC once to fully apply.
echo.
pause

endlocal