@echo off
chcp 65001 > nul
color 30
title https://github.com/OtaconEvil

echo --- Internet Printing Client
dism /Online /Disable-Feature /FeatureName:"Printing-Foundation-InternetPrinting-Client" /NoRestart

echo --- LPD Print Service
dism /Online /Disable-Feature /FeatureName:"LPDPrintService" /NoRestart

echo --- LPR Port Monitor feature
dism /Online /Disable-Feature /FeatureName:"Printing-Foundation-LPRPortMonitor" /NoRestart

echo --- Microsoft Print to PDF feature
dism /Online /Disable-Feature /FeatureName:"Printing-PrintToPDFServices-Features" /NoRestart

echo --- XPS Services feature
dism /Online /Disable-Feature /FeatureName:"Printing-XPSServices-Features" /NoRestart

echo --- XPS Viewer feature
dism /Online /Disable-Feature /FeatureName:"Xps-Foundation-Xps-Viewer" /NoRestart

echo --- Print and Document Services feature
dism /Online /Disable-Feature /FeatureName:"Printing-Foundation-Features" /NoRestart

echo --- Work Folders Client feature
dism /Online /Disable-Feature /FeatureName:"WorkFolders-Client" /NoRestart

pause
