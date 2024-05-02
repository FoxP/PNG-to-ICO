REM		Name :
REM					PNG to ICO
REM		Author :
REM					▄▄▄▄▄▄▄  ▄ ▄▄ ▄▄▄▄▄▄▄
REM					█ ▄▄▄ █ ██ ▀▄ █ ▄▄▄ █
REM					█ ███ █ ▄▀ ▀▄ █ ███ █
REM					█▄▄▄▄▄█ █ ▄▀█ █▄▄▄▄▄█
REM					▄▄ ▄  ▄▄▀██▀▀ ▄▄▄ ▄▄
REM					 ▀█▄█▄▄▄█▀▀ ▄▄▀█ █▄▀█
REM					 █ █▀▄▄▄▀██▀▄ █▄▄█ ▀█
REM					▄▄▄▄▄▄▄ █▄█▀ ▄ ██ ▄█
REM					█ ▄▄▄ █  █▀█▀ ▄▀▀  ▄▀
REM					█ ███ █ ▀▄  ▄▀▀▄▄▀█▀█
REM					█▄▄▄▄▄█ ███▀▄▀ ▀██ ▄
@ECHO off
REM Console title
TITLE PNG to ICO
REM Script folder path
SET directoryPath=%~dp0
REM Console height / width
MODE 65,30 | ECHO off
ECHO.
ECHO   -------------------------------------------------------------
ECHO                            PNG to ICO :
ECHO   -------------------------------------------------------------
ECHO.
REM First command line argument
SET argPath=%1
REM If first argument is a directory
IF EXIST %argPath%\* (
	REM ECHO Directory : %argPath%
	REM Iterate through PNG, GIF, BMP, SVG and JPG files in directory
	FOR %%f IN (%argPath%\*.png %argPath%\*.bmp %argPath%\*.gif %argPath%\*.jpg %argPath%\*.jpeg %argPath%\*.svg) DO (
		REM Print file name (with extension)
		ECHO - %%~nf%%~xf
		REM Convert file to multi-resolution ICO
		"%directoryPath%ImageMagick\convert.exe" "%%f" -resize 256x256^> -background none -gravity center -extent 256x256 -define icon:auto-resize=256,128,96,64,48,32,24,16 "%%~df%%~pf%%~nf.ico"
	)
REM If first argument is a file
) ELSE (
	REM ECHO File : %argPath%
	FOR %%f IN (%argPath%) DO (
		REM Print file name (with extension)
		ECHO - %%~nf%%~xf
		REM Convert file to multi-resolution ICO
		"%directoryPath%ImageMagick\convert.exe" %argPath% -resize 256x256^> -background none -gravity center -extent 256x256 -define icon:auto-resize=256,128,96,64,48,32,24,16 "%%~df%%~pf%%~nf.ico"
	)
)