@ECHO OFF
cd /d %0\..

SET args=%*

SHIFT & SHIFT

:loop
IF NOT "%1"=="" (
    IF "%1"=="-url" (
	SET url=%~2
        SHIFT
    )
    SHIFT
    GOTO :loop
)

erase cstub.exe
wget64 --quiet --ca-certificate=..\Certs\entrust.cer %url%/sdesktop/hostscan/windows_i386/cstub.exe

cstub.exe %*

:theend