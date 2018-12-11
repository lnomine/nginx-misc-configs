#!/usr/bin/env bash
# Tested with Ubuntu 18.04 LTS

apt update
apt install build-essential nginx-light libpcre3-dev libssl-dev zlib1g-dev -y
./configure --with-cc-opt='-g -O2 -fdebug-prefix-map=/build/nginx-mcUg8N/nginx-1.14.0=. -fstack-protector-strong -Wformat -Werror=format-security -fPIC -Wdate-time -D_FORTIFY_SOURCE=2' --with-ld-opt='-Wl,-Bsymbolic-functions -Wl,-z,relro -Wl,-z,now -fPIC' --prefix=/usr/share/nginx --conf-path=/etc/nginx/nginx.conf --http-log-path=/var/log/nginx/access.log --error-log-path=/var/log/nginx/error.log --lock-path=/var/lock/nginx.lock --pid-path=/run/nginx.pid --modules-path=/usr/lib/nginx/modules --http-client-body-temp-path=/var/lib/nginx/body --http-fastcgi-temp-path=/var/lib/nginx/fastcgi --http-proxy-temp-path=/var/lib/nginx/proxy --http-scgi-temp-path=/var/lib/nginx/scgi --http-uwsgi-temp-path=/var/lib/nginx/uwsgi --with-debug --with-pcre-jit --with-http_ssl_module --with-http_stub_status_module --with-http_realip_module --with-http_auth_request_module --with-http_v2_module --with-http_dav_module --with-http_slice_module --with-threads --with-http_gzip_static_module --without-http_browser_module --without-http_geo_module --without-http_limit_req_module --without-http_limit_conn_module --without-http_memcached_module --without-http_referer_module --without-http_split_clients_module --without-http_userid_module --add-dynamic-module=/tmp/nginx-1.14.0/devel-kit --add-dynamic-module=/tmp/nginx-1.14.0/misc-nginx
make -j2
make install
