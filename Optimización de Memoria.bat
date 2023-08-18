@echo off
chcp 65001 > nul
color 0B
title https://github.com/OtaconEvil
echo.
echo *****************************************************
echo *              Optimización de Memoria              *
echo *****************************************************
echo.
REM Información: Cambiar perfiles de memoria RAM, activar Dual Channel y mejorar el rendimiento

REM Cambiar el perfil de la memoria RAM en la BIOS:
REM IMPORTANTE: Cambiar la configuración de la memoria RAM en la BIOS debe hacerse manualmente durante el arranque de la computadora.
REM La configuración de perfiles XMP (o A-XMP en AMD) puede mejorar el rendimiento, pero su disponibilidad y estabilidad pueden variar según el sistema.

echo.
echo *** Cambiar Perfil de Memoria RAM en la BIOS ***
echo.
echo Para mejorar el rendimiento, puedes cambiar el perfil de memoria RAM en la BIOS.
echo Esto se logra accediendo a la BIOS durante el arranque de la computadora.
echo.
echo Para sistemas Intel con perfiles XMP:
echo - Presiona F2 o Supr durante el arranque para acceder a la BIOS.
echo - Busca la configuración de perfiles XMP y selecciona el perfil recomendado.
echo.
echo Para sistemas AMD con perfiles A-XMP:
echo - Presiona F2 o Supr durante el arranque para acceder a la BIOS.
echo - Busca la configuración de perfiles A-XMP y selecciona el perfil recomendado.
echo.
pause

echo.
echo *** Activar Modo Dual Channel ***
echo.
echo El modo Dual Channel mejora el rendimiento de la memoria RAM al usar dos canales en lugar de uno.
echo Para activar el modo Dual Channel:
echo - Consulta el manual de tu placa base para identificar las ranuras correctas para la instalación de módulos de memoria.
echo - Instala los módulos de memoria RAM en las ranuras correspondientes.
echo - Esto permitirá que los módulos trabajen en paralelo y mejoren la velocidad de acceso a la memoria.
echo.
pause

REM Activar memoria virtual con tamaño mínimo de 4GB y tamaño máximo el doble:
wmic computersystem where name="%COMPUTERNAME%" set AutomaticManagedPagefile=True
wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=4096, MaximumSize=8192
pause

REM script en construccion....

echo.
echo Optimización de memoria completada.
pause > nul
