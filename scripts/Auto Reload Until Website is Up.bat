@echo off
setlocal ENABLEDELAYEDEXPANSION
title Wait until UP (visible; ~100ms loop)

REM ---- Edge executable path (your path) ----
set "EDGE=C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"

REM ---- curl available? ----
where curl >NUL 2>&1
if errorlevel 1 (
  echo ERROR: curl not found. On Windows 10/11 it should be available by default.
  echo Please install curl or add it to PATH.
  pause
  exit /b 1
)

REM ---- ask for URL ----
set /p URL=Paste URL: 
if "%URL%"=="" exit /b

REM ---- add https:// if user didn't include scheme ----
if /i not "%URL:~0,4%"=="http" set "URL=https://%URL%"

REM ---- loop settings ----
set "INTERVAL_MS=100"
set /a ATTEMPT=0

echo(
echo Target : %URL%
echo Edge   : %EDGE%
echo Check  : every %INTERVAL_MS% ms (Ctrl+C to stop)
echo -----------------------------------------------------

:loop
set /a ATTEMPT+=1

for /f "delims=" %%H in ('curl -s -o NUL -w "%%{http_code}" "%URL%" 2^>NUL') do set "CODE=%%H"
echo [%time%] try !ATTEMPT!   status: !CODE!

REM 200 OK or any 3xx redirect? -> open Edge and exit
echo !CODE!| findstr /r "200 3[0-9][0-9]" >NUL
if not errorlevel 1 (
  echo -----------------------------------------------------
  echo UP! Launching Microsoft Edge...
  if exist "%EDGE%" (
    start "" "%EDGE%" "%URL%"
  ) else (
    REM fallback if path changed but msedge is on PATH
    start "" msedge "%URL%"
  )
  exit /b 0
)

REM ~100ms pause to avoid pegging CPU (set to 0 for ultra-turbo)
ping 127.0.0.1 -n 1 -w %INTERVAL_MS% >NUL
goto :loop
