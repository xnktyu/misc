@echo off

set out_dir=apk

rd /s /q "%cd%\%out_dir%"
md "%cd%\%out_dir%"











call %cd%\function.bat func_repack %out_dir% vn.png "MM.TV" pp001 null
call %cd%\function.bat func_repack %out_dir% vn.png "MM.TV" pp002 null













timeout /t 1 /nobreak > nul


rem echo 按任意键退出。。。
rem pause>nul
