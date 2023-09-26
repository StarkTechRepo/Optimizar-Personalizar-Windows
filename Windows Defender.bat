@echo off
chcp 65001 > nul
color 30
title  - https://github.com/OtaconEvil

:: Verificar si se está ejecutando como administrador
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

if "%errorlevel%"=="0" (
    echo Ejecutando con privilegios de administrador...
    timeout /t 2 > nul
) else (
    echo Este script debe ejecutarse como administrador.
    pause
    exit
)

:menu
cls
echo.
echo      -----------------------------------------
echo      ^|     Configuración de Windows Defender     ^|
echo      -----------------------------------------
echo.
echo     [1] Detener Windows Defender
echo     [2] Encender Windows Defender
echo     [3] Bajar consumo en un 50%
echo     [4] Ejecutar solucionador de problemas
echo     [5] Restaurar configuración por defecto
echo     [6] Ayuda
echo     [0] Salir
echo.
echo      -----------------------------------------
echo.
set /p opcion=Seleccione una opción ([1-6], 0 para salir):

if "%opcion%"=="1" (
    call :detener_defender
) else if "%opcion%"=="2" (
    call :encender_defender
) else if "%opcion%"=="3" (
    call :bajar_consumo
) else if "%opcion%"=="4" (
    call :solucionador_defender
) else if "%opcion%"=="5" (
    call :restaurar_configuracion
) else if "%opcion%"=="6" (
    call :ayuda
) else if "%opcion%"=="0" (
    exit
) else (
    echo Opción inválida. Intente nuevamente.
    pause
    goto :menu
)

:detener_defender
echo.
echo ---------------------------------------
echo    Deteniendo Windows Defender
echo ---------------------------------------
powershell.exe -Command Set-MpPreference -DisableRealtimeMonitoring $true
echo.
echo Windows Defender detenido.
timeout /t 3 > nul
goto menu

:encender_defender
echo.
echo ---------------------------------------
echo    Encendiendo Windows Defender
echo ---------------------------------------
powershell.exe -Command Set-MpPreference -DisableRealtimeMonitoring $false
echo.
echo Windows Defender encendido.
timeout /t 3 > nul
goto menu

:bajar_consumo
echo.
echo ----------------------------------------------
echo    Bajando consumo de Windows Defender
echo ----------------------------------------------
powershell.exe -Command Set-MpPreference -ScanAvgCPULoadFactor 50
echo.
echo Consumo de Windows Defender bajado en un 50%.
timeout /t 3 > nul
goto menu

:solucionador_defender
echo.
echo -------------------------------------------------
echo    Ejecutando solucionador de problemas de Windows Defender
echo -------------------------------------------------
msdt.exe -id WindowsDefenderDiagnostic
echo.
echo Solucionador de problemas de Windows Defender ejecutado.
timeout /t 3 > nul
goto menu

:restaurar_configuracion
echo.
echo ------------------------------------------------
echo    Restaurando configuración por defecto de Windows Defender
echo ------------------------------------------------
powershell.exe -Command Set-MpPreference -Default
echo.
echo Configuración por defecto de Windows Defender restaurada.
timeout /t 3 > nul
goto menu

:ayuda
echo.
echo ------------------------------------------------
echo    Ayuda: Configuración de Windows Defender
echo ------------------------------------------------
echo [1] Detener Windows Defender: Detiene Windows Defender en tiempo real.
echo [2] Encender Windows Defender: Activa Windows Defender en tiempo real.
echo [3] Bajar consumo en un 50%: Reduce el consumo de recursos de Windows Defender en un 50%.
echo [4] Ejecutar solucionador de problemas: Inicia el solucionador de problemas de Windows Defender.
echo [5] Restaurar configuración por defecto: Restaura la configuración por defecto de Windows Defender.
echo [6] Ayuda: Muestra este menú de ayuda.
echo [0] Salir: Cierra el programa.
timeout /t 5 > nul
goto menu
