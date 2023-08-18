@echo off
chcp 65001 > nul
color 0B
title https://github.com/OtaconEvil
echo.
echo *********************************************
echo *        Creación de Punto de Restauración     *
echo *********************************************
echo.
echo Configurando... por favor espera.

REM Obtener el nombre de usuario actual
for /f "tokens=*" %%A in ('whoami') do set "UserName=%%A"
set "UserName=%UserName:*\=%"

REM Obtener la fecha y hora actual en el formato deseado (yyyyMMdd_HHmmss)
for /f "delims=" %%B in ('wmic os get LocalDateTime ^| find "."') do set "DateTime=%%B"
set "DateTime=%DateTime:~0,4%%DateTime:~4,2%%DateTime:~6,2%_%DateTime:~8,2%%DateTime:~10,2%%DateTime:~12,2%"

REM Crear el nombre del punto de restauración
set "RestorePointName=RestorePoint_%UserName%_%DateTime%"

REM Habilitar la creación de puntos de restauración
wmic /Namespace:\\root\default Path SystemRestore Call Enable("C:\") > nul

REM Crear un punto de restauración
wmic /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "%RestorePointName%", 100, 7 > nul

echo.
echo Punto de restauración creado: %RestorePointName%
echo.
echo Configuración completada. Puedes cerrar esta ventana.
pause > nul
