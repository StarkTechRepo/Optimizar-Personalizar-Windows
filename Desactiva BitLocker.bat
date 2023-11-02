@echo off
chcp 65001 > nul
color 30
title https://github.com/StarkTechRepo

rem Desactiva BitLocker en la unidad C:
powershell.exe -Command "manage-bde -off C:"

rem Muestra el estado de BitLocker en la unidad C:
powershell.exe -Command "manage-bde -status C:"

pause