@ECHO OFF
set tmpConfFilePath="%CD%\temporary_java.security"
set ipmiViewPath="C:\Program Files\SUPERMICRO\IPMIView"
set /p ipmiViewPath=Enter path to ipmi view installation (Or leave empty for default path "C:\Program Files\SUPERMICRO\IPMIView"): 
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/iTeeLion/ipmiview_secfix/main/java.security', 'temporary_java.security')"
echo F|xcopy /Y /F "%ipmiViewPath%\jre\conf\security\java.security" "%ipmiViewPath%\jre\conf\security\java.security.bckp"
echo F|xcopy /Y /F "%ipmiViewPath%\jre8\lib\security\java.security" "%ipmiViewPath%\jre8\lib\security\java.security.bckp"
echo F|xcopy /Y /F "%tmpConfFilePath%" "%ipmiViewPath%\jre\conf\security\java.security"
echo F|xcopy /Y /F "%tmpConfFilePath%" "%ipmiViewPath%\jre8\lib\security\java.security"
erase %tmpConfFilePath%
pause
