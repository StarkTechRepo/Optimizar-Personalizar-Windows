@echo off
chcp 65001 > nul
color 0B
title https://github.com/OtaconEvil

REM Detectar si se ejecuta como administrador
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM Si no se está ejecutando como administrador, reiniciar solicitando privilegios elevados
if '%errorlevel%' NEQ '0' (
    echo Por favor, ejecuta este archivo como administrador.
    pause
    exit /B
)

echo *****************************************************
echo *         Cambio de Plan de Energía en Windows       *
echo *****************************************************

REM Verificar el plan de energía actual
for /f "tokens=*" %%A in ('powercfg /getactivescheme ^| find "Alto rendimiento"') do (
    set "HighPerformance=%%A"
)
for /f "tokens=*" %%A in ('powercfg /getactivescheme ^| find "Máximo rendimiento"') do (
    set "MaxPerformance=%%A"
)

REM Mostrar opciones y permitir selección
echo.
echo Opciones disponibles:
echo  A - Cambiar a plan 'Alto Rendimiento'
echo  M - Cambiar a plan 'Máximo Rendimiento'
echo  E - Cambiar a plan 'Equilibrado'
echo  S - Salir (sin realizar cambios)

choice /c AMES /m "Selecciona una opción: "

if errorlevel 4 goto :end
if errorlevel 3 (
    powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e
    echo.
    echo ¡Plan de energía "Equilibrado" activado con éxito!
    goto :apply
) else if errorlevel 2 (
    powercfg /setactive 54533251-82be-4824-96c1-47b60b740d00
    echo.
    echo ¡Plan de energía "Máximo Rendimiento" activado con éxito!
    goto :apply
) else if errorlevel 1 (
    powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
    echo.
    echo ¡Plan de energía "Alto Rendimiento" activado con éxito!
    goto :apply
)

:apply
REM Aplicar cambios en el plan de energía
powercfg /s SCHEME_CURRENT

:end
echo.
pause
