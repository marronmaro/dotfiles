DOTFILESPATH := ~/dotfiles
DISTPATH := $(DOTFILESPATH)/dist

.PHONY: install
install:
	mkdir -p ~/.vim/dict
	mkdir -p $(DISTPATH)
	php -r '$$f=get_defined_functions();echo join("\n",$$f["internal"]);'|sort > $(HOME)/.vim/dict/php.dict
	ln -sfv $(DOTFILESPATH)/.bash_profile $(HOME)/.bash_profile
	ln -sfv $(DOTFILESPATH)/.vimrc $(HOME)/.vimrc
	git clone git@github.com:aereal/dotfiles.git $(DISTPATH)
