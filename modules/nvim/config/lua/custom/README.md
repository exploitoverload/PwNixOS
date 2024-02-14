# NvChad custom configuration

This NvChad custom configuration is used by
[Lazyman](https://github.com/doctorfree/nvim-lazyman) as the custom add-on for
[NvChad](https://github.com/NvChad/NvChad).

Installation and initialization are performed by the `lazyman -c` command.

## Features

- Automated installation of language servers, formatters, linters, and parsers
- Advanced LSP configuration with diagnostics and convenience keymaps
- Automated installation and initialization with `lazyman -c` command
- NvChad dashboard ([nvdash](https://github.com/NvChad/ui)) enhancements
  - Hide statusline and tabline when in dashboard
  - Random dashboard header selection
  - Customized menu
- Set mapleader and maplocalleader to `comma` rather than `space`
- Convenience keymap `semi-colon` enters command mode
- Jump anywhere in a document with a few keystrokes using [Hop](https://github.com/phaazon/hop.nvim)
- Replace [nvterm](https://github.com/NvChad/nvterm) with [terminal.nvim](https://github.com/rebelot/terminal.nvim)
- Preconfigured autocmds and keymaps for easy execution of terminal and editor commands

## Command keymaps

| **Command** | **Keymap** | **Description**       |
| ----------- | ---------- | --------------------- |
| Lazy        | `,P`       | Lazy plugin manager   |
| Mason       | `,M`       | Mason package manager |
| Htop        | `,H`       | Htop system monitor   |
| Lazygit     | `,G`       | Lazygit command       |
| Lazyman     | `,L`       | Lazyman main menu     |
| Lazyconf    | `,C`       | Lazyman configuration |

## Convenience keymaps

| **Keymap** | **Description**                |
| ---------- | ------------------------------ |
| `,tt`      | Toggle theme                   |
| `,tT`      | Toggle transparency            |
| `,cs`      | Symbols outline                |
| `,de`      | Open floating diagnostic       |
| `,dt`      | Toggle diagnostics             |
| `,dq`      | Set diagnostics location list  |
| `,ts`      | Terminal send                  |
| `,to`      | Terminal toggle                |
| `,tO`      | New Terminal toggle            |
| `,tr`      | Terminal run                   |
| `,tR`      | New Terminal run               |
| `,tk`      | Terminal kill                  |
| `,t]`      | Terminal next                  |
| `,t[`      | Terminal prev                  |
| `,tl`      | Terminal move below right      |
| `,tL`      | Terminal move bottom right     |
| `,th`      | Terminal move below right new  |
| `,tH`      | Terminal move bottom right new |
| `,tf`      | Terminal move float            |
| `,q`       | Quit                           |


## Hop keymaps

| **Keymap** | **Description**                                    |
| ---------- | -------------------------------------------------- |
| `f`        | Character after cursor, current line only          |
| `F`        | Character before cursor, current line only         |
| `t`        | Character after cursor, current line only, before  |
| `T`        | Character before cursor, current line only, before |
| `,hw`      | HopWord                                            |
| `,hl`      | HopLineStart                                       |
| `,hW`      | HopWordMW                                          |
| `,hH`      | Hop hint pattern `[[\\d\\+]]`                      |
| `,hf'`     | Hop hint pattern <code>\[[\"\\&#124;']]</code>     |
| `,hf-`     | Hop hint pattern <code>\[[-\\&#124;+]]</code>      |
| `,hf;`     | Hop hint pattern <code>\[[;\\&#124;:]]</code>      |
| `,hf/`     | Hop hint pattern <code>\[[/\\&#124;?]]</code>      |
| `,hqj`     | Hop hint pattern `[[(]]`                           |
| `,hqk`     | Hop hint pattern `[[)]]`                           |
| `,hq[`     | Hop hint pattern `[[{]]`                           |
| `,hq]`     | Hop hint pattern `[[}]]`                           |
| `,hd`      | Jump to definition                                 |
| `yx`       | Hyper Yank with Treesitter Node Select             |
| `yl`       | Hyper Yank a line                                  |
| `yc`       | Hyper Yank Treesitter code block                   |
| `ym`       | Using Treehopper to yank                           |
| `vp`       | Using Hop to paste                                 |
| `,vp`      | New line below target and paste                    |
| `vP`       | Using Hop to paste                                 |
| `,vP`      | New line above target and paste                    |
| `vo`       | Using Hop to open a new line below target          |
| `,vo`      | Insert below target                                |
| `vO`       | Using Hop to open a new line above target          |
| `,vO`      | Insert above target                                |
| `vy`       | Normal insert Treehopper node                      |
| `vY`       | Using Hop with macros, HopLineStart normal         |
| `Ls`       | Trigger LuaSnip snippet                            |
| `,hm`      | Treehopper nodes                                   |
| `,h[`      | Move to start of Treehopper node                   |
| `,h]`      | Move to end of Treehopper node                     |
