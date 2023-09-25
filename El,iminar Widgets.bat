@echo off
chcp 65001 > nul
color 30
title https://github.com/OtaconEvil

echo --- Unpin Widgets from taskbar
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarDa" /t REG_DWORD /d "0" /f

echo --- Uninstall Windows Web Experience Pack (breaks Widgets)
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'MicrosoftWindows.Client.WebExperience' | Remove-AppxPackage"

pause