@echo off
chcp 65001 > nul
color 30
title https://github.com/OtaconEvil

REM Detectar si se ejecuta como administrador
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM Si no se está ejecutando como administrador, reiniciar solicitando privilegios elevados
if '%errorlevel%' NEQ '0' (
    echo Por favor, ejecuta este archivo como administrador.
    pause
    exit /B
)

:menu
cls
echo =============================
echo        Opciones disponibles
echo =============================
echo  1 - Cambiar a plan 'Alto Rendimiento'
echo  2 - Cambiar a plan 'Máximo Rendimiento'
echo  3 - Cambiar a plan 'Equilibrado'
echo  4 - Cambiar a plan 'Ecomizador'
echo  5 - Activar Turbo Boost y añadir entradas de registro
echo  6 - Desactivar hibernación
echo  7 - Abrir opciones de energía
echo  8 - Ver plan actual
echo  9 - Exportar plan actual
echo 10 - Importar plan desde archivo
echo 11 - Eliminar todos los planes excepto el activo
echo 12 - Eliminar un plan específico por ID
echo 13 - Salir
echo =============================

set /p opcion=Selecciona una opción:

if "%opcion%"=="1" (
    powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
    echo Plan cambiado a 'Alto Rendimiento'.
    pause
    goto menu
)

if "%opcion%"=="2" (
    powercfg /setactive 54533251-82be-4824-96c1-47b60b740d00
    echo Plan cambiado a 'Máximo Rendimiento'.
    pause
    goto menu
)

if "%opcion%"=="3" (
    powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e
    echo Plan cambiado a 'Equilibrado'.
    pause
    goto menu
)

if "%opcion%"=="4" (
    powercfg /setactive a1841308-3541-4fab-bc81-f71556f20b4a
    echo Plan cambiado a 'Ecomizador'.
    pause
    goto menu
)

if "%opcion%"=="5" (

    echo Turbo Boost activado y entradas de registro añadidas.
    pause
    goto menu
)

if "%opcion%"=="6" (
    powercfg /h off
    echo Hibernación desactivada.
    pause
    goto menu
)

if "%opcion%"=="7" (
    control powercfg.cpl
    goto menu
)

if "%opcion%"=="8" (
    powercfg /getactivescheme
    pause
    goto menu
)

if "%opcion%"=="9" (
    powercfg /export "%UserProfile%\PlanActual.pow"
    echo Plan actual exportado como 'PlanActual.pow'.
    pause
    goto menu
)

if "%opcion%"=="10" (
    set /p archivo=Introduce la ruta del archivo de plan a importar:
    powercfg /import "%archivo%"
    echo Plan importado desde '%archivo%'.
    pause
    goto menu
)

if "%opcion%"=="11" (
    for /f "tokens=2 delims= " %%a in ('powercfg /list ^| findstr "*"') do (
        if not "%%a"=="%ACTIVE%" (
            powercfg /delete %%a
        )
    )
    echo Todos los planes excepto el activo han sido eliminados.
    pause
    goto menu
)

if "%opcion%"=="12" (
    set /p planid=Introduce el ID del plan a eliminar:
    powercfg /delete %planid%
    echo Plan con ID %planid% ha sido eliminado.
    pause
    goto menu
)

if "%opcion%"=="13" (
    exit
)

goto menu
