@echo off
chcp 65001 > nul
color 30
title https://github.com/StarkTechRepo

rem Desactiva los procesos de inicio
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "PreventStartup" /t REG_DWORD /d 1

pause