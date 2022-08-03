<div align="center">

# azureutils.nvim
##### A collection of Azure utils for Neovim
</div>

## Utils
There's currently only 1 util - `open_file_in_azure()`. If you have any ideas, feel free to raise an issue or PR.

- `open_file_in_azure()`: Use the current buffer and curser position, pop open the browser and locate the file in the Azure UI
- ...

## Install
```lua
-- Using Packer
use "interludedesign/azureutils.nvim"

-- Using Plug
Plug "interludedesign/azureutils.nvim"
```

## Setup
Pass in the Azure git base url, and a list of possible git repo names to `setup()`:

```lua
-- init.lua
require("azureutils").setup(
	"https://tfs.acmeco.com/AcmeCoCollection/MyAwesomeProduct/_git",
	{
		'user-service-repo',
		'widget-service-repo'
	}
)
```

To embed the above code snippet in a `.vim` file, wrap it like so:

```lua
lua << EOF
	require('azureutils').setup(
		-- ...
	)
EOF
```

## Keymap
```lua
-- init.lua
vim.api.nvim_set_keymap("n", "<leader>a", ":lua require('azureutils').open_file_in_azure()<CR>", {noremap = true})
```

...or alternatively in a vim file:

```lua
nnoremap <leader>a <cmd>lua require('azureutils').open_file_in_azure()<CR>
```

## Testing
This plugin uses [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) so you'll need that installed via your vim plugin manager. Specs are in `lua/spec`. It's easiest to run specs from the relevant file with a keymap:

```lua
-- Run Plenary tests
vim.api.nvim_set_keymap("n", "<leader><leader>t", "<Plug>PlenaryTestFile", {noremap = true})
```

See this [testing guide](https://github.com/nvim-lua/plenary.nvim/blob/master/TESTS_README.md) for more details.

## Credits
Originally written in Ruby by [shirts](https://github.com/shirts)
