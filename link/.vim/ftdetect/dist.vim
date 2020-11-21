autocmd BufNewFile,BufRead ?\+.dist execute 'doautocmd filetypedetect BufRead' fnameescape(expand('<afile>:r'))
