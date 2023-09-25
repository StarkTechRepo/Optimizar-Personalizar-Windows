@echo off
chcp 65001 > nul
color 30
title https://github.com/OtaconEvil

echo --- Remove Meet Now icon from taskbar
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "HideSCAMeetNow" /t REG_DWORD /d 1 /f

pause
