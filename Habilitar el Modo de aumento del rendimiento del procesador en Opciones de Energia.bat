@echo off
chcp 65001 > nul
color 30
title https://github.com/StarkTechRepo

rem Habilitar el "Modo de aumento del rendimiento del procesador" en Opciones de Energia
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7" /v "Attributes" /t REG_DWORD /d 2 /f

pause