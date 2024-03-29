require 'custom.opts'
require 'custom.keymaps'
require 'custom.autocmds'
require 'custom.filetypes'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
require('lazy').setup({
    { import = 'custom.utils' },
    { import = 'custom.UI' },
    { import = 'custom.coding' },
    { import = 'custom.lsp' },
}, {
    ui = {
        icons = vim.g.have_nerd_font and {} or {
            cmd = '👮',
            config = '🛠',
            event = '📅',
            ft = '📂',
            init = '▶️',
            keys = '🗝',
            plugin = '🔌',
            runtime = '💻',
            require = '🌙',
            source = '📄',
            start = '🚀',
            task = '📌',
            lazy = '💤 ',
        },
    },
})
