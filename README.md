en tu $HOME

$ git clone https://github.com/lascar/dotvim.js .git

obtienes un archivo dotvim

$ rm -Rf ~/.vim ~/.vimrc

$ ln -s ~/dotvim/vimrc ~/.vimrc

$ cd ~/dotvim.js

$ git submodule init

$ git submodule update

to update each module

$ git submodule foreach git pull origin master

install a new module
$ git submodule add https://github.com/tpope/vim-haml.git bundle/vim-haml

$ git commit . -m "add vim-haml to the submodules"

$ git push -u origin master

remove a submodule (http://davidwalsh.name/git-remove-submodule)

Delete the relevant section from the .gitmodules file. 

$ git add .gitmodules

Delete the relevant section from .git/config

$ git rm --cached bundle/submodule

(no trailing slash)

$ rm -rf .git/modules/bundle/submodule

$ rm -rf bundle/submodule

use the function Str('somethings') in insert mode to insert :
console.log('somethings : ' + JSON.stringify(somethings));
in insert mode => <c-R>=Str('somethings')<enter>

cd bundle/vim-jsbeautify/
git submodule update --init --recursive

# para este repositorio
git submodule add https://github.com/scrooloose/nerdtree.git bundle/nerdtree
git submodule add git://github.com/tpope/vim-abolish.git bundle/vim-abolish
git submodule add git://github.com/tpope/vim-fugitive.git bundle/vim-fugitive
git submodule add https://github.com/pangloss/vim-javascript.git bundle/vim-javascript
git submodule add https://github.com/jelera/vim-javascript-syntax.git bundle/vim-javascript-syntax
git submodule add https://github.com/maksimr/vim-jsbeautify.git bundle/vim-jsbeautify
cd bundle/vim-jsbeautify/
git submodule update --init --recursive
vim .editorconfig
cd bundle/vim-jsbeautify/
./urchin test/vim
./urchin -f test/vim
cd ../..
git submodule foreach git pull origin master
