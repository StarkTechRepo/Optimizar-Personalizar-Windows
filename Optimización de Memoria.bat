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
echo  1 - Abrir configuración de aplicaciones de inicio automático
echo  2 - Abrir configuración de aplicaciones en segundo plano
echo  3 - Abrir configuración de accesibilidad
echo  4 - Activar memoria virtual con tamaño mínimo de 4GB y máximo el doble
echo  5 - Diagnóstico de memoria de Windows
echo  6 - Desactivar la compresión de memoria
echo  7 - Activar Modo Dual Channel (explicación)
echo  8 - Activar ReadyBoost en memoria USB (explicación)
echo  9 - Cambiar Perfil de Memoria RAM en la BIOS (explicación)
echo 10 - Salir
echo =============================

set /p opcion=Selecciona una opción:

if "%opcion%"=="1" (
    control appwiz.cpl,,1
    goto menu
)

if "%opcion%"=="2" (
    control appwiz.cpl,,2
    goto menu
)

if "%opcion%"=="3" (
    control.exe access.cpl
    goto menu
)

if "%opcion%"=="4" (
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v PagingFiles /t REG_MULTI_SZ /d "C:\pagefile.sys 4096 8192" /f
    echo Memoria virtual activada con tamaño mínimo de 4GB y máximo el doble.
    pause
    goto menu
)

if "%opcion%"=="5" (
    mdsched.exe
    goto menu
)

if "%opcion%"=="6" (
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverride /t REG_DWORD /d 3 /f
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverrideMask /t REG_DWORD /d 3 /f
    echo Compresión de memoria desactivada.
    pause
    goto menu
)

if "%opcion%"=="7" (
    echo El Modo Dual Channel se activa al instalar módulos de memoria en ranuras de memoria específicas en la placa base. Consulta el manual de la placa base para obtener instrucciones detalladas.
    pause
    goto menu
)

if "%opcion%"=="8" (
    echo ReadyBoost es una función de Windows para usar una memoria USB como caché. Conecta la memoria USB, ve a las propiedades y selecciona la pestaña ReadyBoost. Sigue las instrucciones para configurarla.
    pause
    goto menu
)

if "%opcion%"=="9" (
    echo La configuración del perfil de memoria RAM se realiza en la BIOS de la placa base. Reinicia el ordenador y presiona la tecla adecuada (generalmente Del o F2) para acceder a la BIOS. Busca la configuración de memoria y sigue las instrucciones del manual de la placa base para cambiar el perfil.
    pause
    goto menu
)

if "%opcion%"=="10" (
    exit
)

goto menu
