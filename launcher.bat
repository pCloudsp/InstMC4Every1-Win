@echo off
cls
cd %~dp0

echo =============================================================
echo Minecraftԭ������һ����װ�ű�Windows�� �����ű� v5.0_alpha1
echo -----------------------����: +Clouds+------------------------
echo ---------------����: https://tec4every1.com -----------------
echo =================������һЩ��ʼ������......==================

:initialize
if exist %homepath%\xmcalreadyran (
	echo '��Windowsϵͳ��ʲô�����������ǲ����ڵģ�����...'
	echo '����Ҫ������װ���...'
	::CheckJava
	echo %path%|find "java" >nul
	if %errorlevel% equ 0 (
		echo ��⵽Java������...
	) else (
		echo δ��⵽Java�����ڰ�װ...
		echo %processor_architecture% | find "64" >nul
		if %errorlevel% equ 0 (
			./jre8u152x64.exe /s
			echo 64λ��Java���ں�̨����װ������Լ������ý��̡�
		) else (
			./jre8u152x86.exe /s
			echo 32λ��Java���ں�̨����װ������Լ������ý��̡�
		)
	)
	::InstallGit
	echo %path%|find "java" >nul
	if %errorlevel% equ 0 (
		echo ���ڰ�װ64λ��git��
		./git64.exe /silent
	) else (
		echo ���ڰ�װ32λ��git��
		./git32.exe /silent
	)
	::InstallWget
	echo ���ڰ�װWget��
	./wgetsetup.exe /s
	echo %processor_architecture% | find "64" >nul
	if %errorlevel% equ 0 (
		set PATH=%PATH%;%PROGRAMFILES(X86)%\GnuWin32\bin
	) else (
		set PATH=%PATH%;%PROGRAMFILES%\GnuWin32\bin
	)
	echo ��ʼ����ϣ�
	exit
) else (
	if %errorlevel% equ 0 (
		set PATH=%PATH%;%PROGRAMFILES(X86)%\GnuWin32\bin
	) else (
		set PATH=%PATH%;%PROGRAMFILES%\GnuWin32\bin
	)
	echo ��ʼ����ϣ�
	./main.bat
)