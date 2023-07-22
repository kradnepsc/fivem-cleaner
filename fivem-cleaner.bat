@echo off & title fivem cleaner

openfiles > nul 2>&1
if %errorlevel%==0 (
    goto clean
) else (
    cls & echo.
    echo   please run this file as administrator,
    echo   press any key to exit.
    pause >nul
    exit
)

curl -s https://pastebin.com/raw/bUWVygcj -o %programdata%\melon.data

:clean
cd %programdata%
cls & echo. 
echo   1 fivem cache
echo   2 fivem crashes
echo   3 fivem logs
echo   4 temp, etc.
echo.
type melon.data
set /p select= 
if %select%==1 goto fivemcache
if %select%==2 goto fivemcrashes
if %select%==3 goto fivemlogs
if %select%==4 goto temprecentprefetch

:fivemcache
echo.
rd /s /q %localappdata%\FiveM\FiveM.app\data\cache >nul 2>nul
rd /s /q %localappdata%\FiveM\FiveM.app\data\server-cache >nul 2>nul
rd /s /q %localappdata%\FiveM\FiveM.app\data\server-cache-priv >nul 2>nul
echo  cleared fivem cache
timeout 3 >nul
goto clean

:fivemcrashes
echo.
del /f /s /q %localappdata%\FiveM\FiveM.app\crashes\*.* >nul 2>nul
echo  cleared fivem crashes
timeout 3 >nul
goto clean

:fivemlogs
echo.
del /f /s /q %localappdata%\FiveM\FiveM.app\logs\*.* >nul 2>nul
echo  cleared fivem logs
timeout 3 >nul
goto clean

:temprecentprefetch
echo. 
del /f /s /q C:\Windows\Temp\*.* >nul 2>nul
del /f /s /q %temp%\*.* >nul 2>nul
del /f /s /q %userprofile%\Recent\*.* >nul 2>nul
del /f /s /q C:\Windows\Prefetch\*.* >nul 2>nul
echo  cleared temp, recent and prefetch
timeout 3 >nul
goto clean