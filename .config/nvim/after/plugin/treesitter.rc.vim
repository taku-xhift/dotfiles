if !exists('g:loaded_nvim_treesitter')
  echom "Not loaded treesitter"
  finish
endif

lua <<EOF
#require'nvim-treesitter.configs'.setup {
#  highlight = {
#    enable = true,
#    disable = {},
#  },
#  indent = {
#    enable = true,
#    disable = {},
#  },
#  ensure_installed = {
#    "tsx",
#    "toml",
#    "fish",
#    "php",
#    "json",
#    "yaml",
#    "swift",
#    "html",
#    "scss"
#  },
#  autotag = {
#    enable = true,
#  }
#}
#
#local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
#parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

require'nvim-treesitter'.setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}
require'nvim-treesitter'.install { 'rust', 'javascript', 'zig', 'cpp' }

vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() end,
})

vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

EOF
