# open-github-url.nvim

**open-github-url.nvim** is a Neovim plugin to open the abbreviated GitHub repository URL under the cursor in your browser.

## Installation

Using [vim-plug](https://github.com/junegunn/vim-plug)

```viml
Plug 'tetzng/open-github-url.nvim'
```

Using [dein](https://github.com/Shougo/dein.vim)

```viml
call dein#add('tetzng/open-github-url.nvim')
```

Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use 'tetzng/open-github-url.nvim'
```

## Features

- Open GitHub repository URL with the repository path under the cursor
- Get the repository path detected under the cursor
- Open a specific URL in the default web browser

## Usage

Open a GitHub URL under the cursor:
`:OpenGitHubUrlUnderCursor`
This command opens the GitHub repository URL with the repository path under the cursor.

Get the repository path under the cursor:
`:GetRepoPathUnderCursor`
This command prints the repository path detected under the cursor.

Open a specific URL:
`:OpenUrl https://github.com/user/repo`
This command opens the given URL in the default web browser.

## Setup

To set up the plugin, simply call its `setup()` function, typically in your `init.lua` configuration file:
```lua
require('open-github-url').setup()
```
This will create the user commands described in the usage section.
