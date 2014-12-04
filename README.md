git clone https://github.com/lsword/vimrc.git ~/

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

go get -u github.com/nsf/gocode

go get -u github.com/jstemmer/gotags

sudo apt-get install ctags

cp -r $GOROOT/misc/vim/* ~/.vim/

start vi

:BundleInstall

exit vi

cp -r ~/.vim/bundle/vim-colorschemes/colors ~/.vim

start vi
