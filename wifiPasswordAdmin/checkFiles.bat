@echo off
if not "%OS%"=="Windows_NT" EXIT
if not "%0"=="checkFiles.bat" exit

rem 功能一：判断路径是否为空
echo Strat check file path :
if not "%2"=="" (
	echo=
	echo 		Fail! The path contains spaces , Please find other file path...
	echo=
	echo ====================================
	pause
	exit
) else (
	echo=
	echo 		Successful ! No spaces .
	echo=
	echo ====================================
)

rem 功能一：end

rem 功能二：判断需要的文件是否都存在
set bool=1

echo Start check all files exist :
if not exist configFiles.ini ( 
		set bool=0
		echo=
		echo 		File not exist ^: configFiles.ini 
		echo=
		echo ====================================
		pause
		exit
	)

for /f %%i in (configFiles.ini) do (
	if not exist %1\%%i ( 
		set bool=0
		echo=
		echo 		File not exist : %%i
	)
)

if "%bool%"=="0" (
	echo=
	echo ====================================
	pause
	exit
) else (
	echo=
	echo 		All files exist
	echo=
	echo ====================================
)

rem 功能二：end

rem 功能三：判断是否已经联网
echo Start check networking state :
set url=www.baidu.com
set bool=0
( ping -n 2 %url% |  find  "Destination host unreachable." >nul )&& set bool=0  || set bool=1
if "%bool%"=="0" goto end
( ping -n 2 %url% |  find  "Request timed out.">nul )&& set bool=0  || set bool=1
if "%bool%"=="0" goto end
( ping -n 2 %url% |  find  "Ping request could">nul  )&& set bool=0 || set bool=1
if "%bool%"=="0" goto end

if "%bool%"=="1" (
	echo=
	echo 		Network is connected
	echo=
	echo ====================================
) else (
	:end
	echo=
	echo 		No networking , Please check networking ....
	echo=
	pause
	exit
)

rem 功能三：end

REM rem 功能四：获取本机ip和网关
REM echo IPv4 Address :
REM for /f "tokens=2 delims=:" %%b in (' ipconfig ^|find "IPv4" ') do echo 		%%b
REM echo Default Gateway:
REM for /f "tokens=2 delims=:" %%b in (' ipconfig ^|find "Default" ') do if not "%%b"==" " echo 		%%b
REM rem 功能四：end 


rem 功能五：检测360
echo Start check 360 anti-virus software :
( tasklist |find "360tray.exe" >nul) && (
	echo=
	echo 		Please turn off the 360 anti-virus software, 
	echo 		otherwise the program will not be able to run....
	echo=
	pause
	exit
) || (
	echo=
	echo 		360 anti-virus software has been closed .
	echo=
	call ClickStartCrackWifiPassword.bat back pa
)
rem 功能五：end 

