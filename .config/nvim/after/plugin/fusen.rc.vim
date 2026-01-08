if !exists('g:loaded_telescope') | finish | endif

" Set up a keybinding (example)
" vim.keymap.set("n", "<leader>fm", ":Telescope fusen marks<CR>", { desc = "Find fusen marks" })
nnoremap <silent> <Leader>fm <cmd>Telescope fusen<cr>


lua << EOF
local fusen = require('fusen')

fusen.setup{
	-- Storage location
	-- save_file = vim.fn.expand("$HOME") .. "/fusen_marks.json",
	save_file = vim.fn.expand(".") .. "/fusen_marks.json",

	-- Mark appearance
	mark = {
	  icon = "🗝️",
	  hl_group = "FusenMark",
	},

	-- Key mappings
	keymaps = {
	  add_mark     = "<Leader>me",    -- Add/edit sticky note
	  clear_mark   = "<Leader>mc",    -- Clear mark at current line
	  clear_buffer = "<Leader>mC",    -- Clear all marks in buffer
	  clear_all    = "<Leader>mD",    -- Clear ALL marks (deletes entire JSON content)
	  next_mark    = "<Leader>mn",    -- Jump to next mark
	  prev_mark    = "<Leader>mp",    -- Jump to previous mark
	  list_marks   = "<Leader>ml",    -- Show marks in quickfix
	},

	-- Telescope integration settings
	telescope = {
	  keymaps = {
		delete_mark_insert = "<C-d>",  -- Delete mark in insert mode
		delete_mark_normal = "<C-d>",  -- Delete mark in normal mode
	  },
	},

	-- Sign column priority
	sign_priority = 10,

	-- Annotation display settings
	annotation_display = {
	  mode = "both", -- "eol", "float", "both", "none"
	  spacing = 8,    -- Number of spaces before annotation in eol mode

	  -- Float window settings
	  float = {
		delay = 10,
		border = "rounded",
		max_width = 50,
		max_height = 10,
	  },
	},

	-- Exclude specific filetypes from keymaps
	exclude_filetypes = {
	  -- "neo-tree",     -- Example: neo-tree
	  -- "NvimTree",     -- Example: nvim-tree
	  -- "nerdtree",     -- Example: NERDTree
	},

	-- Plugin enabled state
	enabled = true,
}

EOF

