@echo off
chcp 65001 > nul
color 30
title https://github.com/OtaconEvil

echo Limpieza de archivos y carpetas temporales en progreso...

rem Eliminar archivos en la carpeta de descargas de Windows Update
DEL /q /s "C:\Windows\SoftwareDistribution\Download\*"

rem Eliminar todas las subcarpetas en la carpeta de descargas de Windows Update
FOR /d %%x in ("C:\Windows\SoftwareDistribution\Download\*") do @rd /s /q "%%x"

rem Eliminar archivos temporales en varias ubicaciones
DEL /s /f /q "%WinDir%\Temp\*.*"
DEL /s /f /q "%Temp%\*.*"
DEL /s /f /q "%AppData%\Temp\*.*"
DEL /s /f /q "%SYSTEMDRIVE%\AMD\*.*"
DEL /s /f /q "%SYSTEMDRIVE%\NVIDIA\*.*"
DEL /s /f /q "%SYSTEMDRIVE%\INTEL\*.*"

rem Eliminar carpetas temporales vacías
RD /s /q "%WinDir%\Temp"
RD /s /q "%Temp%"
RD /s /q "%AppData%\Temp"
RD /s /q "%SYSTEMDRIVE%\AMD"
RD /s /q "%SYSTEMDRIVE%\NVIDIA"
RD /s /q "%SYSTEMDRIVE%\INTEL"

rem Crear las carpetas temporales nuevamente
MD "%WinDir%\Temp"
MD "%Temp%"
MD "%AppData%\Temp"

rem Limpiar la Papelera de reciclaje
DEL /a /s /q "%systemdrive%\recycled\*.*" >nul

echo Limpieza completada.
