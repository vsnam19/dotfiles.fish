#!/bin/fish
function install
    if ! command -v $argv[1] >/dev/null 2>&1
        echo "Installing: $argv[1]..."
        if test (uname) = Linux
            sudo apt install -y $argv[1]
        else
            echo "Not supported install on $uname"
        end
    else
        echo "Already installed: $argv[1]"
    end
end

# install common packages
install wget
install git
install curl
install build-essential
install tmux
install vim
install tree
install python3-dev
install python3-venv
install python3-pip

for x in (find ./installs -type f -maxdepth 1)
    fish $x
end

if test (uname) = Linux
    # Get all upgrades
    sudo apt full-upgrade -y
    sudo apt autoremove -y
end
