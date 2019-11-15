set rtp+=webapi-vim

let g:buf_request_query_name = "FluxQueryResult"
let s:buf_nr = -1

function! s:query() range
  let l:credentialsfile = expand('~/.influxdbv2/credentials')
  let l:auth_token = join(readfile(credentialsfile),"")
  let l:selectedQuery = ""

  for lineno in range(a:firstline, a:lastline)
    let l:selectedQuery = l:selectedQuery."\x0a".getline(lineno)
  endfor

  let l:query_url = "http://localhost:9999/api/v2/query?org=gianarb"
  let l:headers = {"Authorization": "Token ".auth_token, "Content-Type": "application/vnd.flux"}
  let l:ret = webapi#http#post(query_url, selectedQuery, headers)

  if !bufexists(s:buf_nr)
    echo 'not exist'
    botright new
    let s:buf_nr = bufnr('%')
    exec 'f ' . g:buf_request_query_name
  elseif bufwinnr(s:buf_nr) == -1
    echo '-1'
    botright new
    execute s:buf_nr . 'buffer'
  elseif bufwinnr(s:buf_nr) != bufwinnr('%')
    echo '%'
    execute bufwinnr(s:buf_nr).'wincmd w'
  endif

  "if !bufexists(s:buf_num)
    "botright new
    "exec 'buf '. s:buf_num
  "else
    "botright new
    "let s:buf_num = bufnr('%')
    "exe 'f ' . g:buf_request_query_name
  "endif

  setlocal modifiable

  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile
  setlocal filetype=fluxresult

  call append(0, split("\n".l:ret.content."\n", "\n"))
  call append(0, split('Executed Query:'.l:selectedQuery."\n"."\n", "\n"))

  setlocal nomodifiable
  sil normal! gg
endfunction

command -range QueryInfluxDB <line1>,<line2>call s:query()
