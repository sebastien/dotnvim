# SEE: https://raygervais.dev/articles/2021/3/neovim-lsp/
SOURCES_FEATURES=$(wildcard init.features.*.vim)
SOURCES_FEATURE_LIST=init.features.list
SOURCES_PLUGINS_LIST=init.plugins.list
BUILD_FEATURE_MD=$(SOURCES_FEATURES:%.vim=%.md)

install:
	ln -sfr src/vim ~/.config/nvim

all:
	@echo $(BUILD_FEATURE_MD)

deps:
	npm install -g diagnostic-languageserver
	npm install -g typescript typescript-language-server
	npm install -g eslint_d prettier
	npm install -g pyright

%.md: %.vim
	# TODO: 1) Split the file using '{{{' and '}}}'
	#       2) For each line with the range, remove the leading '" '
	#       3) Output the result in an .md file (documentation)
	#       4) Look for @command, @keymap
# EOF
