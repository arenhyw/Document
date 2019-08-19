for ip in {100,200}
do
ssh root@201.1.2.${ip} "install () {
cd lnmp_soft/
tar -xf nginx-1.15.8.tar.gz
cd nginx-1.15.8/
yum -y install pcre-devel openssl-devel gcc httpd-tools mariadb mariadb-server mariadb-devel php php-fpm php-mysql
./configure --user=nginx --group=nginx --with-http_ssl_module --with-stream --with-http_stub_status_module
make && make install
useradd nginx
ln -s /usr/local/nginx/sbin/nginx  /sbin/
nginx
}
install"
done

