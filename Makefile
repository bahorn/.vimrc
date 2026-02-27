.PHONY: install

install:
	mkdir -p ~/.config/nvim/
	mkdir -p ~/.vim/tmp/
	cp init.lua ~/.config/nvim/init.lua
