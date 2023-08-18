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
echo *   Verificación y Cambio de Plan de Energía en Windows   *
echo *****************************************************

REM Verificar el plan de energía actual
for /f "tokens=*" %%A in ('powercfg /getactivescheme ^| find "Alto rendimiento"') do (
    set "HighPerformance=%%A"
)

REM Mostrar mensaje y ofrecer cambiar si no tiene activado el plan "Alto Rendimiento"
if defined HighPerformance (
    echo.
    echo ¡Tienes activado el plan de energía "Alto Rendimiento"!
    echo Esto podría optimizar el rendimiento, pero también consumirá más energía.
    echo.
    echo Si prefieres un equilibrio entre rendimiento y eficiencia, considera cambiar al plan de energía "Equilibrado".
) else (
    echo.
    echo No tienes activado el plan de energía "Alto Rendimiento".
    choice /c YN /m "¿Deseas cambiar al plan de energía 'Alto Rendimiento'? (Y/N): "
    if errorlevel 2 (
        goto :skipHighPerformance
    ) else (
        powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
        powercfg /s SCHEME_CURRENT
        echo.
        echo ¡Plan de energía "Alto Rendimiento" activado con éxito!
        echo Esto podría optimizar el rendimiento, pero también consumirá más energía.
    )
)

:skipHighPerformance

REM Preguntar si desea cambiar a "Equilibrado" si tiene activado el plan "Alto Rendimiento"
if defined HighPerformance (
    choice /c YN /m "¿Deseas cambiar al plan de energía 'Equilibrado'? (Y/N): "
    if errorlevel 2 (
        goto :end
    ) else (
        powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e
        powercfg /s SCHEME_CURRENT
        echo.
        echo ¡Plan de energía "Equilibrado" activado con éxito!
    )
)

:end
echo.
pause
