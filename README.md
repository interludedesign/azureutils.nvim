# azureutils.nvim
Utils for Azure from Neovim

## Install
```lua
-- init.lua
-- Using Packer
use("interludedesign/azureutils.nvim")
```

## Setup
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

## Utils
- `open_file_in_azure()`: Locate the file and line in Azure using nvim current buffer

## Credits
Originally written in Ruby by [shirts](https://github.com/shirts)
