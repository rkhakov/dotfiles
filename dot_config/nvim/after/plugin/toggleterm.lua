local Terminal  = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  on_open = function(term)
    vim.keymap.set('n', 'q', '<cmd>close<CR>', {buffer = term.bufnr, noremap = true, silent = true})
  end,
})

function _lazygit_toggle()
  lazygit:toggle()
end

vim.keymap.set("n", "<leader>lg", _lazygit_toggle, {noremap = true, silent = true})
