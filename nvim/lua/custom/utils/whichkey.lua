return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup()

    -- Document existing key chains
    require('which-key').register {
      ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
      ['<leader>ci'] = { name = '[C]ode [I]nfo', _ = 'which_key_ignore' },
      -- :TODO: trigger the following only when attaching to yaml buffer
      ['<leader>cy'] = { name = '[C]ode [y]aml', _ = 'which_key_ignore' },
      ['<leader>ct'] = { name = '[C]ode [T]reesitter', _ = 'which_key_ignore' },
      ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
      ['<leader>l'] = { name = '[L]ist', _ = 'which_key_ignore' },
      ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
      ['<leader>b'] = { name = '[B]uffer', _ = 'which_key_ignore' },
      ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
      ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
      ['['] = { name = '[previous', _ = 'which_key_ignore' },
      [']'] = { name = ']next', _ = 'which_key_ignore' },
    }
  end,
}
