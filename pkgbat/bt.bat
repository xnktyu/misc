@echo off
setlocal enabledelayedexpansion

set release=false;
set version=auto;

set list=%1 %2 %3 %4 %5 %6
for %%i in (%list%) do (
	set var=%%i
	echo %%i !var:~0,2! !version!
	if "!version!" equ "setvalue" (
		set version=%%i;
	) else if "%%i" equ "-s" (
		set release=true
	) else if "%%i" equ "-v" (
		set version=setvalue
	)
)

echo build %release% %version%