@echo off

if "%1%"=="" goto Usage

cmake -S . -B buildWin
cmake --build buildWin

:Usage
echo "Expected usage: build.bat <BuildType: Debug|Release>"