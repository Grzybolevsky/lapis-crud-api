FROM alpine:latest

ENV TZ=Europe/Warsaw
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
ENV LUA_VERSION 5.3

RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk update
RUN apk upgrade
RUN apk add openssl openssl-dev build-base openresty openrc

RUN apk add luarocks lua${LUA_VERSION} lua${LUA_VERSION}-dev luajit
RUN ln -s /usr/bin/luarocks-${LUA_VERSION} /usr/bin/luarocks
RUN ln -s /usr/bin/lua${LUA_VERSION} /usr/bin/lua

RUN luarocks install lua-cjson 2.1.0-1
RUN luarocks install moonscript
RUN luarocks install lapis
ENV LUA_PATH=/usr/local/share/lua/${LUA_VERSION}/?.lua;/usr/local/share/lua/${LUA_VERSION}/?/init.lua;/usr/local/lib/lua/${LUA_VERSION}/?.lua;/usr/local/lib/lua/${LUA_VERSION}/?/init.lua;/usr/share/lua/${LUA_VERSION}/?.lua;/usr/share/lua/${LUA_VERSION}/?/init.lua;/usr/lib/lua/${LUA_VERSION}/?.lua;/usr/lib/lua/${LUA_VERSION}/?/init.lua;/usr/share/lua/common/?.lua;/usr/share/lua/common/?/init.lua;./?.lua;./?/init.lua
ENV LUA_CPATH=/usr/local/lib/lua/${LUA_VERSION}/?.so;/usr/local/lib/lua/${LUA_VERSION}/loadall.so;/usr/lib/lua/${LUA_VERSION}/?.so;/usr/lib/lua/${LUA_VERSION}/loadall.so;./?.so

RUN adduser -D -g 'Nginx www user' -h /home/www/ wwwcbz
#RUN rc-update add nginx default

EXPOSE 8080
COPY . /app/
WORKDIR /app/
#ENTRYPOINT [ "lapis", "server" ]
