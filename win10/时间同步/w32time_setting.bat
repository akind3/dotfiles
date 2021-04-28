@Rem 开机运行
@echo off

@Rem ntp.ntsc.ac.cn --> 中科院国家授时中心ntp
w32tm /config /manualpeerlist:ntp.ntsc.ac.cn,0x8 /syncfromflags:MANUAL

@Rem 配置windows time 服务自动开启
sc config w32time start=auto 
net stop w32time 
net start w32time 

@Rem  wait 3 seconds
ping 129.0.0.1 -n 1 -w 3000 > nul

@Rem  time sync 
w32tm /resync

@Rem  wait 1 seconds
ping 129.0.0.1 -n 1 -w 1000 > nul

@Rem w32tm /query /source
@Rem w32tm /query /status
@Rem w32tm /query /peers