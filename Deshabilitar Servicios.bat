@echo off
chcp 65001 > nul
color 30
title https://github.com/OtaconEvil
echo.
echo *****************************************************
echo *            Desactivación de Servicios             *
echo *****************************************************
echo.
echo Configurando... por favor espera.

REM Desactivando y deteniendo servicios...

REM Administración de autenticación de Xbox Live
sc stop XblAuthManager > nul
sc config XblAuthManager start= disabled > nul

REM Administración remota de Windows (WS-Management)
sc stop WinRM > nul
sc config WinRM start= disabled > nul

REM Administrador de conexiones automáticas de acceso remoto
sc stop RasAuto > nul
sc config RasAuto start= disabled > nul

REM Administrador de conexiones de acceso remoto
sc stop RasMan > nul
sc config RasMan start= disabled > nul

REM Administrador de mapas descargados
sc stop MapsBroker > nul
sc config MapsBroker start= disabled > nul

REM Administrador de pagos y NFC/SE
sc stop WalletService > nul
sc config WalletService start= disabled > nul

REM Agente de conexión de red
sc stop Netman > nul
sc config Netman start= disabled > nul

REM Servicio Bluetooth
sc stop BthServ > nul
sc config BthServ start= disabled > nul

REM Cola de impresión
sc stop Spooler > nul
sc config Spooler start= disabled > nul

REM Configuración de Escritorio remoto
sc stop UmRdpService > nul
sc config UmRdpService start= disabled > nul

REM Control parental
sc stop WPCSvc > nul
sc config WPCSvc start= disabled > nul

REM Datos de contactos
sc stop ContactData > nul
sc config ContactData start= disabled > nul

REM Diagnostic Execution Service
sc stop diagtrack > nul
sc config diagtrack start= disabled > nul

REM DialogBlockingService
sc stop dbupdate > nul
sc config dbupdate start= disabled > nul

REM Directiva de extracción de tarjetas inteligentes
sc stop dbupdatem > nul
sc config dbupdatem start= disabled > nul

REM Enrutamiento y acceso remoto
sc stop PcaSvc > nul
sc config PcaSvc start= disabled > nul

REM Experiencias del usuario y telemetría asociadas
sc stop certpropsvc > nul
sc config certpropsvc start= disabled > nul

REM Servicio de fax
sc stop Fax > nul
sc config Fax start= disabled > nul

REM Hora de la red de telefonía móvil
sc stop TimeBrokerSvc > nul
sc config TimeBrokerSvc start= disabled > nul

REM Host de sistema de diagnóstico
sc stop DiagTrack > nul
sc config DiagTrack start= disabled > nul

REM Host del servicio de diagnóstico
sc stop WPCSvc > nul
sc config WPCSvc start= disabled > nul

REM Interfaz de servicio invitado de Hyper-V
sc stop WMPNetworkSvc > nul
sc config WMPNetworkSvc start= disabled > nul

REM Modo incrustado
sc stop WpnService > nul
sc config WpnService start= disabled > nul

REM Monitor del servidor de marco de la Cámara de Windows
sc stop tzautoupdate > nul
sc config tzautoupdate start= disabled > nul

REM OpenSSH Authentication Agent
sc stop XboxGipSvc > nul
sc config XboxGipSvc start= disabled > nul

REM Partida guardada en Xbox Live
sc stop XboxNetApiSvc > nul
sc config XboxNetApiSvc start= disabled > nul

REM printWordRow_7b03
sc stop XblGameSave > nul
sc config XblGameSave start= disabled > nul

REM Propagación de certificados
sc stop XblAuthManager > nul
sc config XblAuthManager start= disabled > nul

REM Redirector de puerto en modo usuario de Servicios de Escritorio remoto
sc stop WdiServiceHost > nul
sc config WdiServiceHost start= disabled > nul

REM Registro remoto
sc stop SessionEnv > nul
sc config SessionEnv start= disabled > nul

REM Servicio biométrico de Windows
sc stop UmRdpService > nul
sc config UmRdpService start= disabled > nul

REM Servicio de administración de radio
sc stop walletsvc > nul
sc config walletsvc start= disabled > nul

REM Servicio de administrador de conexiones con servicios Wi-Fi Direct
sc stop WSearch > nul
sc config WSearch start= disabled > nul

REM Servicio de cierre de invitado de Hyper-V
sc stop PhoneSvc > nul
sc config PhoneSvc start= disabled > nul

