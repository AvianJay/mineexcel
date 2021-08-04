@echo off
title Mineexcel
%SYSTEMDRIVE%
cd %USERPROFILE%\mineexcel
goto check

:check
echo checking...
if exist "%USERPROFILE%\mineexcel\new.xlsm" (goto start) else (md worlds & echo List of worlds >> %USERPROFILE%\mineexcel\list.cfg & echo Downloading resource...(99.9KB) & curl https://raw.githubusercontent.com/AvianJay/mineexcel/main/new.xlsm --output new.xlsm & echo Downloaded.Ready To Check.)
goto check

:start
cls
echo Mineexcel
echo (1)Create A World
echo (2)Load A World
set /p ans="Select A Option:"
if %ans%==1 (goto create)
if %ans%==2 (goto load)
echo Please Select A Option.
pause
goto start

:create
set /p name="World Name:"
copy %USERPROFILE%\mineexcel\new.xlsm %USERPROFILE%\mineexcel\worlds\%name%.xlsm
echo %name% >> %USERPROFILE%\mineexcel\list.cfg
goto launch
exit

:load
type %USERPROFILE%\mineexcel\list.cfg
set /p name="Enter A World:"
goto launch
exit

:launch
cls
echo Don't close this window!!!
echo Launching...
"%USERPROFILE%\mineexcel\worlds\%name%.xlsm"
exit
