#!/bin/bash

# This program is a fast way of setting up for the first time
# a clean install of vim along with a custom .vimrc file and
# with various plugins. It will install git, vim-gtk,
# pathogen, .vimrc, and a number of plugins. All these can be
# adjusted in the config() function below.

# Variable values in the config() function can be adjusted
# or modified to fit specific needs.
config()
{
    VIMRC="$HOME/.vimrc"
    VIMRC_TMP="$HOME/vimrc.tmp"
    VIMRC_BKUP="$HOME/vimrc.backup"
    VIMRC_URL="https://raw.githubusercontent.com/hadriann/utils/master/vimrc"

    DOTVIM="$HOME/.vim"

    PATHOGEN_URL="https://tpo.pe/pathogen.vim"

    PLUGIN_REPOS=(
        "git://github.com/altercation/vim-colors-solarized.git"
        "git@github.com:kien/ctrlp.vim.git"
    )
}

main()
{
    if confirm
    then
        install_git && \
        install_vim && \
        setup_pathogen && \
        setup_vimrc && \
        setup_plugins && \
        echo "Done. All set up." || \
        echo "An error has occurred."
    else
        echo "Bye."
        exit 0
    fi
}

confirm()
{
    echo "This script will:"
    echo -e "\t- install git"
    echo -e "\t- install vim"
    echo -e "\t- set up $HOME/.vimrc"
    echo -e "\t- install pathogen in $HOME/.vim"
    echo -e "\t- clone plugins and colorschemes"

    read -p "Do you agree? (Y/n) " -n1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        true
    else
        false
    fi
}

install_git()
{
    echo "Getting git..."
    sudo apt-get install git -y -qq && echo "git: OK"
}

install_vim()
{
    echo "Getting vim-gtk..."
    sudo apt-get install vim-gtk -y -qq && echo "gvim: OK"
}

setup_pathogen()
{
    echo "Getting pathogen..."
    mkdir -p "$DOTVIM/autoload" && \
    mkdir -p "$DOTVIM/bundle" && \
    wget -q "$PATHOGEN_URL" -O "$DOTVIM/autoload/pathogen.vim" && \
    echo "pathogen: OK"
}

setup_vimrc()
{
    echo "Setting up vimrc..."
    wget -q "$VIMRC_URL" -O "$VIMRC_TMP" || exit 1
    if [ -f "$VIMRC" ];
    then
        mv "$VIMRC" "$VIMRC_BKUP" && echo "Saved your current .vimrc in $VIMRC_BKUP"
    fi
    mv "$VIMRC_TMP" "$VIMRC" && echo "$VIMRC is set up"
}

setup_plugins()
{
    echo "Cloning plugins in $DOTVIM/bundle..."
    cd "$DOTVIM/bundle" || exit 1
    for repo in "${PLUGIN_REPOS[@]}"
    do
        git clone "$repo" -q
    done
}

config
main
