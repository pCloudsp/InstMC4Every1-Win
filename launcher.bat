@echo off
cls

echo ===========================================================
echo Minecraftԭ������һ����װ�ű�Windows�� ���ű� v5.0_alpha1
echo -----------------------����: +Clouds+----------------------
echo ---------------����: https://tec4every1.com ---------------
echo =================������һЩ��ʼ������......================

:initialize
echo '��Windowsϵͳ��ʲô�����������ǲ����ڵģ�����...'
echo '����Ҫ������װ���...'

echo %path%|find "java" >nul
if %errorlevel% equ 0 (
	echo ��⵽Java������...
) else (
	echo δ��⵽Java�����ڰ�װ...
	echo %processor_architecture% | find "64" >nul
	if %errorlevel% equ 0 (
		echo ���ϵͳ��64λ�ġ��������ض�Ӧ�İ�װ��...
		bitsadmin.exe /transfer "Downloading Java installation binary" http://download.oracle.com/otn-pub/java/jdk/8u152-b16/aa0333dd3019491ca4f6ddbe78cdb6d0/jre-8u152-windows-x64.exe %homepath%\Downloads\jre-installer.exe
		%homepath%\Downloads\jre-installer.exe /s
		echo Java�������ز���װ������������ʱ����ͬʱʹ�ñ��ű����÷�������
	) else (
		echo ���ϵͳ��32λ�ġ��������ض�Ӧ�İ�װ��...
		bitsadmin.exe /transfer "Downloading Java installation binary" http://download.oracle.com/otn-pub/java/jdk/8u152-b16/aa0333dd3019491ca4f6ddbe78cdb6d0/jre-8u152-windows-i586.exe %homepath%\Downloads\jre-installer.exe
		%homepath%\Downloads\jre-installer.exe /s
		echo Java�������ز���װ������������ʱ����ͬʱʹ�ñ��ű����÷�������
	)