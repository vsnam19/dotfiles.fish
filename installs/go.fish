#!/bin/fish
echo "Install golang..."
curl -LO https://get.golang.org/(uname)/go_installer
chmod +x go_installer
./go_installer
rm go_installer
go --version