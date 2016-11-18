@echo off

rem [mrpe]
rem check = WSUS "C:\Program Files (x86)\check_mk\mrpe\wsus.bat"
powershell.exe -ExecutionPolicy Unrestricted -file "C:\Program Files (x86)\check_mk\mrpe\wsus.ps1"
