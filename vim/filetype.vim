if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    " Actionscript source file.
    au! BufNewFile,BufRead *.as             setfiletype actionscript
    " Flex MXML file.
    au! BufNewFile,BufRead *.mxml           setfiletype mxml
    " git commit messages
    au! BufNewFile,BufRead COMMIT_EDITMSG   setfiletype gitcommit 
