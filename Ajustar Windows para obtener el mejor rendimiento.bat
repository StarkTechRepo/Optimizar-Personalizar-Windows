@echo off
chcp 65001 > nul
color 30
title https://github.com/OtaconEvil

echo Ajustando Windows para obtener el mejor rendimiento...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 3 /f
echo Los efectos visuales se han configurado para obtener el mejor rendimiento. Reinicia tu computadora para aplicar los cambios.
pause
