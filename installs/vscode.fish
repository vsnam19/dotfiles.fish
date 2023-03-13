#!/bin/fish
echo "Install VS Code..."

switch (uname)
    case Linux
        sudo apt-get install wget gpg
        wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
        sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
        sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
        rm -f packages.microsoft.gpg

        sudo apt install apt-transport-https
        sudo apt update
        sudo apt install code
    case Darwin
        brew install wget gpg
        wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
        sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
        sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
        rm -f packages.microsoft.gpg

        brew install apt-transport-https
        brew update
        brew install code
    case '*'
        echo "Can not detect OS system"
end

function install_ext
    set name $argv[1]
    code --install-extension $name --force
end


# install extension
install_ext bierner.markdown-preview-github-styles
install_ext byi8220.indented-block-highlighting
install_ext davidanson.vscode-markdownlint
install_ext foxundermoon.shell-format
install_ext golang.go
install_ext hookyqr.beautify
install_ext joaompinto.vscode-graphviz
install_ext killalau.vscode-liquid-snippets
install_ext ms-python.python
install_ext redhat.vscode-yaml
install_ext vscode-icons-team.vscode-icons
install_ext yzhang.markdown-all-in-one
install_ext TabNine.tabnine-vscode
install_ext ms-vscode.cpptools
install_ext ms-vscode.cpptools-themes
install_ext ms-vscode.cpptools-extension-pack
install_ext mikestead.dotenv
install_ext donjayamanne.githistory
install_ext christian-kohler.path-intellisense
install_ext cschlosser.doxdocgen
