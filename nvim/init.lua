vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 4
vim.o.guicursor = "a:block"

vim.opt.mouse = ""
vim.opt.termguicolors = true
vim.opt.fillchars:append({
  vert = " ",
  eob = " ",
})

vim.pack.add({ 
    "https://github.com/shaunsingh/nord.nvim",
    "https://github.com/windwp/nvim-autopairs",
    "https://github.com/christoomey/vim-tmux-navigator",
    "https://github.com/preservim/nerdtree",
    "https://github.com/akinsho/bufferline.nvim",
    "https://github.com/nvim-lualine/lualine.nvim",
})

vim.keymap.set('n', "<c-t>", vim.cmd.NERDTreeToggle)
vim.keymap.set("n", "<c-e>", "<cmd>bn<cr>")
vim.keymap.set("n", "<c-q>", "<cmd>bp<cr>")
vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })

vim.g.mapleader = ' '




vim.cmd[[colorscheme nord]]

vim.lsp.config("pyright", {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "setup.py", "setup.cfg", ".git" },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
})
vim.lsp.enable("pyright")




vim.lsp.enable("pyright")
vim.g.nerdtreefilelines = 1

require("nvim-autopairs").setup{}
require("bufferline").setup{}

require("bufferline").setup({
  options = {
    mode = "buffers",
    always_show_bufferline = false, 
    auto_toggle_bufferline = true,  -- oculta si solo un buffer
    show_close_icon = false,         
    show_buffer_close_icons = false,
    max_name_length = 30,   -- tamaño maximo
    tab_size = 0,           -- tamaño minimo
  },
})

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
      refresh_time = 16, -- ~60fps
      events = {
        'WinEnter',
        'BufEnter',
        'BufWritePost',
        'SessionLoadPost',
        'FileChangedShellPost',
        'VimResized',
        'Filetype',
        'CursorMoved',
        'CursorMovedI',
        'ModeChanged',
      },
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {},
    lualine_z = {
		function()
		    return vim.fn.line('.') .. '/' .. vim.fn.line('$')
		end
	    }
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
