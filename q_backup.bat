if not exist "백업" (
	mkdir "백업"
)

xcopy /S /C /Y "%appdata%\DarkSoulsIII\*.sl2" "백업"
