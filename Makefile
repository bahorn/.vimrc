.PHONY: init.vim

init.vim:
	find ./vim -type f | sort | xargs cat > init.vim

install: init.vim
	mkdir -p ~/.config/nvim/
	cp init.vim ~/.config/nvim/init.vim
