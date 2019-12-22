# Blat_sendWifiPassword

## 警告(免责声明

本软件只用于 bat 脚本的学习爱好者.如果您将本程序用于非法通途,触发法律.结果由您自己承担.

## update 更新内容

1. 修复wifi名为空时,打印不完全
2. 重命名保存的文件名
3. 更改临时文件的位置
4. 修复命名文件时时间问题,将小于10点之前的空格+一位数变为两位数
5. 修复网络状态监测
6. 新增路径判断，主要是不能有空格
7. 新增360杀毒软件的检测，如果有则程序不能运行
8. 新增邮箱发送功能，将之前检测到的WiFi密码发送到指定邮箱
9. 新增文件检测，即所需要的文件是否存在，如果不存在提示那个文件丢失
10. 除了获取wifi密码外还获取ip地址，网关以及用户名和主机名

## infomation 文件功能

|filename|desc|
|---|---|
|checkFiles.bat　|　　主要是程序运行前的检测工作|
|ClickStartCrackWifiPassword.bat |　　程序运行的开始位置|
|configFiles.ini　|配置文件，用来检查文件是否存在|
|findWIfi.dll　|　是 admin/scanWifi.bat加密后形成 findWIfi.dll，如果要修改邮箱地址，则先修改admin/scanWifi.bat 之后使用 admin/readmin的第一行命令对其加密后形成admin/findWIfi.dll，然后将admin/findWIfi.dll覆盖根目录下的findWifi.dll|
|rendme.txt　　　|程序运行前的提示，版本更新|
|saveWiFi.bat　　|保存得到的密码文件（功能二）|
|scanWifi.dll| 在temp目录生成scanWifi.exe(此文件本质是用来发wifi密码到指定邮箱)，是blat.exe（cmd下发送邮件的小的开源软件 https://sourceforge.net/projects/blat/files/ ）的重命名|
|seeWiFi.bat　|　查看密码（功能一）|

|文件夹|desc|
|---|---|
|password  | 　　保存生成的密码文件|
|admin| 主要存放了邮箱发送的原始文件，以及要替换得findWifi.dll|

## use guide 使用方法

1. 打开scanWIFi.bat，修改红色圈住的变量，其中form是发送的邮件人也是登录邮箱服务器的用户名，to是接受邮件的人,server是邮箱的服务器，（我这里是163的邮箱服务器，如果你是QQ的话是：smtp.qq.com）,pw是登录邮箱的客户端授权密码，不是直接登录邮箱的密码

2. 修改完成后，点击replace.bat 直接对scanWifi.bat进行base64加密生成同一目录下的findWIfi.dll，之后使用admin/findWIfi.dll替换根目录下的findWIfi.dll，就可以了

## 通知

>此软件已经不再维护
