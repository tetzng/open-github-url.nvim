# open-github-url.nvim

**open-github-url.nvim** is a Neovim plugin to open the abbreviated GitHub
repository URL under the cursor in your browser.

## Installation

[lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "tetzng/open-github-url.nvim",

  -- recommended
  keys = {
    {
      "<leader>gh",
      "<cmd>OpenGitHubUrlUnderCursor<cr>",
      desc = "Open GitHub URL under cursor",
    },
  },
}
```

## Features

- Open GitHub repository URL with the repository path under the cursor
  - e.g. `"owner/repo"`
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
