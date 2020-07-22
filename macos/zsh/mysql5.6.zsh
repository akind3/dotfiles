# To have launchd start mysql@5.6 now and restart at login:
#   brew services start mysql@5.6
# Or, if you don't want/need a background service you can just run:
#   /usr/local/opt/mysql@5.6/bin/mysql.server start
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/mysql@5.6/lib"
export CPPFLAGS="-I/usr/local/opt/mysql@5.6/include"

