## Neovim config using [lazy](https://github.com/folke/lazy.nvim) plugin manager
### Pre-requisites:
- [neovim](https://neovim.io/)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [fd](https://github.com/sharkdp/fd)
- [nodejs](https://nodejs.org)
- a C compiler (`gcc` or `llvm`) and libstdc++

#### *Extra requirements for Windows:*
- [scoop](https://scoop.sh/)
- [MS Visual Studio](https://visualstudio.microsoft.com/downloads/)
  - Windows 11 SDK
  - MSVC C++ x64/x86 build tools (latest)
- vcredist2022 *(can be installed via scoop)*
- rename the default nvim parser in `$HOME\scoop\apps\neovim\current\lib\nvim`

### Installation: 
- open Neovim by running `nvim` in a terminal
- exit Neovim
- clone this repo in `$HOME/.config/nvim` (`$HOME\AppData\Local\nvim` in Windows)
- rerun Neovim
- let the package manager finish the installations
- restart Neovim
