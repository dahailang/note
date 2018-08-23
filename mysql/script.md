源码安装初始化mysql
scripts/mysql_install_db --defaults-file=/mysql/my.cnf --user=mysql

安全模式进入：
/bin/sh /mysql/bin/mysqld_safe --user=mysql --skip-grant-tables --skip-networking &

启动mysql：
/bin/sh /mysql/bin/mysqld_safe  --defaults-file=/mysql/my.cnf --user=mysql &
   
停止mysql：                   
bin/mysqladmin --defaults-file=/home/iddbs/mysql56/my.cnf -uroot -proot shutdown
bin/mysqladmin --socket=/home/iddbs/mysql56/data3306/mysql.sock -uroot -proot shutdown

/bin/sh ./bin/mysqld_safe --defaults-file=/usr/etc/my.cnf --user=root &
