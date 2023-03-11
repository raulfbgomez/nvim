vim.o.termguicolors = true
vim.o.number = true
vim.o.tabstop = 2
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.shiftwidth = 2
vim.o.expandtab = true -- Indent using spaces
-- vim.o.list = true
-- vim.o.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'

-- Makes neovim and host OS clipboard play nicely with each other
vim.o.clipboard = 'unnamedplus'

-- Map <leader> to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Theme

-- vim.cmd[[colorscheme tokyonight]]

--require('onedark').setup {
--  style = 'cool'
--}

--require('onedark').load()

vim.cmd("colorscheme onedark_vivid")

-- NvimTree
require('nvim-tree').setup({
  diagnostics = {
    enable = true,
  },
  update_focused_file = {
    enable = true,
  },
  view = {
    width = 30,
    side = 'right',
  },
  filters = {
    custom = { '.git$', 'node_modules$', '^target$' },
  },
  git = {
    ignore = false,
  },
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
  renderer = {
    icons = {
      show = {
        git = true,
        folder = true,
        file = true,
        folder_arrow = false,
      },
      glyphs = {
        default = '',
        git = {
          unstaged = '~',
          staged = '+',
          unmerged = '!',
          renamed = '≈',
          untracked = '?',
          deleted = '-',
        },
      },
    },
    indent_markers = {
      enable = true,
    },
  },
})

vim.keymap.set('n', '<C-b>', '<CMD>NvimTreeToggle<CR>')

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('NVIM_TREE', { clear = true }),
  pattern = 'NvimTree',
  callback = function()
    vim.api.nvim_win_set_option(0, 'wrap', false)
  end,
})

-- Lualine

require('lualine').setup({
  options = {
    -- theme = 'tokyonight',
    theme = 'onedark',
    -- component_separators = '',
    -- section_separators = '',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    icons_enabled = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      { 'mode', color = { gui = 'bold' } },
    },
    lualine_b = {
      { 'branch' },
      { 'diff', colored = false },
    },
    lualine_c = {
      { 'filename', file_status = true },
      { 'diagnostics' },
    },
    lualine_x = {
      'filetype',
      'encoding',
      'fileformat',
    },
    lualine_y = { 'progress' },
    lualine_z = {
      { 'location', color = { gui = 'bold' } },
    },
  },
  tabline = {
    lualine_a = {
      {
        'buffers',
        buffers_color = { active = 'lualine_b_normal' },
      },
    },
    lualine_z = {
      {
        'tabs',
        tabs_color = { active = 'lualine_b_normal' },
      },
    },
  },
  extensions = { 'quickfix', 'nvim-tree' },
})

require('nvim-autopairs').setup()

-- Indent Blankline

vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
  space_char_blankline = " ",
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3",
    "IndentBlanklineIndent4",
    "IndentBlanklineIndent5",
    "IndentBlanklineIndent6",
  },
}