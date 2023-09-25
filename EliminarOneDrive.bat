@echo off
chcp 65001 > nul
color 30
title https://github.com/OtaconEvil

echo --- Kill OneDrive process
tasklist /fi "ImageName eq OneDrive.exe" /fo csv 2>NUL | find /i "OneDrive.exe">NUL && (
    echo OneDrive.exe is running and will be killed.
    taskkill /f /im OneDrive.exe
) || (
    echo Skipping, OneDrive.exe is not running.
)

echo --- Remove OneDrive from startup
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "OneDrive" /f 2>nul

echo --- Uninstall OneDrive
if exist "%SystemRoot%\System32\OneDriveSetup.exe" (
    "%SystemRoot%\System32\OneDriveSetup.exe" /uninstall
) else (
    if exist "%SystemRoot%\SysWOW64\OneDriveSetup.exe" (
        "%SystemRoot%\SysWOW64\OneDriveSetup.exe" /uninstall
    ) else (
        echo Failed to uninstall, uninstaller could not be found. 1>&2
    )
)

echo --- Remove OneDrive files
:: OneDrive root folder
if exist "%UserProfile%\OneDrive" (
    rd "%UserProfile%\OneDrive" /q /s
)
:: OneDrive installation directory
if exist "%LocalAppData%\Microsoft\OneDrive" (
    rd "%LocalAppData%\Microsoft\OneDrive" /q /s
)
:: OneDrive data
if exist "%ProgramData%\Microsoft OneDrive" (
    rd "%ProgramData%\Microsoft OneDrive" /q /s
)
:: OneDrive cache
if exist "%SystemDrive%\OneDriveTemp" (
    rd "%SystemDrive%\OneDriveTemp" /q /s
)

echo --- Delete OneDrive shortcuts
if exist "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Microsoft OneDrive.lnk" (
    del "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Microsoft OneDrive.lnk" /s /f /q
)
if exist "%APPDATA%\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk" (
    del "%APPDATA%\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk" /s /f /q
)
if exist "%USERPROFILE%\Links\OneDrive.lnk" (
    del "%USERPROFILE%\Links\OneDrive.lnk" /s /f /q
)
if exist "%SystemDrive%\Windows\ServiceProfiles\LocalService\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk" (
    del "%SystemDrive%\Windows\ServiceProfiles\LocalService\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk" /s /f /q
)
if exist "%SystemDrive%\Windows\ServiceProfiles\NetworkService\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk" (
    del "%SystemDrive%\Windows\ServiceProfiles\NetworkService\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk" /s /f /q
)
PowerShell -ExecutionPolicy Unrestricted -Command "Set-Location "^""HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace"^""; Get-ChildItem | ForEach-Object {Get-ItemProperty $_.pspath} | ForEach-Object {; $leftnavNodeName = $_."^""(default)"^"";; if (($leftnavNodeName -eq "^""OneDrive"^"") -Or ($leftnavNodeName -eq "^""OneDrive - Personal"^"")) {; if (Test-Path $_.pspath) {; Write-Host "^""Deleting $($_.pspath)."^""; Remove-Item $_.pspath;; }; }; }"

echo --- Block OneDrive usage
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /t REG_DWORD /v "DisableFileSyncNGSC" /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /t REG_DWORD /v "DisableFileSync" /d 1 /f

echo --- Prevent automatic OneDrive installation
PowerShell -ExecutionPolicy Unrestricted -Command "reg delete "^""HKCU\Software\Microsoft\Windows\CurrentVersion\Run"^"" /v "^""OneDriveSetup"^"" /f 2>$null"

echo --- Remove OneDrive folder from File Explorer
reg add "HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /v "System.IsPinnedToNameSpaceTree" /d "0" /t REG_DWORD /f
reg add "HKCR\Wow6432Node\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /v "System.IsPinnedToNameSpaceTree" /d "0" /t REG_DWORD /f

echo --- Disable OneDrive scheduled tasks
PowerShell -ExecutionPolicy Unrestricted -Command "$tasks=$(; Get-ScheduledTask 'OneDrive Reporting Task-*'; Get-ScheduledTask 'OneDrive Standalone Update Task-*'; ); if($tasks.Length -eq 0) {; Write-Host 'Skipping, no OneDrive tasks exists.'; } else {; Write-Host "^""Total found OneDrive tasks: $($tasks.Length)."^""; foreach ($task in $tasks) {; $fullPath = $task.TaskPath + $task.TaskName; Write-Host "^""Deleting `"^""$fullPath`"^"""^""; schtasks /DELETE /TN "^""$fullPath"^"" /f; }; }"

echo --- Delete OneDrive environment variable
reg delete "HKCU\Environment" /v "OneDrive" /f 2>nul

pause