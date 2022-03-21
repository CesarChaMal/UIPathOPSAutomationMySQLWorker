rem @ECHO OFF
@ECHO ON
cd docker-mysql
terraform init && terraform apply -auto-approve
terraform show
@echo off
for /f "usebackq tokens=3 delims=: " %%i  in (`netsh interface ip show config name^="vEthernet (New Virtual Switch)" ^| findstr "IP Address" ^| findstr [0-9]`) do set IP=%%i
rem echo %IP%
rem docker run -i mysql mysql -h192.168.0.234 -uroot -pmysql < "C:\IdeaProjects\UIPathOPSAutomationMySQLWorker\docker-mysql\script\configurator.sql"
docker run -i mysql mysql -h%IP% -uroot -pmysql < "C:\IdeaProjects\UIPathOPSAutomationMySQLWorker\docker-mysql\script\configurator.sql"
PAUSE
exit
