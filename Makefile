
version = 1.1

build: bin
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build  -o bin/gredis_aide_linux_amd64
build-mac:
	GOOS=darwin GOARCH=amd64 go build  -o bin/gredis_aide_darwin_amd64
build-windows:
	GOOS=windows GOARCH=amd64 go build  -o bin/gredis_aide_windows_amd64
clean:
	rm -rf ./bin/gredis_aide*
bin:
	mkdir ./bin




