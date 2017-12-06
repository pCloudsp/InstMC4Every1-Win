@echo off
cls

echo ===========================================================
echo Minecraft原版服务端一键安装脚本Windows版 主脚本 v5.0_alpha1
echo -----------------------作者: +Clouds+----------------------
echo ---------------博客: https://tec4every1.com ---------------
echo =================正在做一些初始化操作......================

:initialize
echo '在Windows系统里什么包管理器都是不存在的，跳过...'
echo '检测必要依赖安装情况...'

echo %path%|find "java" >nul
if %errorlevel% equ 0 (
	echo 检测到Java。继续...
) else (
	echo 未检测到Java。正在安装...
	echo %processor_architecture% | find "64" >nul
	if %errorlevel% equ 0 (
		echo 你的系统是64位的。正在下载对应的安装包...
		bitsadmin.exe /transfer "Downloading Java installation binary" http://download.oracle.com/otn-pub/java/jdk/8u152-b16/aa0333dd3019491ca4f6ddbe78cdb6d0/jre-8u152-windows-x64.exe %homepath%\Downloads\jre-installer.exe
		%homepath%\Downloads\jre-installer.exe /s
		echo Java正在下载并安装。你可以在这段时间内同时使用本脚本配置服务器。
	) else (
		echo 你的系统是32位的。正在下载对应的安装包...
		bitsadmin.exe /transfer "Downloading Java installation binary" http://download.oracle.com/otn-pub/java/jdk/8u152-b16/aa0333dd3019491ca4f6ddbe78cdb6d0/jre-8u152-windows-i586.exe %homepath%\Downloads\jre-installer.exe
		%homepath%\Downloads\jre-installer.exe /s
		echo Java正在下载并安装。你可以在这段时间内同时使用本脚本配置服务器。
	)