## jross.nvim
Pre-requisites for Windows:
- [scoop](https://scoop.sh/)
- [MS Visual Studio](https://visualstudio.microsoft.com/downloads/)
  - Windows 11 SDK
  - MSVC C++ x64/x86 build tools (latest)

Installation: 
- install the following packages using scoop:
  ```
  llvm
  ripgrep
  vcredist2022 (Optional)
  fd (Optional)
  neovim
  ```
- open Neovim by running `nvim` in a terminal
- exit Neovim
- rename the default nvim parser in `$HOME\scoop\apps\neovim\current\lib\nvim`
- clone this repo to `$HOME\AppData\Local\nvim`
- rerun Neovim
- let the package manager finish the installations
- restart Neovim
