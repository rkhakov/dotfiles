local M = {}

M.save_and_exec = function()
  if vim.bo.filetype == "vim" then
    vim.cmd 'silent! write'
    vim.cmd 'source %'
  elseif vim.bo.filetype == "lua" then
    vim.cmd 'silent! write'
    vim.cmd 'luafile %'
  end
  return
end

return M
