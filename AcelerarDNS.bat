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

REM Configurar el servidor DNS primario como Google DNS
Netsh interface ipv4 add dnsserver "Ethernet" address=8.8.8.8 index=1

REM Configurar el servidor DNS secundario como Google DNS
Netsh interface ipv4 add dnsserver "Ethernet" address=8.8.4.4 index=2

REM Configurar el servidor DNS IPv6 primario como Google DNS
Netsh interface ipv6 add dnsserver "Ethernet" address=2001:4860:4860::8888 index=1

REM Configurar el servidor DNS IPv6 secundario como Google DNS
Netsh interface ipv6 add dnsserver "Ethernet" address=2001:4860:4860::8844 index=2

echo Configuración de DNS completada.
exit
