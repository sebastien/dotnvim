# AGENTS.md - Developer Guidelines

## Build/Test Commands
- `make install` - Install Neovim configuration to ~/.config/nvim
- `make clean` - Remove pack directory
- `make deps` - Install language servers and tools (typescript, pyright, eslint_d, @biomejs/biome)
- No formal test suite - configuration is tested by installation and usage

## Code Structure
- VimL configuration files in `src/vim/`
- Lua files in `src/lua/` 
- Features loaded from `src/vim/init/features.list`
- Plugin configs in `src/vim/init/plugins/[plugin-name].conf.{vim,lua}`

## Naming Conventions
- VimL files use snake_case with `.vim` extension
- Lua files use snake_case with `.lua` extension  
- Plugin config files follow pattern: `[plugin-name].conf.{vim,lua}`
- Feature files in `init/features/` directory

## Code Style Guidelines
- Use tabs for indentation in VimL files
- Use 2-space indentation in Lua files
- VimL comments start with `"`
- Lua comments start with `--`
- Function names use lowercase with # separator (e.g., `plugins#init`)
- Global variables prefixed with `g:`
- Always use proper escaping with `fnameescape()` for file paths