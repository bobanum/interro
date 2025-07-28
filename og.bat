@echo off
setlocal enabledelayedexpansion

:: Define the ports you want to kill
set "ports=8888 9999"

for %%P in (%ports%) do (
    echo Looking for processes using port %%P...
    for /f "tokens=5" %%A in ('netstat -aon ^| findstr :%%P ^| findstr LISTENING') do (
        echo Found PID %%A on port %%P
        taskkill /F /PID %%A >nul 2>&1
        if !errorlevel! equ 0 (
            echo Successfully killed process %%A
        ) else (
            echo Failed to kill process %%A
        )
    )
)

endlocal
