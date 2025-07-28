@REM This batch script starts two PHP servers

start /B php -S localhost:8888
start /B php -S localhost:9999 -t api
