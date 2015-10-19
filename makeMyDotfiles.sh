#!/bin/bash

# Variables
dir=~/dotfiles                  # dotfiles directory
olddir=~/dotfiles_old           # old dotfiles backup directory
files=".screenrc .vimrc"        # list of files/folders to symlink in homedir

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
echo "Moving any existing dotfiles from ~ to $olddir and creating symlink to files in dotfiles-folder in ~ ..."
for file in $files; do
#    echo "~/$file $olddir/"
#    echo "$dir/$file ~/$file"
    mv ~/$file $olddir/
    ln -s $dir/$file ~/$file
done
echo "...done"
