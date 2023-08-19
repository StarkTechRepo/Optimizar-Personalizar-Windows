@echo off
chcp 65001 > nul
color 30
title https://github.com/OtaconEvil
REM -----------------------------------------------
REM         Desactivación de Telemetría 
REM -----------------------------------------------

REM Deteniendo y deshabilitando servicios...
REM Detener y deshabilitar el servicio de seguimiento del usuario
sc stop DiagTrack
sc config DiagTrack start= disabled

REM Detener y deshabilitar el servicio de envío de mensajes de inserción del protocolo de aplicación inalámbrica
sc stop dmwappushservice
sc config dmwappushservice start= disabled

REM Detener y deshabilitar el servicio de enrutamiento de mensajes de inserción del protocolo de aplicación inalámbrica
sc stop WMPNetworkSvc
sc config WMPNetworkSvc start= disabled

REM Deshabilitando tareas programadas...
REM Deshabilitar la tarea de Microsoft Compatibility Appraiser
schtasks /change /disable /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser"

REM Deshabilitar la tarea StartupAppTask
schtasks /change /disable /tn "\Microsoft\Windows\Application Experience\StartupAppTask"

REM Deshabilitar la tarea AITAgent (ProgramDataUpdater)
schtasks /change /disable /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater"

REM Deshabilitar la tarea de Customer Experience Improvement Program
schtasks /change /disable /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator"
schtasks /change /disable /tn "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask"
schtasks /change /disable /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip"

REM Deshabilitar tareas relacionadas con diagnóstico y recolección de datos
schtasks /change /disable /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector"
schtasks /change /disable /tn "\Microsoft\Windows\Maintenance\WinSAT"
schtasks /change /disable /tn "\Microsoft\Windows\NetTrace\GatherNetworkInfo"
schtasks /change /disable /tn "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem"

REM Deshabilitar tareas relacionadas con Microsoft Edge
schtasks /change /disable /tn "\Microsoft\Windows\Shell\FamilySafetyMonitor"
schtasks /change /disable /tn "\Microsoft\Windows\Shell\FamilySafetyRefresh"
schtasks /change /disable /tn "\Microsoft\Windows\Shell\FamilySafetyUpload"

REM Deshabilitar la tarea de Windows Error Reporting
schtasks /change /disable /tn "\Microsoft\Windows\Windows Error Reporting\QueueReporting"

REM Configuración del Registro para desactivar la telemetría
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f

REM -----------------------------------------------
REM   Configuración modificada. Reinicia el equipo
REM   para que los cambios surtan efecto.
REM -----------------------------------------------
echo Configuración modificada. Reinicia el equipo para que los cambios surtan efecto.
pause
