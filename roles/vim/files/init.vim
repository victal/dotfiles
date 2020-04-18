set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
runtime {{ ansible_os_family | lower }}.vim
source ~/.vimrc
