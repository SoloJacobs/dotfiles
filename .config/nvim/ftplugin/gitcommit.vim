if (exists("b:did_ftplugin"))
  finish
endif

let b:did_ftplugin = 1

setlocal comments=:# commentstring=#\ %s
setlocal nomodeline tabstop=8 formatoptions+=tl textwidth=72
setlocal formatoptions-=c formatoptions-=r formatoptions-=o formatoptions-=q formatoptions+=n
