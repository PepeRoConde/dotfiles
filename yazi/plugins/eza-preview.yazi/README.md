# eza-preview.yazi

[Yazi](https://github.com/sxyazi/yazi) plugin to preview directories using [eza](https://github.com/eza-community/eza), can be switched between list and tree modes.

List mode:
![list.png](list.png)

Tree mode:
![tree.png](tree.png)

## Requirements

- [yazi](https://github.com/sxyazi/yazi)
- [eza](https://github.com/eza-community/eza)

## Installation

### Linux/MacOS

```sh
ya pack -a PepeRoConde/eza-preview
```

## Usage

Add `eza-preview` to previewers in `yazi.toml`:

```toml
prepend_previewers = [
	{ name = "*/", run = "eza-preview" },
]
```

Set key binding to switch between list and tree modes in `keymap.toml`:

```toml
[manager]
keymap = [
	{ on = [ "E" ], run = "plugin eza-preview",  desc = "Toggle tree/list dir preview" },
    { on = [ "-" ], run = "plugin eza-preview inc_level", desc = "Increment tree level" },
    { on = [ "_" ], run = "plugin eza-preview dec_level", desc = "Decrement tree level" },
    { on = [ "$" ], run = "plugin eza-preview toggle_follow_symlinks", desc = "Toggle tree follow symlinks" },
]
```

List mode is the default, if you want to have tree mode instead when starting yazi - update `yazi.lua` with:

```lua
require("eza-preview"):setup()
```
