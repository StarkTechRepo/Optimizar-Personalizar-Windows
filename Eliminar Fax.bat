@echo off
chcp 65001 > nul
color 30
title https://github.com/OtaconEvil

echo --- Windows Fax and Scan feature
dism /Online /Disable-Feature /FeatureName:"FaxServicesClientPackage" /NoRestart

echo --- Scan Management feature
dism /Online /Disable-Feature /FeatureName:"ScanManagementConsole" /NoRestart

pause
