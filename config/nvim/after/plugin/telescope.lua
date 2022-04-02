local telescope = safe_require 'telescope'
if not telescope then
  return
end

telescope.setup{
  defaults = {
    winblend = 20,
    mappings = {
      i = {
      }
    }
  },
  pickers = { },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}

telescope.load_extension('fzf')

local builtin = require('telescope.builtin')
local themes = require('telescope.themes')

set = vim.keymap.set

set('n', '<C-f>', builtin.live_grep)
set('n', '<A-f>', builtin.grep_string)
set('n', '<leader>fw', function() builtin.grep_string {search = vim.fn.input("Grep For > ")} end)
set('n', '<leader>ff', function()
  builtin.find_files(themes.get_ivy())
end)
set('n', '<leader>fb', builtin.buffers)
set('n', '<leader>fh', builtin.help_tags)
set('n', '<leader>fk', builtin.keymaps)
set('n', '<C-_>', function()
  builtin.current_buffer_fuzzy_find({
    layout_config={
      prompt_position = 'top',
      height = 0.8,
      width = 0.5,
    },
    sorting_strategy = 'ascending',
  })
end)
set('n', '<C-p>', builtin.git_files)
set('n', '<leader>.', function() builtin.find_files {cwd = '~/dotfiles'} end)

