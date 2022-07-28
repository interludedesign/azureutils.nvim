# azureutils.nvim
Utils for Azure from Neovim

## Install
```lua
-- Using Packer
use("interludedesign/azureutils.nvim")
```

## Setup
```lua
require("azureutils").setup(
	"https://tfs.acmeco.com/AcmeCoCollection/MyAwesomeProduct/_git",
	{
		'user-service-repo',
		'widget-service-repo'
	}
)
```

## Keymap
```lua
vim.api.nvim_set_keymap("n", "<leader>a", ":lua require('azureutils').open_file_in_azure()<CR>", {noremap = true})
```

## Utils
- `open_file_in_azure()`: Locate the file and line in Azure using nvim current buffer

## Credits
Originally written in Ruby by [shirts](https://github.com/shirts)
