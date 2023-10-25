@echo off
chcp 65001 > nul
color 30
title https://github.com/StarkTechRepo

rem Ajusta la memoria virtual
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolSize" /t REG_DWORD /d 0
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "InitialSize" /t REG_DWORD /d 2048
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "MaximumSize" /t REG_DWORD /d 8192

pause