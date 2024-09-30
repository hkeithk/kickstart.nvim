-- - return {
--   {
--     'ggandor/leap.nvim',
--     enabled = true,
--     keys = {
--       { 's', mode = { 'n', 'x', 'o' }, desc = 'Leap Forward to' },
--       { 'S', mode = { 'n', 'x', 'o' }, desc = 'Leap Backward to' },
--       { 'gs', mode = { 'n', 'x', 'o' }, desc = 'Leap from Windows' },
--     },
--     config = function(_, opts)
--       local leap = require 'leap'
--       for k, v in pairs(opts) do
--         leap.opts[k] = v
--       end
--       leap.add_default_mappings(true)
--       vim.keymap.del({ 'x', 'o' }, 'x')
--       vim.keymap.del({ 'x', 'o' }, 'X')
--     end,
--   },
-- }
--
-- this is config from lazyvim- but it doesnt load for some reason
return {
  -- disable flash
  { 'folke/flash.nvim', enabled = true, optional = true },

  -- easily jump to any location and enhanced f/t motions for Leap
  {
    'ggandor/flit.nvim',
    enabled = true,
    keys = function()
      -- -@type LazyKeysSpec[]
      local ret = {}
      for _, key in ipairs { 'f', 'F', 't', 'T' } do
        ret[#ret + 1] = { key, mode = { 'n', 'x', 'o' } }
      end
      return ret
    end,
    opts = { labeled_modes = 'nx' },
  },
  {
    'ggandor/leap.nvim',
    enabled = true,
    -- standard keymap configuration
    -- keys = {
    --   { 's', mode = { 'n', 'x', 'o' }, desc = 'Leap Forward to' },
    --   { 'S', mode = { 'n', 'x', 'o' }, desc = 'Leap Backward to' },
    --   { 'gs', mode = { 'n', 'x', 'o' }, desc = 'Leap from Windows' },
    -- },
    config = function(_, opts)
      local leap = require 'leap'
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
      vim.keymap.del({ 'x', 'o' }, 'x')
      vim.keymap.del({ 'x', 'o' }, 'X')
      vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
      vim.keymap.set('n', 's', '<Plug>(leap)')
      vim.keymap.set('n', 'S', '<Plug>(leap-from-window)')
      vim.keymap.set({ 'x', 'o' }, 's', '<Plug>(leap-forward)')
      vim.keymap.set({ 'x', 'o' }, 'S', '<Plug>(leap-backward)')
    end,
  },

  -- rename surround mappings from gs to gz to prevent conflict with leap
  {
    'echasnovski/mini.surround',
    optional = true,
    opts = {
      mappings = {
        add = 'gza', -- Add surrounding in Normal and Visual modes
        delete = 'gzd', -- Delete surrounding
        find = 'gzf', -- Find surrounding (to the right)
        find_left = 'gzF', -- Find surrounding (to the left)
        highlight = 'gzh', -- Highlight surrounding
        replace = 'gzr', -- Replace surrounding
        update_n_lines = 'gzn', -- Update `n_lines`
      },
    },
    keys = {
      { 'gz', '', desc = '+surround' },
    },
  },

  -- makes some plugins dot-repeatable like leap
  { 'tpope/vim-repeat', event = 'VeryLazy' },
}
