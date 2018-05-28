
启动mysql：
cd /home/iddbs/mysql56
./bin/mysqld_safe --defaults-file=/home/iddbs/mysql56/my.cnf --user=iddbs&
   
停止mysql：                   
bin/mysqladmin --defaults-file=/home/iddbs/mysql56/my.cnf -uroot -proot shutdown
bin/mysqladmin --socket=/home/iddbs/mysql56/data3306/mysql.sock -uroot -proot shutdown

/bin/sh ./bin/mysqld_safe --defaults-file=/usr/etc/my.cnf --user=root &
