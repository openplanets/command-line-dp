@echo off
REM FIDIR: FIDO + DIR 
REM part of the OPF webinar "Digital Preservation at your command part II"
REM http://www.openplanetsfoundation.org/
REM http://www.openplanetsfoundation.org/opf-webinars-recordings
REM http://wiki.opf-labs.org/
REM 
REM to run this you'll need Python 2.7+ (won't yet work with Python 3+) and FIDO
REM http://www.openplanetsfoundation.org/software/fido
REM 
REM set python to where ever Python lives at your place (you'll need Python 2.7+ BTW)
REM set "x:\path\to\fido.py" to where ever FIDO lives at your place
SET FIDO=python x:\path\to\fido.py
REM write temporary file to %TEMP% (your temp dir according to your environment)
@echo >%TEMP%\fidotmp.txt
REM read *.* into %%i and echo each value into the temporary file
for %%i in (*.*) do echo %%i >>%TEMP%\fidotmp.txt
REM here we invoke FIDO
REM and use FIDOs printformat capability to format the output
REM for matched files (matchprintf) and non-matched files (nomatchprintf)
REM we redirect FIDOs results (STDOUT) to the temporary file
REM we redirect FIDOs error messages (STDERR) to "NUL" (which means "byteheaven" in Windows)
REM as stated in the webinar: to overcome the "maximum argument length" of 8191 bytes
REM in MSDOS, we use a file containing a list of filenames to FIDO
%FIDO% -matchprintf "%%(info.filename)s\t%%(info.puid)s\t%%(info.mimetype)s\t%%(info.matchtype)s-match\n" -nomatchprintf "%%(info.filename)s\tfmt/unknown\tmime/unknown\tfail-match\n" -input %TEMP%\fidotmp.txt 2>NUL
REM finally we delete the temporary file
del %TEMP%\fidotmp.txt

