@echo off
setlocal
mode con cols=100 lines=25

title ��ũ�ҿ� 3 ���̺� �ڵ� ��� ���α׷� by green1052 V1.0.2

:main
cls
if not exist "���" (
	mkdir "���" > nul
	echo "���" ������ ���� ��� ������ ���� ���� �߽��ϴ�.
	timeout 3 > nul
)
cls
echo �޴� V1.0.2
echo 1. ���
echo 2. ����
echo 3. ��� ������ ����
echo 4. ������
echo [by green1052]
echo.

set /P input=���� �Է����ּ���: 

if "%input%" == "1" goto backup
if "%input%" == "2" goto restore
if "%input%" == "3" goto remove
if "%input%" == "4" exit

cls
echo �߸��� �Է�
timeout 3 > nul
goto main

:backup
cls
xcopy /S /C /Y "%appdata%\DarkSoulsIII\*.sl2" "���" > nul
echo ���̺� ������ "���" ������ ��� �ƽ��ϴ�.
timeout 3 > nul
goto main

:restore
cls

for /f "delims=" %%A in ('dir /S /B "���\*.sl2"') do (
	set files=%%A
)

if "%files%" == "" (
	cls
	echo "���" ������ ��� ������ �����ϴ�. �޴����� ����� �ѵ� �ٽ� �õ����ּ���.
	timeout 3 > nul
	goto main
)

echo "���" ������ �ִ� ��� ���̺긦 ���� �� �Դϴ�.
xcopy /S /C /Y "���\*.sl2" "%appdata%\DarkSoulsIII" > nul
echo ������ �ƽ��ϴ�. "���" ������ ���̺긦 ����� �ֽ��ϴ�.
rd /S /Q "���" > nul
echo ���� �Ϸ�

timeout 3 > nul
goto main

:remove
cls
rd /S /Q "���" > nul
echo ����� ��� �����͸� ���� �����߽��ϴ�.
timeout 3 > nul
goto main