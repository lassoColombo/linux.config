-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float, { desc = '[L]ine [D]iagnostics' })

-- Buffer keymaps
-- save buffer
vim.keymap.set('n', '<leader>bw', '<cmd>w<CR>', { desc = '[B]uffer [W]rite' })
vim.keymap.set('n', '<C-s>', '<cmd>w<CR>', { desc = '[B]uffer [W]rite' })
vim.keymap.set('n', '<leader>ww', '<cmd>wa<CR>', { desc = '[W]orkspace [W]rite' })
-- vim.keymap.set('n', '<leader>bd', '<cmd>bd<CR>', { desc = '[B]buffer [D]elete' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<leader>|', '<cmd>vsplit<CR>', { desc = 'Split window vertically' })
vim.keymap.set('n', '<leader>-', '<cmd>hsplit<CR>', { desc = 'Split window horizontally' })
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<C-right>', '<cmd>vertical resize +5<CR>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-left>', '<cmd>vertical resize -5<CR>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-up>', '<cmd>horizontal resize +3<CR>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-down>', '<cmd>horizontal resize -3<CR>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<leader>wc', '<cmd>close<CR>', { desc = '[W]indow [C]lose' })

