@echo off
chcp 65001 > nul
color 30
title https://github.com/OtaconEvil

echo --- Windows Media Player feature
dism /Online /Disable-Feature /FeatureName:"WindowsMediaPlayer" /NoRestart

pause
