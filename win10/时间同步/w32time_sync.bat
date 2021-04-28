@Rem 每10分钟运行一次 
@echo off

net start w32time 
@Rem  wait 1 seconds
ping 129.0.0.1 -n 1 -w 1000 > nul

w32tm /resync 
@Rem  wait 1 seconds
ping 129.0.0.1 -n 1 -w 1000 > nul


@Rem pause
@Rem w32tm /query /source
@Rem w32tm /query /status
@Rem w32tm /query /peers