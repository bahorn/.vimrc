.PHONY: init.vim

init.vim:
	find ./vim -type f | sort | xargs cat > init.vim

install: init.vim
	mkdir -p ~/.config/nvim/
	mkdir -p ~/.vim/tmp/
	cp init.vim ~/.config/nvim/init.vim
	vim +PlugInstall +PlugUpdate +UpdateRemotePlugins +qa
	# LSPs we want
	vim +"LspInstall clangd eslint bashls vimls ltex" +qa
