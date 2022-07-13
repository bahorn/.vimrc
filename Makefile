.PHONY: init.vim

init.vim:
	find ./vim -type f | sort | xargs cat > init.vim

install: init.vim
	mkdir -p ~/.config/nvim/
	cp init.vim ~/.config/nvim/init.vim
	vim +PlugInstall +PlugUpdate +UpdateRemotePlugins +qa
	# LSPs we want
	vim +"LspInstall pylsp clangd" +qa
	# PyLSP extras
	vim +"PylspInstall pylsp-mypy pyls-isort" +qa
