#!/usr/bin/env bash
tar -xvf openresty-1.19.9.1.tar.gz
cd openresty-1.19.9.1/ || exit
./configure -j2 --with-http_postgres_module
make -j2
sudo make install