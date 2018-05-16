####证书生成
> openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /home/www/openssl/nginx.key -out /home/www/openssl/nginx.crt

####相关资料
1. https://segmentfault.com/t/openssl
2. https://blog.csdn.net/guestcode/article/details/50194357
