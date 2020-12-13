@echo off







if "%1%" equ "func_repack" (
	goto func_repack
) else (
	goto end
)









:func_repack

set out=%2%

set apk=%3%
set newPackageName=%4%
set newVersionCode=%5%
set newVersionName=%6%
set qudao=%7%
set sign=xnktyu%7%
set signFile=%sign%.keystore
set psw1="%sign%"
set alias="android"
set psw2="%sign%"

call %cd%\function.bat func_gen_sign %sign%

echo "%cd%\%apk%"
echo "%cd%\%apk:~0,-4%"

call %cd%\function.bat func_unpcak "%cd%\%apk%" "%cd%\%apk:~0,-4%"
java -jar "%cd%\nndcommand.jar" modifyPackageName "%cd%\%apk:~0,-4%" %newPackageName%
java -jar "%cd%\nndcommand.jar" modifyVersionCode "%cd%\%apk:~0,-4%" %newVersionCode%
java -jar "%cd%\nndcommand.jar" modifyVersionName "%cd%\%apk:~0,-4%" %newVersionName%
java -jar "%cd%\nndcommand.jar" replace "%cd%\%apk:~0,-4%\AndroidManifest.xml" "\"UmengTestAiv\"" "\"%qudao%\""
call %cd%\function.bat func_pcak "%cd%\%apk:~0,-4%" "%cd%\%qudao%.apk"
call %cd%\function.bat func_sign "%cd%\%qudao%.apk" "%cd%\%signFile%" %psw1% %alias% %psw2%

rd /s /q "%cd%\%apk:~0,-4%"
del /q %sign%.keystore

echo f | xcopy "%cd%\%qudao%.apk" "%cd%\%out%\%qudao%.apk" /y
del /q "%cd%\%qudao%.apk"

goto end












:end




