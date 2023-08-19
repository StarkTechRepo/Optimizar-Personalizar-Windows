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
:menu
cls
echo.
echo Opciones disponibles:
echo  1 - Cambiar a plan 'Alto Rendimiento'
echo  2 - Cambiar a plan 'Máximo Rendimiento'
echo  3 - Cambiar a plan 'Equilibrado'
echo  4 - Activar Turbo Boost y añadir entradas de registro
echo  5 - Desactivar hibernación
echo  6 - Abrir opciones de energía
echo  7 - Salir

set /p option=Selecciona una opción: 

Aquí tienes el código completo con la opción "Ecomizador" agregada al menú:

batch

@echo off
chcp 65001 > nul
color 0B
title https://github.com/OtaconEvil

REM ... (código existente) ...

:menu
cls
echo.
echo Opciones disponibles:
echo  1 - Cambiar a plan 'Alto Rendimiento'
echo  2 - Cambiar a plan 'Máximo Rendimiento'
echo  3 - Cambiar a plan 'Equilibrado'
echo  4 - Cambiar a plan 'Ecomizador'
echo  5 - Activar Turbo Boost y añadir entradas de registro
echo  6 - Desactivar hibernación
echo  7 - Abrir opciones de energía
echo  8 - Salir

set /p option=Selecciona una opción: 

if "%option%"=="1" goto high_performance
if "%option%"=="2" goto max_performance
if "%option%"=="3" goto balanced
if "%option%"=="4" goto power_saver
if "%option%"=="5" goto turbo_boost_and_register
if "%option%"=="6" goto hibernation
if "%option%"=="7" goto open_power_options
if "%option%"=="8" goto end
goto invalid_option

:high_performance
REM Verificar si el plan 'Alto Rendimiento' ya existe
for /f "tokens=*" %%A in ('powercfg /list ^| find "Alto rendimiento"') do (
    set "HighPerformance=%%A"
)

REM Verificar si el plan actual ya existe
for /f "tokens=*" %%A in ('powercfg /list ^| find "%HighPerformance%"') do (
    set "CurrentPlan=%%A"
)

REM Si el plan actual ya existe, usarlo; de lo contrario, crearlo
if "%CurrentPlan%"=="" (
    powercfg -duplicatescheme %HighPerformance%
    echo.
    echo ¡Plan de energía "%HighPerformance%" activado con éxito!
) else (
    powercfg /setactive %CurrentPlan%
    echo.
    echo ¡Plan de energía "%CurrentPlan%" activado con éxito!
)
goto apply

:max_performance
REM Verificar si el plan 'Máximo Rendimiento' ya existe
for /f "tokens=*" %%A in ('powercfg /list ^| find "Máximo rendimiento"') do (
    set "MaxPerformance=%%A"
)

REM Verificar si el plan actual ya existe
for /f "tokens=*" %%A in ('powercfg /list ^| find "%MaxPerformance%"') do (
    set "CurrentPlan=%%A"
)

REM Si el plan actual ya existe, usarlo; de lo contrario, crearlo
if "%CurrentPlan%"=="" (
    powercfg -duplicatescheme %MaxPerformance%
    echo.
    echo ¡Plan de energía "%MaxPerformance%" activado con éxito!
) else (
    powercfg /setactive %CurrentPlan%
    echo.
    echo ¡Plan de energía "%CurrentPlan%" activado con éxito!
)
goto apply

:balanced
REM Verificar si el plan 'Equilibrado' ya existe
for /f "tokens=*" %%A in ('powercfg /list ^| find "Equilibrado"') do (
    set "Balanced=%%A"
)

REM Verificar si el plan actual ya existe
for /f "tokens=*" %%A in ('powercfg /list ^| find "%Balanced%"') do (
    set "CurrentPlan=%%A"
)

REM Si el plan actual ya existe, usarlo; de lo contrario, crearlo
if "%CurrentPlan%"=="" (
    powercfg -duplicatescheme %Balanced%
    echo.
    echo ¡Plan de energía "%Balanced%" activado con éxito!
) else (
    powercfg /setactive %CurrentPlan%
    echo.
    echo ¡Plan de energía "%CurrentPlan%" activado con éxito!
)
goto apply

:power_saver
REM Verificar si el plan 'Ecomizador' ya existe
for /f "tokens=*" %%A in ('powercfg /list ^| find "Ecomizador"') do (
    set "PowerSaver=%%A"
)

REM Verificar si el plan actual ya existe
for /f "tokens=*" %%A in ('powercfg /list ^| find "%PowerSaver%"') do (
    set "CurrentPlan=%%A"
)

REM Si el plan actual ya existe, usarlo; de lo contrario, crearlo
if "%CurrentPlan%"=="" (
    powercfg -duplicatescheme %PowerSaver%
    echo.
    echo ¡Plan de energía "%PowerSaver%" activado con éxito!
) else (
    powercfg /setactive %CurrentPlan%
    echo.
    echo ¡Plan de energía "%CurrentPlan%" activado con éxito!
)
goto apply

:turbo_boost_and_register
REM Activar Turbo Boost para el plan de energía actual en modo conectado (AC).
powercfg -setacvalueindex SCHEME_CURRENT 54533251-82be-4824-96c1-47b60b740d00 7b5ce29e-0524-4c18-afa0-ebbcc267a05f 0
REM Activar Turbo Boost para el plan de energía actual en modo desconectado (DC).
powercfg -setdcvalueindex SCHEME_CURRENT 54533251-82be-4824-96c1-47b60b740d00 7b5ce29e-0524-4c18-afa0-ebbcc267a05f 0

REM Añadir entradas de registro para permitir la gestión de Turbo Boost.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7b5ce29e-0524-4c18-afa0-ebbcc267a05f" /v Attributes /t REG_DWORD /d 0 /f

echo.
echo ¡Turbo Boost activado y entradas de registro añadidas para gestionar Turbo Boost!
goto apply

:hibernation
REM Desactivar hibernación.
powercfg -h off
echo.
echo ¡Hibernación desactivada!
goto apply

:open_power_options
echo Abriendo las opciones de energía...
start powercfg.cpl
pause
goto menu

:apply
REM Aplicar cambios en el plan de energía
powercfg /s SCHEME_CURRENT
echo.
echo ¡Cambios aplicados con éxito!
pause
goto :menu

:end
echo Hasta luego.
pause
exit

:invalid_option
echo Opción no válida. Por favor, selecciona una opción válida.
goto :menu
