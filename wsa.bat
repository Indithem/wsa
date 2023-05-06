@echo off
set "option=%1"
set "apk=%2"

if /i '%option%'=='-h' goto help
if /i '%option%'=='-r' adb disconnect 127.0.0.1:58526
adb connect 127.0.0.1:58526
if /i '%option%'=='' goto help

if /i "%option%"=="-s" adb -s 127.0.0.1:58526 shell monkey -p com.android.settings -c android.intent.category.LAUNCHER 1
if /i '%option%'=='-install' adb -s 127.0.0.1:58526 install "%apk%"


exit /b1
:help
echo A script made for me to use wsa things
echo    -s                  open settings
echo    -install            intall apk to wsa
echo    -r                  restart adb server
echo    -h                  print this help message
