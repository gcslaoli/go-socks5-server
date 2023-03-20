package main

import (
	"github.com/armon/go-socks5"
	"github.com/gcslaoli/go-socks5-server/httpproxy"
)

func main() {
	// start http proxy
	go httpproxy.StartProxy()

	conf := &socks5.Config{}
	server, err := socks5.New(conf)
	if err != nil {
		panic(err)
	}

	// Create SOCKS5 proxy on localhost port 8000
	if err := server.ListenAndServe("tcp", "127.0.0.1:8000"); err != nil {
		panic(err)
	}
}
