@echo off
chcp 65001 > nul
color 30
title https://github.com/OtaconEvil

REM Detener servicios
sc stop WinRM
sc stop XblAuthManager
sc stop RasMan
sc stop RasAuto
sc stop MapsBroker
sc stop SEMgrSvc
sc stop AdobeARMservice
sc stop Spooler
sc stop WdiSystemHost
sc stop WdiServiceHost
sc stop vmicguestinterface
sc stop ssh-agent
sc stop DoSvc
sc stop XblGameSave
sc stop RemoteRegistry
sc stop WbioSrvc
sc stop BDESVC
sc stop RmSvc
sc stop WFDSConMgrSvc
sc stop vmicshutdown
sc stop DPS
sc stop vmickvpexchange
sc stop vmicheartbeat
sc stop XboxNetApiSvc
sc stop vmictimesync
sc stop TroubleshootingSvc
sc stop vmicrdv
sc stop wisvc
sc stop icssvc
sc stop vmicvmsession
sc stop PhoneSvc
sc stop TermService
sc stop vmicvss
sc stop SCardSvr
sc stop TapiSrv
sc stop RpcLocator
sc stop WalletService
sc stop MixedRealityOpenXRSvc
sc stop XboxGipSvc

REM Desactivar servicios
sc config WinRM start=disabled
REM El servicio de administración remota de Windows (WinRM) ha sido desactivado.
sc config XblAuthManager start=disabled
REM El servicio de autenticación de Xbox Live (XblAuthManager) ha sido desactivado.
sc config RasMan start=disabled
REM El servicio de administración de conexiones de acceso remoto (RasMan) ha sido desactivado.
sc config RasAuto start=disabled
REM El servicio de conexiones automáticas de acceso (RasAuto) ha sido desactivado.
sc config MapsBroker start=disabled
REM El servicio de administración de mapas descargados (MapsBroker) ha sido desactivado.
sc config SEMgrSvc start=disabled
REM El servicio de administración de pagos y NFC/SE (SEMgrSvc) ha sido desactivado.
sc config AdobeARMservice start=disabled
REM El servicio de actualización de Adobe Acrobat (AdobeARMservice) ha sido desactivado.
sc config Spooler start=disabled
REM El servicio de cola de impresión (Spooler) ha sido desactivado.
sc config WdiSystemHost start=disabled
REM El servicio de host de sistema de diagnóstico (WdiSystemHost) ha sido desactivado.
sc config WdiServiceHost start=disabled
REM El servicio de host del servicio de diagnóstico (WdiServiceHost) ha sido desactivado.
sc config vmicguestinterface start=disabled
REM El servicio de interfaz de servicio invitado de Hyper-V (vmicguestinterface) ha sido desactivado.
sc config ssh-agent start=disabled
REM El servicio de agente de autenticación de OpenSSH (ssh-agent) ha sido desactivado.
sc config DoSvc start=disabled
REM El servicio de optimización de distribución (DoSvc) ha sido desactivado.
sc config XblGameSave start=disabled
REM El servicio de partida guardada en Xbox Live (XblGameSave) ha sido desactivado.
sc config RemoteRegistry start=disabled
REM El servicio de registro remoto (RemoteRegistry) ha sido desactivado.
sc config WbioSrvc start=disabled
REM El servicio biométrico de Windows (WbioSrvc) ha sido desactivado.
sc config BDESVC start=disabled
REM El servicio de Cifrado de unidad BitLocker (BDESVC) ha sido desactivado.
sc config RmSvc start=disabled
REM El servicio de administración de radio (RmSvc) ha sido desactivado.
sc config WFDSConMgrSvc start=disabled
REM El servicio de administrador de conexiones con servicios Wi-Fi Direct (WFDSConMgrSvc) ha sido desactivado.
sc config vmicshutdown start=disabled
REM El servicio de cierre de invitado de Hyper-V (vmicshutdown) ha sido desactivado.
sc config DPS start=disabled
REM El servicio de directivas de diagnóstico (DPS) ha sido desactivado.
sc config vmickvpexchange start=disabled
REM El servicio de intercambio de datos de Hyper-V (vmickvpexchange) ha sido desactivado.
sc config vmicheartbeat start=disabled
REM El servicio de latido de Hyper-V (vmicheartbeat) ha sido desactivado.
sc config XboxNetApiSvc start=disabled
REM El servicio de red de Xbox Live (XboxNetApiSvc) ha sido desactivado.
sc config vmictimesync start=disabled
REM El servicio de sincronización de hora de Hyper-V (vmictimesync) ha sido desactivado.
sc config TroubleshootingSvc start=disabled
REM El servicio de solución de problemas recomendado (TroubleshootingSvc) ha sido desactivado.
sc config vmicrdv start=disabled
REM El servicio de virtualización de Escritorio remoto de Hyper-V (vmicrdv) ha sido desactivado.
sc config wisvc start=disabled
REM El servicio de Windows Insider (wisvc) ha sido desactivado.
sc config icssvc start=disabled
REM El servicio de zona con cobertura inalámbrica móvil de Windows (icssvc) ha sido desactivado.
sc config vmicvmsession start=disabled
REM El servicio de PowerShell Direct de Hyper-V (vmicvmsession) ha sido desactivado.
sc config PhoneSvc start=disabled
REM El servicio telefónico (PhoneSvc) ha sido desactivado.
sc config TermService start=disabled
REM El servicio de Servicios de Escritorio remoto (TermService) ha sido desactivado.
sc config vmicvss start=disabled
REM El servicio de solicitante de instantáneas de volumen de Hyper-V (vmicvss) ha sido desactivado.
sc config SCardSvr start=disabled
REM El servicio de tarjeta inteligente (SCardSvr) ha sido desactivado.
sc config TapiSrv start=disabled
REM El servicio de telefonía (TapiSrv) ha sido desactivado.
sc config RpcLocator start=disabled
REM El servicio de ubicador de llamada a procedimiento remoto (RPC) (RpcLocator) ha sido desactivado.
sc config WalletService start=disabled
REM El servicio de almacenamiento de objetos usados por los clientes de la cartera (WalletService) ha sido desactivado.
sc config MixedRealityOpenXRSvc start=disabled
REM El servicio de Windows Mixed Reality OpenXR (MixedRealityOpenXRSvc) ha sido desactivado.
sc config XboxGipSvc start=disabled
REM El servicio de administración de accesorios de Xbox (XboxGipSvc) ha sido desactivado.

echo Servicios detenidos y desactivados con éxito.
pause
