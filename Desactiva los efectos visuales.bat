@echo off
chcp 65001 > nul
color 30
title https://github.com/StarkTechRepo

rem Desactiva los efectos visuales
reg add "HKCU\Control Panel\Appearance and Personalization\Visual Effects" /v "UseAeroGlass" /t REG_DWORD /d 0

pause