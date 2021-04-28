@Rem 创建 w32tm 服务配置的定时任务
schtasks /create /sc onstart /rl highest /tn "windows_time_service_setting" /tr c:\w32time_setting.bat
echo "task windows_time_service_setting created..."

@Rem  wait 3 seconds
ping 129.0.0.1 -n 1 -w 3000 > nul


@Rem 创建 w32tm /resync 定时任务
schtasks /create /sc minute /mo 30 /rl highest /tn "windows_time_sync" /tr c:\w32time_sync.bat 
echo "task windws_time_sync created..."


@Rem pause