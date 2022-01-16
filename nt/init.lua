SHELL = "zsh"

local opt = vim.o
local api = vim.api


opt.packpath="/nix/store/vivv1kj9vxl15365x2hgy2948l7lladq-vim-pack-dir"
opt.modified = false
opt.guicursor = "n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175"
opt.mouse = "a"

require('packer').startup(function()
  -- Packer can manage itself
  use 'arcticicestudio/nord-vim'
end)

local add_mux_map = function (lhs, rhs, options)
	local orig_prefix = '<C-\\><C-n>'
	vim.api.nvim_set_keymap(
		't',
		lhs,
		orig_prefix .. rhs,
		options)
	vim.api.nvim_set_keymap(
		'n',
		lhs,
		rhs,
		options)
end

api.nvim_set_keymap(
	'n',
	'q',
	'a',
	{}
)

api.nvim_set_keymap(
	'v',
	'q',
	'a',
	{}
)

-- Set prefix
add_mux_map('<M-a>', '', {})


-- Window commands
add_mux_map('<M-m>', '<C-w><C-w>a', {}) -- change window
add_mux_map('<M-a>/', ':vsplit term://' .. SHELL .. '<cr>', {}) -- split right
add_mux_map('<M-a>-', ':split term://' .. SHELL .. '<cr>', {}) -- split down

vim.api.nvim_command("terminal")

