git clone https:https://github.com/lsword/vimrc.git ~/

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

go get -u github.com/nsf/gocode

go get -u github.com/jstemmer/gotags

cp -r $GOROOT/misc/vim/* ~/.vim/

start vi

:BundleInstall

restart vi
