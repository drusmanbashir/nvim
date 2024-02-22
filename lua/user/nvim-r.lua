require'cmp_nvim_r'.setup({
  filetypes = {'r', 'rmd', 'quarto'},
  doc_width = 58
  })
vim.cmd[[
set nosplitright

let R_rconsole_width = winwidth(0) / 2
let R_assign= 0
let nosplitright = 1
let R_objbr_place = 'console,below'
let R_objbr_h = 25
let R_objbr_auto_start =0
let R_auto_start=2
autocmd VimResized * let R_rconsole_width = winwidth(0) / 2
function! s:customNvimRMappings()

   nmap <buffer> <M-e> <leader>d
   " imap <buffer> <M-e> <Esc><leader>d


   imap <buffer> <M--> <-
   imap <buffer> <M-,> %>% 
   vmap <buffer> <M-e> <leader>sd
   " nmap <buffer> <M-x> <leader>mij/^# %%<CR><CR>
   nmap <buffer> <M-x> l[hv]h<leader>sd
endfunction
augroup myNvimR
   au!
   autocmd filetype r call s:customNvimRMappings()
augroup end
]]
