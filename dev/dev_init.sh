#!/bin/bash

function yn_prompt {
    local prompt=$1

    while true; do
        read -p "$prompt" yn
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo "Please answer yes/no";;
        esac
    done
}

echo "Initializing the Containership development environment..."

if ! type "brew" > /dev/null; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew install git
brew install hub

containership_dir=$(pwd)
yn_prompt "Would you like to initialize the dev environment in this directory? ($containership_dir) [y/n] "

if [ ! $? -eq 0 ]; then
    read -ep "Where would you like to set up the Containership development environment?`echo $'\n> '`" containership_dir
fi

echo "Forking and cloning repositories into: [$containership_dir]"
cd $containership_dir

read -p "What is your github username? " github_user
while ! yn_prompt "Is [$github_user] correct? [yes/no] "; do
    read -p "What is your github username?" github_user
done

containership_repos=(
    "containership"
    "containership.analytics"
    "containership.api"
    "containership.cli"
    "containership.core"
    "containership.scheduler"
    "codexd"
    "ohai-data"
    "myriad-kv"
    "legiond"
    "praetor"
)

for repo in ${containership_repos[@]}; do
    if [ ! -d "$repo" ]; then
        echo "Cloning $repo from containership..."
        git clone git@github.com:containership/$repo.git
    fi

    echo "Forking (if not already forked) and adding remote..."
    cd $repo
    if ! git remote -v | grep $github_user > /dev/null; then
        hub fork
    fi

    npm install
    cd ..
done

for repo in ${containership_repos[@]}; do
    cd $repo/node_modules

    echo "Attempting to symlink all modules inside: $repo..."

    for repo in ${containership_repos[@]}; do
        if [ -d $repo ]; then
            echo "Symlinking $repo -> ../../$repo"
            rm -rf $repo
            ln -sF ../../$repo $repo
        fi
    done

    cd ../../
done
