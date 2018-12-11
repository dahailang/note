@echo off
:start
CLS
COLOR 2f
:: 使用COLOR命令对控制台输出颜色进行更改
mode con cols=56 lines=20
:: MODE语句为设定窗体的宽和高
title	设置上网环境
echo	☆☆☆☆请选择上网环境☆☆☆☆
echo	公司固定IP模式=========》按1键
echo	家用自动获取模式=======》按2键
set/p n=
if /i "%n%" equ "1" goto guding
if /i "%n%" equ "2" goto zidong

: guding
echo 您选择了公司固定IP模式
echo 正在设置，请稍后......
netsh interface ip set address name="以太网" source=static addr=10.161.251.62 mask=255.255.255.0 gateway=10.161.251.249 gwmetric=0 >nul
echo 正在添加本机主DNS...
netsh interface ip set dns name="以太网" source=static addr=172.16.9.60 register=PRIMARY
::echo 正在添加备用DNS...
::netsh interface ipv4 add dns name="以太网" addr=8.8.8.8
goto end

: zidong
echo 您选择了家用自动获取模式
echo 正在设置，请稍后......
echo 自动获取IP地址....
@echo off
netsh interface ip set address name = "以太网" source = dhcp
echo 自动获取DNS服务器....
netsh interface ip set dns name = "以太网" source = dhcp
goto end
:end

color 11
echo ☆☆☆☆☆☆☆☆本机当前IP配置如下☆☆☆☆☆☆☆☆☆☆☆☆
ipconfig /all
echo ☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆
pause
