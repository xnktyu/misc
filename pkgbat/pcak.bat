@echo off




set apk=NndAppMarry_HTFixed.apk

set signFile=123123.keystore
set psw1="123123"
set alias="123123"
set psw2="123123"









del /q "%cd%\_%apk%"
timeout /t 1 /nobreak > nul
call %cd%\function.bat func_pcak "%cd%\%apk:~0,-4%" "%cd%\_%apk%"
timeout /t 1 /nobreak > nul
call %cd%\function.bat func_sign "%cd%\_%apk%" "%cd%\%signFile%" %psw1% %alias% %psw2%






rem echo 按任意键退出。。。
rem pause>nul
