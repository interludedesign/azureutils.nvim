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
vim.api.nvim_set_keymap("n", "<leader><leader>c", ":lua require('azureutils').locate_line_in_repo()<CR>", {noremap = true})
```
