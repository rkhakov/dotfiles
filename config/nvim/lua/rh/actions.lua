local M = {}

M.save_and_exec = function()
  print('foobar')
  if vim.bo.filetype == "vim" then
    vim.cmd 'silent! write'
    vim.cmd 'source %'
    print('vim')
  elseif vim.bo.filetype == "lua" then
    vim.cmd 'silent! write'
    vim.cmd 'luafile %'
  end
  return
end

return M
