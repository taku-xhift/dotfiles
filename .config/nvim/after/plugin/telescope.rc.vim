if !exists('g:loaded_telescope') | finish | endif

nnoremap <silent> <Leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <silent> <Leader>fr <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <silent> <Leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
" nnoremap <silent> <Leader>fe <cmd>lua require('telescope.builtin').file_browser()<cr>
nnoremap <silent> <Leader>fe <cmd>Telescope file_browser path=&:p:h select_buffer=true hidden=true<cr>
nnoremap <silent> <Leader>f; <cmd>Telescope help_tags<cr>

lua << EOF
function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.load_extension "file_browser"

telescope.setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
	-- https://namileriblog.com/mac/neovim_telescope/
	file_ignore_patterns = {
		-- 検索から除外するものを指定
		"^.git/",
		"^.cache/",
		"Parallels",
	},
  },
  pickers = {
    file_browser = {
	  sorting_strategy = "ascending",
    },
	find_files = {
	  find_command = {
		"rg",
		"-u",
		"--files",
		-- "-tcpp",
		"--hidden",
		"-g",
		"!.git",
	  }
	}
  },
  extensions = {
	fzf = {
		fuzzy = true,
		-- 省略
	},
    file_browser = {
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
	  sorting_strategy = "ascending",
    },
  },
}
EOF


