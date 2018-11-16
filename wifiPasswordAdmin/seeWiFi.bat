@echo off
if not "%OS%"=="Windows_NT" EXIT
if not "%0"=="seeWiFi.bat" exit
chcp 65001 >nul
title seeWiFi

rem 获取用户配置文件，实时刷新
netsh wlan show profiles |find "All User Profile" >%temp%\userfiles.txt
rem 提取SSID name 
powershell -Command "(gc %temp%\userfiles.txt) -replace '    All User Profile     : ', ''" >%temp%\userfiles2.txt

rem 删除不需要的文件
if exist "%temp%\userfiles.txt"  ( del %temp%\userfiles.txt )

rem 功能一：直接查看wifi密码
rem 列出wifi名
echo Your computer connnect all WiFi name:
for /f "tokens=*"  %%f in (%temp%\userfiles2.txt) do echo		%%f
rem 选择wifi,给name赋值
echo =====================================
:loop
set /p name=Please input your WiFi name(SSID):
( netsh wlan show profiles name="%name%" key=clear |find "SSID name" ) ||echo     SSID name              : "%name%" 
( netsh wlan show profiles name="%name%" key=clear |find "Key Content" ) ||echo     Key Content            : NO exist
echo =====================================
:continue
set con=y
set /p con=Continue to look up other WiFi password^(默认:y^/n^/q^)^:
if "%con%"=="y" (
goto loop
) else if "%con%"=="n" (
call ClickStartCrackWifiPassword.bat back

) else if "%con%"=="q" (
if exist "%temp%\userfiles.txt"  ( del %temp%\userfiles.txt )
if exist "%temp%\userfiles2.txt"  ( del %temp%\userfiles2.txt )
if exist "%temp%\scanWifi.bat"  ( del %temp%\scanWifi.bat )
if exist "%temp%\scanWifi.exe"  ( del %temp%\scanWifi.exe )
if exist %temp%\scanWifi.bat ( del %temp%\scanWifi.bat )
if exist %temp%\scanWifi.exe  ( del %temp%\scanWifi.exe )
exit
) else (
goto continue
)
rem 功能一：end