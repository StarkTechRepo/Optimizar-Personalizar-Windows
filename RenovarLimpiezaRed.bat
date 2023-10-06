@echo off
chcp 65001 > nul
color 30
title https://github.com/OtaconEvil

echo Renovación y Limpieza de Configuración de Red en Progreso...

REM Liberar la dirección IP actual
ipconfig /release

REM Renovar la dirección IP
ipconfig /renew

REM Borrar la tabla ARP
arp -d *

REM Refrescar el caché de nombres NetBIOS
nbtstat -R

REM Renovar y liberar registros de nombres NetBIOS
nbtstat -RR

REM Vaciar y registrar el caché DNS
ipconfig /flushdns
ipconfig /registerdns

echo Configuración de Red actualizada y limpiada exitosamente.
