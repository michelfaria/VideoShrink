@echo off
setlocal

if "%~1" == "" (
    echo VideoShrink 1.0 - Windows Batch Edition
    echo This script uses ffmpeg to compress a video's file size to the specified size.
    echo.
    echo Parameters:
    echo   ^<first parameter^>
    echo      Input file path.
    echo      This will be the video file that will be compressed.
    echo   ^<second parameter^> ^(optional^)
    echo      Target file size ^(in megabytes^).
    echo      Only natural numbers are acceptable values.
    echo      If unspecified, the size will be prompted interactively.
    echo.
    echo You may also drag and drop a video file onto this script.
    echo.
    pause
    exit
)

set input=%~1
set input=%input:\=/% & :: Convert Windows path to Unix-like path

if "%~2" == "" (
    set /p size="Enter target video size in megabytes (natural numbers only): "
) else ( set size=%~2 )

:: Check if size is a number
call :isNumber %size% || (
    echo "%size%" is not a valid integer!
    goto error
)

:: Calculate filesize in bits
set /a targetSize=%size% * 1000 * 1000 * 8

:: Calculate length of input video
for /f "tokens=* usebackq" %%a in (
    `ffprobe -v error -show_entries format^=duration -of default^=noprint_wrappers^=1:nokey^=1 "%input%"`
) do ( set length=%%a )
if "%length%"=="" goto :error

:: Round %length% up
for /f "tokens=1 delims=." %%a in ('echo %length%') do set /a lengthRounded=%%a + 1

set /a totalBitrate = %targetSize% / %lengthRounded%
set /a audioBitrate = 128 * 1000 & :: "128k bitrate"
set /a videoBitrate = %totalBitrate% - %audioBitrate%
set /a bufSize = %targetSize% / 20

ffmpeg -i "%input%" -b:v %videoBitrate% -maxrate:v %videoBitrate% -bufsize:v %bufSize% -b:a %audioBitrate% "%input%-%size%mb.mp4"

if %ERRORLEVEL% neq 0 goto :error

pause
exit /b 0

:error
echo Command execution failed
pause
exit /b %ERRORLEVEL% 

:isNumber <str>
echo %1 | findstr "[1-9][0-9]*">nul && exit /b 0
exit /b 1