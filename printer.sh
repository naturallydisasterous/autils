#!/bin/bash

# 0 = true 1 = false
connection-established = 1

sudo_check()
{
    # NEEDED
}

network_check()
{
    echo "Pinging https://google.com"
    echo -2 "GET https://google.com HTTP/1.0\n\n | nc google.com 80 > /dev/null 2>&1
    
    if [ $? -eq 0 ]; then
        echo "$(tput setaf 3)Network check successful.$(tput setaf 7)"
        # update to 'true' so that this check only has to happen once (if ever)
        connection-established = 0
    else
        echo "$(tput setaf 1)ERROR: offline.$(tput setaf 7)"
        exit 1
}

install_dependency(package)
{
    #TODO: if connection-established = false then check
    
    pacman -Syy --needed ${!package}
}

install_paru()
{
    #TODO: if connection-established = false then check
    
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
    cd ..
}

dependency_check()
{
    # DEPENDENCIES:
    official=(
        git
        base-devel
        cups
        cups-pdf
    )
}
