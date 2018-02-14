#!/bin/bash 

PROXY_ADDR="127.0.0.1:8118"
PROXY_TYPE="http"

url="https://www.z5web.tk/gfwlist.txt"

curl -O $url
file=$(echo $url |awk -F "/" '{print $NF}')
cat $file |base64 -d > ${file%.*}_decode
file=${file%.*}_decode
./autoproxy2privoxy $file > gfw.action
