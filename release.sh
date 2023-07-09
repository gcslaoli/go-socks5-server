#!/bin/bash
set -e
docker build -t cnlidong/go-socks5-server .

docker push cnlidong/go-socks5-server