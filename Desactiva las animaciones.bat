@echo off
chcp 65001 > nul
color 30
title https://github.com/StarkTechRepo

rem Desactiva las animaciones
reg add "HKCU\Control Panel\Desktop" /v "AnimateWindows" /t REG_DWORD /d 0
reg add "HKCU\Control Panel\Desktop" /v "UseDesktopComposition" /t REG_DWORD /d 0

pause