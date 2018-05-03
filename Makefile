DOTFILESPATH := ~/dotfiles

.PHONY: install
install:
	ln -sfv $(DOTFILESPATH)/.bash_profile $(HOME)/.bash_profile
	ln -sfv $(DOTFILESPATH)/.vimrc $(HOME)/.vimrc
