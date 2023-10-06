@echo off
chcp 65001 > nul
color 30
title https://github.com/OtaconEvil

echo Configuración Rápida de DNS en curso...

REM Mostrar los interfaces de red disponibles
Netsh Interface Show Interface

REM Establecer el interfaz Ethernet en DHCP y borrar los datos de los servidores DNS
Netsh Interface Ip Set Dns name="Ethernet" source=dhcp

REM Configurar DNS estático
Netsh Interface Ip Set Dns name="Ethernet" source=static addr=none

REM Configurar el servidor DNS primario
Netsh interface ipv4 add dnsserver "Ethernet" address=1.1.1.1 index=1

REM Configurar el servidor DNS secundario
Netsh interface ipv4 add dnsserver "Ethernet" address=199.85.126.10 index=2

REM Configurar el servidor DNS IPv6 primario
Netsh interface ipv6 add dnsserver "Ethernet" address=2606:4700:4700::1111 index=1

REM Configurar el servidor DNS IPv6 secundario
Netsh interface ipv6 add dnsserver "Ethernet" address=2a10:50c0::ad1:ff index=2

echo Configuración de DNS completada.
exit
