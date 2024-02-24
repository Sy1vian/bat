batch
@echo off
echo Welcome to Chinese Chess!
echo This is a simplified version and does not implement the full game logic.
echo Use commands like "move E2 E4" to move pieces. Type "exit" to quit.
:loop
set /p command="Enter your move: "
if "%command%"=="exit" goto end
echo You entered: %command%
echo (Here the game would process the move and update the board.)
goto loop
:end
echo Thanks for playing!