@echo off

rem -------------------------------------------------------------
rem  Build package for chocolatey.
rem -------------------------------------------------------------

@SetLocal EnableExtensions EnableDelayedExpansion

rem  Get package name.
cd ..\
for %%a in (".") do set CURRENT_DIR_NAME=%%~na
cd ./src

echo ===== Test (install form local source) "%CURRENT_DIR_NAME%" package ====

set "PACKAGE_NANE=hidden.start.nit.main"
set "SRC_DIR=%~dp0"
set "BUILD_DIR=..\build\%PACKAGE_NANE%"

cd %BUILD_DIR%
call cinst -fvy %PACKAGE_NANE% -s %CD% --pre

if not "%1" == "1" (
	pause
)

@endlocal