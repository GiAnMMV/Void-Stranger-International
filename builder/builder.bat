@echo off

if exist variables.bat (
    call variables.bat
)

:loop1
if not exist "%UNDERTALEMODCLI_PATH%" (
    set /p UNDERTALEOMODCLI_PATH=Insert path to UndertaleModCli.exe: 
    set update=1
    goto loop1
)

:loop2
if not exist "%VOID_STRANGER_PATH%\" (
    set /p VOID_STRANGER_PATH=Insert path to Void Stranger's directory: 
    set update=1
    goto loop2
)

if defined update (
    echo set "UNDERTALEMODCLI_PATH=%UNDERTALEMODCLI_PATH%">variables.bat
    echo set "VOID_STRANGER_PATH=%VOID_STRANGER_PATH%">>variables.bat
    set update=
)

if not exist "%VOID_STRANGER_PATH%\data.win.bak" (
    copy "%VOID_STRANGER_PATH%\data.win" "%VOID_STRANGER_PATH%\data.win.bak"
)

"%UNDERTALEMODCLI_PATH%" load "%VOID_STRANGER_PATH%\data.win.bak" --scripts .\csx\merger.csx --output "%VOID_STRANGER_PATH%\data.win"