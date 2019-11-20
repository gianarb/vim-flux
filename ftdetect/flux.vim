if exists('g:NERDCustomDelimiters')
    echo "ciao"
    let g:NERDCustomDelimiters['flux'] = { 'left': '//','right': '' }
else
    echo "none"
    let g:NERDCustomDelimiters = { 'flux': { 'left': '//','right': '' } }
endif

au BufRead,BufNewFile *.flux setfiletype flux
