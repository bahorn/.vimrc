.PHONY: install

install:
	mkdir -p ~/.config/nvim/
	mkdir -p ~/.vim/tmp/ ~/.vim/undo/
	cp init.lua ~/.config/nvim/init.lua
