if !exists('*rh#save_and_exec')
  function! rh#save_and_exec() abort
    if &filetype == 'vim'
      :silent! write
      :source %
    elseif &filetype == 'lua'
      :silent! write
      :luafile %
    elseif &filetype == 'python'
      :silent! write
      :!python %
    endif

    return
  endfunction
endif

