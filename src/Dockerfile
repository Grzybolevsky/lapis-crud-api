FROM ubuntu:latest

ENV TZ=Europe/Warsaw
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ENV LUA_VERSION 5.1

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install wget gnupg ca-certificates libssl-dev curl
RUN wget -O - https://openresty.org/package/pubkey.gpg | apt-key add -
RUN echo "deb http://openresty.org/package/ubuntu focal main" | tee /etc/apt/sources.list.d/openresty.list
RUN apt-get update
RUN apt-get -y install openresty
RUN apt-get -y install lua${LUA_VERSION} liblua${LUA_VERSION}-dev luarocks luajit tup
RUN apt-get clean all
RUN luarocks install lua-cjson 2.1.0-1
RUN luarocks install moonscript
RUN luarocks install lapis
ENV LUA_PATH=/usr/local/share/lua/${LUA_VERSION}/?.lua;/usr/local/share/lua/${LUA_VERSION}/?/init.lua;/usr/local/lib/lua/${LUA_VERSION}/?.lua;/usr/local/lib/lua/${LUA_VERSION}/?/init.lua;/usr/share/lua/${LUA_VERSION}/?.lua;/usr/share/lua/${LUA_VERSION}/?/init.lua;/usr/lib/lua/${LUA_VERSION}/?.lua;/usr/lib/lua/${LUA_VERSION}/?/init.lua;/usr/share/lua/common/?.lua;/usr/share/lua/common/?/init.lua;./?.lua;./?/init.lua
ENV LUA_CPATH=/usr/local/lib/lua/${LUA_VERSION}/?.so;/usr/local/lib/lua/${LUA_VERSION}/loadall.so;/usr/lib/lua/${LUA_VERSION}/?.so;/usr/lib/lua/${LUA_VERSION}/loadall.so;./?.so

EXPOSE 8080
COPY . /app/
WORKDIR /app/
#ENTRYPOINT [ "lapis", "server" ]
