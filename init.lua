require('config.lazy')

-- Spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
-- Auto-indentation
vim.opt.autoindent = true
vim.opt.cindent = false
-- Line numbering
vim.opt.relativenumber = true
vim.opt.number = true

-- Shortcuts
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope find files' })

-- Language Servers
local lsp = require "lspconfig"
local coq = require "coq"
lsp.lua_ls.setup(coq.lsp_ensure_capabilities{
  settings = {
    Lua = {
      diagnostics  = {
        globals =  { "vim" },
      },
    },
  },
})
lsp.nixd.setup(coq.lsp_ensure_capabilities{})
lsp.vimls.setup(coq.lsp_ensure_capabilities{})

