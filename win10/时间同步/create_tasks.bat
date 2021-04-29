@Rem 创建 w32tm 服务配置的定时任务
@Rem schtasks /create /sc onlogon /rl highest /ru system /tn "windows_time_service_setting" /tr c:\w32time_setting.bat
schtasks /create /sc onlogon /ru system /tn "windows_time_service_setting" /tr c:\w32time_setting.bat
echo "task windows_time_service_setting created..."

@Rem  wait 3 seconds
ping 129.0.0.1 -n 1 -w 3000 > nul


@Rem 创建 w32tm /resync 定时任务
@Rem schtasks /create /sc minute /mo 2 /rl highest /ru system /tn "windows_time_sync" /tr c:\w32time_sync.bat 
schtasks /create /sc minute /mo 2 /ru system /tn "windows_time_sync" /tr c:\w32time_sync.bat 
echo "task windws_time_sync created..."


@Rem pause