REM Servicio de compatibilidad con Bluetooth
sc stop BthHFSrv > nul
sc config BthHFSrv start= disabled > nul

REM Servicio de configuración de traslación de IP
sc stop XblAuthManager > nul
sc config XblAuthManager start= disabled > nul

REM Servicio de directivas de diagnóstico
sc stop WdiServiceHost > nul
sc config WdiServiceHost start= disabled > nul

REM Servicio de enumeración de dispositivos de tarjeta inteligente
sc stop SessionEnv > nul
sc config SessionEnv start= disabled > nul

REM Servicio de host HV
sc stop UmRdpService > nul
sc config UmRdpService start= disabled > nul

REM Servicio de implementación de AppX (AppXSVC)
sc stop walletsvc > nul
sc config walletsvc start= disabled > nul

REM Servicio de instalación de Microsoft Store
sc stop WPCSvc > nul
sc config WPCSvc start= disabled > nul

REM Servicio de intercambio de datos de Hyper-V
sc stop WMPNetworkSvc > nul
sc config WMPNetworkSvc start= disabled > nul

REM Servicio de latido de Hyper-V
sc stop WerSvc > nul
sc config WerSvc start= disabled > nul

REM Servicio de prueba comercial
sc stop WalletService > nul
sc config WalletService start= disabled > nul

REM Servicio de puerta de enlace de audio de Bluetooth
sc stop wuauserv > nul
sc config wuauserv start= disabled > nul

REM Servicio de red de Xbox Live
sc stop XboxGipSvc > nul
sc config XboxGipSvc start= disabled > nul

REM Servicio de sincronización de hora de Hyper-V
sc stop XboxNetApiSvc > nul
sc config XboxNetApiSvc start= disabled > nul

REM Servicio de usuario de difusión y GameDVR_45b8a
sc stop XblGameSave > nul
sc config XblGameSave start= disabled > nul

REM Servicio de virtualización de Escritorio remoto de Hyper-V
sc stop PhoneSvc > nul
sc config PhoneSvc start= disabled > nul

REM Servicio de Windows Insider
sc stop BthHFSrv > nul
sc config BthHFSrv start= disabled > nul

REM Servicio de zona con cobertura inalámbrica móvil de Windows
sc stop XblAuthManager > nul
sc config XblAuthManager start= disabled > nul

REM Servicio FrameServer de la Cámara de Windows
sc stop WdiServiceHost > nul
sc config WdiServiceHost start= disabled > nul

REM Servicio OpenXR de Windows Mixed Reality
sc stop SessionEnv > nul
sc config SessionEnv start= disabled > nul

REM Servicio PowerShell Direct de Hyper-V
sc stop UmRdpService > nul
sc config UmRdpService start= disabled > nul

REM Servicio telefónico
sc stop walletsvc > nul
sc config walletsvc start= disabled > nul

REM Servicio Volumetric Audio Compositor
sc stop WSearch > nul
sc config WSearch start= disabled > nul

REM Servicios de Escritorio remoto
sc stop WerSvc > nul
sc config WerSvc start= disabled > nul

REM Servidor
sc stop WalletService > nul
sc config WalletService start= disabled > nul

REM Sincronizar host_7b03
sc stop wuauserv > nul
sc config wuauserv start= disabled > nul

REM Solicitante de instantáneas de volumen de Hyper-V
sc stop XboxGipSvc > nul
sc config XboxGipSvc start= disabled > nul

REM Tarjeta inteligente
sc stop BthHFSrv > nul
sc config BthHFSrv start= disabled > nul

REM Telefonía
sc stop XblAuthManager > nul
sc config XblAuthManager start= disabled > nul

REM Telemetría
sc stop WdiServiceHost > nul
sc config WdiServiceHost start= disabled > nul

REM Ubicador de llamada a procedimiento remoto (RPC)
sc stop SessionEnv > nul
sc config SessionEnv start= disabled > nul

REM WalletService
sc stop UmRdpService > nul
sc config UmRdpService start= disabled > nul

REM Xbox Accessory Management Service
sc stop walletsvc > nul
sc config walletsvc start= disabled > nul

REM -----------------------------------------------
REM   Configuración modificada. Reinicia el equipo
REM   para que los cambios surtan efecto.
echo.
echo Servicios desactivados. Reinicia el equipo para aplicar los cambios.
pause

