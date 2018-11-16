@echo off
if not "%OS%"=="Windows_NT" EXIT
REM if not "%0"=="ClickStartCrackWifiPassword.bat" exit
if "%1"=="back" (
echo ====================================
if "%2"=="pa" pause
chcp 65001 >nul
goto fun
)
 
Title WiFiPasswordSave
color 07
chcp 936 >nul
more rendme.txt

rem 删除不需要的文件
if exist "%temp%\userfiles.txt"  ( del %temp%\userfiles.txt )
if exist "%temp%\userfiles2.txt"  ( del %temp%\userfiles2.txt )
if exist "%temp%\password.txt"  ( del %temp%\password.txt)
if exist "%temp%\wifiPassword2.txt"  ( del %temp%\wifiPassword2.txt )

rem 判断文件路径中是否有空格，并开始检测文件是否完全
if not exist checkFiles.bat ( 
		echo=
		echo 		File not exist : checkFiles.bat
		echo=
		echo ====================================
		pause
		exit
	)
call checkFiles.bat %cd%


:fun

rem 选择功能
echo Select function:
echo 	1.See WiFi password
echo 	2.Save all Wifi Password to wifipassword.txt
echo 	3.exit
echo =====================================

set num=2
set /p num=请输入你想执行那个功能^(默认:2^)^:

if %num%==1 (
rem 功能一：直接查看wifi密码
call seeWiFi.bat 

) else if %num%==2 (
rem 功能二：保存密码到当前目录下的Password\wifi%temp%\password.txt
call saveWiFi.bat 
	
) else if %num%==3 (
	rem 删除不需要的文件
	if exist "%temp%\userfiles.txt"  ( del %temp%\userfiles.txt )
	if exist "%temp%\userfiles2.txt"  ( del %temp%\userfiles2.txt )
	if exist "%temp%\password.txt"  ( del %temp%\password.txt)
	if exist "%temp%\wifiPassword2.txt"  ( del %temp%\wifiPassword2.txt )
	if exist "%temp%\scanWifi.bat" ( del %temp%\scanWifi.bat )
	if exist "%temp%\scanWifi.exe"  ( del %temp%\scanWifi.exe )

	exit
) else (
	rem 删除不需要的文件
	if exist "%temp%\userfiles.txt"  ( del %temp%\userfiles.txt )
	if exist "%temp%\userfiles2.txt"  ( del %temp%\userfiles2.txt )
	if exist "%temp%\password.txt"  ( del %temp%\password.txt)
	if exist "%temp%\wifiPassword2.txt"  ( del %temp%\wifiPassword2.txt )
	if exist "%temp%\scanWifi.bat" ( del %temp%\scanWifi.bat )
	if exist "%temp%\scanWifi.exe"  ( del %temp%\scanWifi.exe )

	exit
)

