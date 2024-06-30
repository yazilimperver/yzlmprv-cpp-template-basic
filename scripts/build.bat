@echo off

if "%1%"=="" goto Usage

if "%1%"=="Debug" (
    echo "Debug Build Selected"
    cmake --preset debug-msvc
    cmake --build --preset build-debug-msvc
    exit 0
) 

if "%1%"=="Release" (
    echo "Release Build Selected"
    cmake --preset release-msvc
    cmake --build --preset build-release-msvc
    exit 0
) 

:Usage
echo "Expected Usage: build.bat <BuildType: Debug|Release>"