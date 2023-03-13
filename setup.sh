#!/bin/bash
if [[ "$OSTYPE" -eq 'Linux' ]]; then
    sudo apt-get install fish

    # Add fish shell to supported shell
    echo /usr/local/bin/fish | sudo tee -a /etc/shells

    # Set fish as default shell
    sudo chsh -s /usr/bin/fish

    fish copy.fish
    fish install.fish
fi