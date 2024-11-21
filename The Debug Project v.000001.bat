@echo off
color 0E
echo Checking for Updates...
set "local_version=000001"

set "remote_version_url=https://raw.githubusercontent.com/HaWai12/updater/refs/heads/updatenotifying/remote_version.txt"

set "temp_remote_version_file=temp_remote_version.txt"

curl -s -o "%temp_remote_version_file%" "%remote_version_url%"

if not exist "%temp_remote_version_file%" (
    echo Please Check your internet connection
    pause
    exit /b
)

for /f "delims=" %%A in (%temp_remote_version_file%) do set "remote_version=%%A"

if "%local_version%" NEQ "%remote_version%" (
    cls
    color 01
    echo New Update availible
    echo Lokal  Version: %local_version%
    echo New    Version: %remote_version%
    echo       Please update !!!
    start msedge https://github.com/HaWai12/updater/tree/Thedebugproject
    start chrome.exe https://github.com/HaWai12/updater/tree/Thedebugproject
    pause 
    exit 
) else (
    cls
    echo No new Updates
)
del "%temp_remote_version_file%"
setlocal enableextensions enabledelayedexpansion

timeout /t 3  /nobreak >nul
cls
color 03
echo                             Disclaimer
echo _______________________________________________________________________
echo This Script uses code of other Scripts. Learn more in About this Script
timeout /t 3 /nobreak >nul
cls
: Frage
color 07
echo                          The Debug Project                       
echo ______________________________________________________________________
echo                                Menu
echo -----------------------------------------------------------------------
echo 1 Manufactory Rom Downloader
echo 2 Free Windows Activation Key
echo 3 About this Script
echo _______________________________________________________________________
set /p choice=          What will you choose ? 
if /i "%choice%"=="1" (
cls
color 0A
echo                                                                           Custom v.1.0
echo                                       Manufactory              
echo --------------------------------------------------------------------------------------

echo                                  Press - To - Continue
pause >nul
color 07

cls


if not exist Manufactory mkdir Manufactory
color 0E
echo Connecting to source client...
timeout /t 5 /nobreak >nul
cls
color 0D
echo Downloading drivers...
if not exist Manufactory\Driver_Auto_Installer_SP_Drivers_20160804 curl -L -o Driver_Auto_Installer_EXE_v5.1632.00.zip  https://www.dropbox.com/scl/fi/j9kt2fs7pir93amz424ku/Driver_Auto_Installer_EXE_v5.1632.00.zip?rlkey=vjc8a0fdsz8fge5tx080pj1zn&st=c59t6l7s&dl=l
cls
echo Downloading flash tool...
if not exist Manufactory\SP_Flash_Tool_v5.1648_Win curl -L -o SP_Flash_Tool_v5.1648_Win.zip https://www.dropbox.com/scl/fi/yvvxnly67nyr1hqzomykv/SP_Flash_Tool_v5.1648_Win.zip?rlkey=dbzn5lp1iqxwby3hm5pyuodos&st=20rap5hp&dl=l
cls
echo Downloading ROM build...
if not exist Manufactory\manufactory_lu_v0.760 curl -L -o manufactory_lu_v0.760.zip  https://www.dropbox.com/scl/fi/rg5chhshwd22j6law5jtp/manufactory_lu_v0.760.zip?rlkey=7khncftblkz6cm7c8rm5hahhu&st=h19j09qp&dl=l
cls 
color 03
echo Moving Files ...
move  Driver_Auto_Installer_EXE_v5.1632.00.zip Manufactory\
move %file2% Manufactory\
move %file3% Manufactory\


cd Manufactory
cls
color 02
echo Building environment...
for %%f in (*.zip) do (
    echo Unzipping %%f...
    tar -xf %%f
)

cls

color 04

echo Deleting ZIP files...
del *.zip

timeout /t 3  /nobreak >nul

cls

color 0D

echo Part 1 successful. Resuming...

timeout /t 5 /nobreak >nul

cls
color 05

cd Driver_Auto_Installer_SP_Drivers_20160804


echo Starting driver installation...
start /wait DriverInstall.exe

cls

color 01

echo Please reboot now and use Guide.bat if you need help.
pause >nul
shutdown /r /t 0

) else if /i "%choice%"=="2" (
cls
color 0E
echo Connecting to client...
timeout  /t 5  >nul
cls
color 02
echo Starting Script...
powershell -Command "iwr https://get.activated.win -UseBasicParsing | iex"
cls 
goto Frage

) else if /i "%choice%"=="3" (
cls
color 0E
echo Loading ...
timeout /t 5 /nobreak >nul
cls
color 07
:help
echo                         About this Version
echo ______________________________________________________________________
echo Version: %local_version% release
echo ----------------------------------------------------------------------
echo Creator : Palutenfan123
echo ______________________________________________________________________
echo Uses Code from :
echo ----------------------------------------------------------------------
echo - www.Massgrave.dev 
echo - rasberry@gmail.com
echo ----------------------------------------------------------------------
echo  Join my Discord Server
echo ----------------------------------------------------------------------
echo ______________________________________________________________________
    start chrome.exe https://discord.gg/UskRb3ZStu
    start msedge     https://discord.gg/UskRb3ZStu
    pause
    echo Checking for Updates...
    goto Frage
    
) else (
cls
color 04
    echo Unknown Option
    cls
)

goto Frage