# dotfiles

//////////////////////////////////////////////////////////////////////////////////////////////////
// linux: backup and sync dotfiles with github                                                  //
// inspired from:                                                                               //
//     http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/  //
//////////////////////////////////////////////////////////////////////////////////////////////////

Assumption: no repo is set up yet
-----------
1) create a folder for all the dot-files
   $ mkdir ~/dotfiles
2) move the dot-files to that folder
   $ mv ~/.vimrc/ ~/dotfiles/.vimrc
3) create symlink from home directory to dotfiles directory
   $ ln -s ~/dotfiles/.vimrc ~/.vimrc
4) go into dot-files folder
   $ cd ~/dotfiles

5) if not done, set-up git
   $ git config --global user.name "USERNAME"
   $ git config --global user.email "EMAILADDRESS"

5) make it a local git repo
   $ git init
6) add all files in current folder to local git repo
   $ git add
   or, specifically tell which files should be added
   $ git add .vimrc
   $ git add makemydotfiles.sh 
7) commit all added files to new local git repo
   $ git commit -m 'Initial commit of my dotfiles'
8) hook up our local git repo with the GitHub repo
   $ git remote add origin https://github.com/aalemann/dotfiles.git
9) push our files to the remote (GitHub) repo
   $ git push origin master

Assumption: repo at github is set up already, change in dotfiles to be uploaded
-----------
1) add the file which has changed
   $ git add .vimrc
2) commit locally, write a commit message
   $ git commit -m 'Changed vim colorscheme!'
3) push to GitHub
   $ git push origin master

Assumption: repo at github is set up already, updated dotfiles to be downloaded
-----------
1) pull updates from GitHub to local repo
   $ git pull origin master

Assumption: repo at github is set up already, new PC is set up
-----------
1) go to home folder
   $ cd ~
2) clone remote GitHub repo to local
   $ git clone https://github.com/<yourgithubuserrname>/dotfiles.git
3) make install script executable
   $ chmod +x makemydotfiles.sh
3) run install script
   $ ./makemydotfiles.sh

Assumption: repo at github is set up, repo has been cloned to local PC, changes to be uploaded
-----------
1) set-up local account if global account is a different one (e.g. for work)
   $ git config user.email <email-address>
   $ git config user.name "<github-username>"
2) add file which has been changed
   $ git add <file>
3) commit locally, write a commit message
   $ git commit -m 'Changed vim colorscheme!'
4) push to GitHub
   $ git push origin master

