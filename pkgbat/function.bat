@echo off







if "%1%" equ "func_unpcak" (
	goto func_unpcak
) else if "%1%" equ "func_pcak" (
	goto func_pcak
) else if "%1%" equ "func_sign" (
	goto func_sign
) else if "%1%" equ "func_gen_sign" (
	goto func_gen_sign
) else if "%1%" equ "func_repack" (
	goto func_repack
) else if "%1%" equ "func_import" (
	goto func_import
) else if "%1%" equ "func_layout" (
	goto func_layout
) else if "%1%" equ "func_data" (
	goto func_data
) else (
	goto end
)









:func_unpcak

set loc_apk_file=%2%
set loc_out_dir=%3%

java -jar apktool.jar d -f "%loc_apk_file%" -o "%loc_out_dir%"

goto end










:func_pcak

set loc_out_dir=%2%
set loc_apk_file=%3%

java -jar apktool.jar b -f "%loc_out_dir%" -o "%loc_apk_file%"

goto end










:func_sign

set loc_apk_file=%2%
set loc_key_file=%3%
set loc_psw_1=%4%
set loc_alias=%5%
set loc_psw_2=%6%

jarsigner -sigalg SHA1withRSA -digestalg SHA1 -keystore "%loc_key_file%" -keypass "%loc_psw_1%" -storepass "%loc_psw_2%" "%loc_apk_file%" %loc_alias%

goto end








:func_gen_sign

del /q %2%.keystore

echo %2%>in.txt
echo %2%>>in.txt
echo xingshi>>in.txt
echo danwei>>in.txt
echo zhuzhi>>in.txt
echo city>>in.txt
echo sheng>>in.txt
echo contry>>in.txt
echo y>>in.txt
echo %2%>>in.txt
echo %2%>>in.txt

keytool -genkey -alias android -keyalg RSA -validity 20000 -keystore %2%.keystore<in.txt

del /q in.txt

goto end








:func_repack

set out=%2%

set apk=NndAppMarry_HTFixed.apk
set newPackageName=lol.olp.pop.lil
set newVersionCode=14random(4)
set newVersionName=1.4.random(4)
set newAppIcon=%3%
set newAppName=%4%
set qudao=%5%
set qianzui=%6%
set signFile=123123.keystore
set psw1="123123"
set alias="123123"
set psw2="123123"

echo "%cd%\%apk%"
echo "%cd%\%apk:~0,-4%"

call %cd%\function.bat func_unpcak "%cd%\%apk%" "%cd%\%apk:~0,-4%"
timeout /t 1 /nobreak > nul
java -jar "%cd%\nndcommand.jar" modifyPackageName "%cd%\%apk:~0,-4%" %newPackageName%
java -jar "%cd%\nndcommand.jar" modifyVersionCode "%cd%\%apk:~0,-4%" %newVersionCode%
java -jar "%cd%\nndcommand.jar" modifyVersionName "%cd%\%apk:~0,-4%" %newVersionName%
java -jar "%cd%\nndcommand.jar" replace "%cd%\%apk:~0,-4%\AndroidManifest.xml" "\"UmengTestAiv\"" "\"%qudao%\""
echo f | xcopy "%cd%\icon\%newAppIcon%" "%cd%\%apk:~0,-4%\res\drawable-xxhdpi-v4\nnd_img_ic_launcher.png" /y
java -jar "%cd%\nndcommand.jar" replace "%cd%\%apk:~0,-4%\res\values\strings.xml" "AivPlay" %newAppName%
timeout /t 1 /nobreak > nul
call %cd%\function.bat func_pcak "%cd%\%apk:~0,-4%" "%cd%\%qudao%.apk"
timeout /t 1 /nobreak > nul
call %cd%\function.bat func_sign "%cd%\%qudao%.apk" "%cd%\%signFile%" %psw1% %alias% %psw2%
timeout /t 1 /nobreak > nul

rd /s /q "%cd%\%apk:~0,-4%"



if "%qianzui%" equ "null" (
	echo f | xcopy "%cd%\%qudao%.apk" "%cd%\%out%\%qudao%.apk" /y
) else (
	echo f | xcopy "%cd%\%qudao%.apk" "%cd%\%out%\%qianzui%%qudao%.apk" /y
)

timeout /t 1 /nobreak > nul
del /q "%cd%\%qudao%.apk"
timeout /t 1 /nobreak > nul

goto end











:func_import

set old_package=%2%
set new_package=%3%

java -jar "%cd%\nndcommand.jar" replace "%cd%\..\src" "*.java" %old_package% %new_package%

goto end







:func_layout

java -jar "%cd%\nndcommand.jar" layout_to_code "%cd%\.."

goto end






:func_data

java -jar "%cd%\nndcommand.jar" gen_json_struct "Android" "%cd%\struct" "%cd%\..\src\com\nnd\app\data" "package com.nnd.app.data;" "import com.nnd.app.datatool.AppDataTool;"

goto end












:end




