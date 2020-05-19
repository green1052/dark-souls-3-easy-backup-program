@echo off
setlocal
mode con cols=100 lines=25

title 다크소울 3 세이브 자동 백업 프로그램 by green1052 V1.0.2

:main
cls
if not exist "백업" (
	mkdir "백업" > nul
	echo "백업" 폴더가 없어 백업 폴더를 새로 생성 했습니다.
	timeout 3 > nul
)
cls
echo 메뉴 V1.0.2
echo 1. 백업
echo 2. 복원
echo 3. 백업 데이터 삭제
echo 4. 나가기
echo [by green1052]
echo.

set /P input=값을 입력해주세요: 

if "%input%" == "1" goto backup
if "%input%" == "2" goto restore
if "%input%" == "3" goto remove
if "%input%" == "4" exit

cls
echo 잘못된 입력
timeout 3 > nul
goto main

:backup
cls
xcopy /S /C /Y "%appdata%\DarkSoulsIII\*.sl2" "백업" > nul
echo 세이브 파일이 "백업" 폴더에 백업 됐습니다.
timeout 3 > nul
goto main

:restore
cls

for /f "delims=" %%A in ('dir /S /B "백업\*.sl2"') do (
	set files=%%A
)

if "%files%" == "" (
	cls
	echo "백업" 폴더에 백업 파일이 없습니다. 메뉴에서 백업을 한뒤 다시 시도해주세요.
	timeout 3 > nul
	goto main
)

echo "백업" 폴더에 있는 모든 세이브를 적용 중 입니다.
xcopy /S /C /Y "백업\*.sl2" "%appdata%\DarkSoulsIII" > nul
echo 적용이 됐습니다. "백업" 폴더의 세이브를 지우고 있습니다.
rd /S /Q "백업" > nul
echo 삭제 완료

timeout 3 > nul
goto main

:remove
cls
rd /S /Q "백업" > nul
echo 저장된 백업 데이터를 전부 삭제했습니다.
timeout 3 > nul
goto main