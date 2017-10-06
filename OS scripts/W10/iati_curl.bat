REM
REM Shell script to be called from Pentaho to retrive XML from the internet
REM

set DATAPATH=D:\Metis\iati_working_dir
set IATIURL="%1"

REM use CURL to rerieve data the internet

curl -L %IATIURL%  --fail --silent --show-error -o "%DATAPATH%\activities.xml" 
