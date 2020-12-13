@echo off




set apk=marryyou170.apk





rd /s /q "%cd%\%apk:~0,-4%"
timeout /t 1 /nobreak > nul
call %cd%\function.bat func_unpcak "%cd%\%apk%" "%cd%\%apk:~0,-4%"







rem echo 按任意键退出。。。
rem pause>nul
