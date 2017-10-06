REM
REM Shell script to be called from Pentaho to validate XML against XSD
REM

set XSDPATH=D:\Metis\iati_xsd_definitions
set DATAPATH=D:\Metis\iati_working_dir

>%DATAPATH%\output.tmp xmllint --xpath string(//iati-activities/@version) "%DATAPATH%\activities.xml"

REM read version from temporary file and use it to set variable VERSION 
<%DATAPATH%\output.tmp (
  set /p VERSION=
)

REM use XMLLINT to validate the XML file
REM xmllint -schema "%XSDPATH%\%VERSION%\iati-activities-schema.xsd" "%DATAPATH%\activities.xml" --noout 2>&1
xmllint -schema "%XSDPATH%\%VERSION%\iati-activities-schema.xsd" "%DATAPATH%\activities.xml" --noout 2>&1
