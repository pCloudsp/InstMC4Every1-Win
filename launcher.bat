@echo off
cls
cd %~dp0

echo =============================================================
echo Minecraft原版服务端一键安装脚本Windows版 启动脚本 v5.0_alpha1
echo -----------------------作者: +Clouds+------------------------
echo ---------------博客: https://tec4every1.com -----------------
echo =================正在做一些初始化操作......==================

:initialize
if exist %homepath%\xmcalreadyran (
	echo '在Windows系统里什么包管理器都是不存在的，跳过...'
	echo '检测必要依赖安装情况...'
	::CheckJava
	echo %path%|find "java" >nul
	if %errorlevel% equ 0 (
		echo 检测到Java。继续...
	) else (
		echo 未检测到Java。正在安装...
		echo %processor_architecture% | find "64" >nul
		if %errorlevel% equ 0 (
			./jre8u152x64.exe /s
			echo 64位的Java正在后台被安装。你可以继续配置进程。
		) else (
			./jre8u152x86.exe /s
			echo 32位的Java正在后台被安装。你可以继续配置进程。
		)
	)
	::InstallGit
	echo %path%|find "java" >nul
	if %errorlevel% equ 0 (
		echo 正在安装64位的git。
		./git64.exe /silent
	) else (
		echo 正在安装32位的git。
		./git32.exe /silent
	)
	::InstallWget
	echo 正在安装Wget。
	./wgetsetup.exe /s
	echo %processor_architecture% | find "64" >nul
	if %errorlevel% equ 0 (
		set PATH=%PATH%;%PROGRAMFILES(X86)%\GnuWin32\bin
	) else (
		set PATH=%PATH%;%PROGRAMFILES%\GnuWin32\bin
	)
	echo 初始化完毕！
	exit
) else (
	if %errorlevel% equ 0 (
		set PATH=%PATH%;%PROGRAMFILES(X86)%\GnuWin32\bin
	) else (
		set PATH=%PATH%;%PROGRAMFILES%\GnuWin32\bin
	)
	echo 初始化完毕！
	./main.bat
)