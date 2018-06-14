SOURCES_FEATURES=$(wildcard init.features.*.vim)
SOURCES_FEATURE_LIST=init.features.list
SOURCES_PLUGINS_LIST=init.plugins.list
BUILD_FEATURE_MD=$(SOURCES_FEATURES:%.vim=%.md)


all:
	@echo $(BUILD_FEATURE_MD)

%.md: %.vim
	# TODO: 1) Split the file using '{{{' and '}}}'
	#       2) For each line with the range, remove the leading '" '
	#       3) Output the result in an .md file (documentation)
	#       4) Look for @command, @keymap
# EOF
