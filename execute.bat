@echo off
setlocal enabledelayedexpansion

if not exist results mkdir results
for %%F in (inputs\*) do (
    set "FILENAME=%%~nxF"
    
    echo 0 > input.txt
    echo ./inputs/!FILENAME! >> input.txt
    echo 1 >> input.txt
    echo 0 >> input.txt
    echo 50 >> input.txt
    echo 0 >> input.txt

    assets.exe 2048 < input.txt
    waitfor /T 5 assets.exe 2>NUL || timeout /T 5
    copy "experiments\AlgorithmTesting\finalAnalysisReport.txt" "results\!FILENAME!"
    echo Process for !FILENAME! completed!
)

echo All processes completed!
pause