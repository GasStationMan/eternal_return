@echo off
chcp 65001
java -Xms8G -Xmx8G -XX:+UnlockDiagnosticVMOptions -XX:+UseG1GC -XX:MaxGCPauseMillis=50 -XX:+AlwaysPreTouch -XX:ReservedCodeCacheSize=512M -jar spigot.jar 
pause
