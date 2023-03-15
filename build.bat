@echo off
echo Build Windows...
go build -ldflags="-w -s" -o build\gredis_aide-Windows.exe main.go
echo Build Windows Successfully!

echo Build Linux...
set CGO_ENABLED=0
set GOOS=linux
set GOARCH=amd64
go build -ldflags="-w -s" -o build\gredis_aide-Mac main.go
echo Build Linux Successfully!


echo Build Mac...
set CGO_ENABLED=0
set GOOS=darwin
set GOARCH=amd64
go build -ldflags="-w -s" -o build\gredis_aide-Linux main.go
echo Build Mac Successfully!

pause