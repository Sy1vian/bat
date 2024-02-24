@echo off
setlocal enabledelayedexpansion
cls
echo Welcome to the Adventure Game!
echo You wake up in a mysterious cave. What will you do?
echo 1. Go left
echo 2. Go right
echo 3. Go forward
echo.
set /p choice=Choose a direction (enter 1-3):
if "!choice!"=="1" goto LeftPath
if "!choice!"=="2" goto RightPath
if "!choice!"=="3" goto ForwardPath
echo Invalid choice.
pause
goto Start

:LeftPath
echo You go left and find a treasure chest! Game over.
goto End

:RightPath
echo You go right and encounter a monster! Game over.
goto End

:ForwardPath
echo You move forward and find an exit, you've escaped! Game over.
goto End

:End
echo Press any key to exit the game.
pause > nul
exit