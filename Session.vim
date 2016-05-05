let SessionLoad = 1
if &cp | set nocp | endif
nnoremap ,sv :source $MYVIMRC
nnoremap ,ev :vsplit $MYVIMRC
noremap ,t :!ctags --tag-relative -Rf.git/tags.$$ --exclude=.git --exclude=log --exclude=public --exclude=node_modules --exclude=app/stylesheets * $(echo $GEM_HOME)/*;fg;mv .git/tags.$$ .git/tags;rm -f .git/tags.$$
let s:cpo_save=&cpo
set cpo&vim
nnoremap Q <Nop>
nmap cr <Plug>Coerce
nmap gx <Plug>NetrwBrowseX
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cfile>"),0)
nnoremap <silent> <F7> :NERDTreeToggle
nnoremap <silent> <F8> :TagbarToggle
nnoremap <silent> <F12> :bn
nnoremap <silent> <F6> r
nnoremap <silent> <F5> :buffers:buffer 
nnoremap <silent> <F4> o
nnoremap <silent> <F3> 
nnoremap <silent> <F2>  
inoremap  vawuea
inoremap  vawUea
iabbr str JSON.stringify
iabbr @@ pascal.carrie@gmail.com
let &cpo=s:cpo_save
unlet s:cpo_save
set autoindent
set backspace=indent,eol,start
set backup
set cpoptions=aABceFs$
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=en
set hidden
set history=1000
set laststatus=2
set nomodeline
set printoptions=paper:letter
set ruler
set runtimepath=~/.vim,~/.vim/bundle/javascript-libraries-syntax,~/.vim/bundle/nerdtree,~/.vim/bundle/tagbar,~/.vim/bundle/vim-abolish,~/.vim/bundle/vim-angular,~/.vim/bundle/vim-fugitive,~/.vim/bundle/vim-jsbeautify,~/.vim/bundle/vim-rails,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim74,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/bundle/javascript-libraries-syntax/after,~/.vim/after,$HOME/.vim
set shiftwidth=2
set softtabstop=2
set statusline=%m%F%h%w\ [ASCII=%03.3b]\ [HEX=%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set tabstop=2
set undodir=~/.vim/undodir
set undofile
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/lockstockbarril
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 spec/lib/json_web_token.rb
badd +5 app/lib/json_web_token.rb
argglobal
silent! argdel *
argadd spec/lib/json_web_token.rb
edit spec/lib/json_web_token.rb
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe '1resize ' . ((&lines * 14 + 15) / 31)
exe '2resize ' . ((&lines * 14 + 15) / 31)
argglobal
let s:cpo_save=&cpo
set cpo&vim
nmap <buffer> gf <Plug>RailsTabFind
nmap <buffer> f <Plug>RailsSplitFind
nnoremap <buffer> <silent> g} :exe        "ptjump =RubyCursorIdentifier()"
nnoremap <buffer> <silent> } :exe          "ptag =RubyCursorIdentifier()"
nnoremap <buffer> <silent> g] :exe      "stselect =RubyCursorIdentifier()"
nnoremap <buffer> <silent> g :exe        "stjump =RubyCursorIdentifier()"
nnoremap <buffer> <silent>  :exe v:count1."stag =RubyCursorIdentifier()"
nnoremap <buffer> <silent> ] :exe v:count1."stag =RubyCursorIdentifier()"
nnoremap <buffer> <silent>  :exe  v:count1."tag =RubyCursorIdentifier()"
nmap <buffer> gf <Plug>RailsFind
nnoremap <buffer> <silent> g] :exe       "tselect =RubyCursorIdentifier()"
nnoremap <buffer> <silent> g :exe         "tjump =RubyCursorIdentifier()"
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=:#
setlocal commentstring=#\ %s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=^\\s*def\\s\\+\\(self\\.\\)\\=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=%\\S%\\+\ \ %#%[cefi]%[rxod]%[eir]%[a-z]%#%\\x1b[0m\ %\\+%\\S%\\+%$%\\&%\\x1b%\\S%\\+\ \ %#%m%\\>%\\x1b[0m\ \ %#%f,%\\s\ %#%[cefi]%[rxod]%[eir]%[a-z]%#\ %\\+%\\S%\\+%$%\\&%\\s\ %#%m%\\>\ \ %#%f,Overwrite%.%#%\\S%\\+\ \ %#%m%\\x1b[0m\ \ %#%f,%-GOverwrite%.%#\"h\"%.%#,%+GCurrent\ version:%.%#,%+G\ %#Status\ %#Migration\ ID%.%#,%+G\ %#Prefix\ %#Verb%.%#,%+G\ %#Code\ LOC:\ %.%#,%+GAbout\ your\ application's\ environment,%+Grun\ %\\S%#::Application.routes,%+Eruby:%.%#(LoadError),%+EUsage:%.%#,%+ECould\ not\ find\ generator%.%#,%+EType\ 'rails'\ for\ help.,%D(in\ %f),%\\s%#from\ %f:%l:%m,%\\s%#from\ %f:%l:,%\\s%##\ %f:%l:%m,%\\s%##\ %f:%l,%\\s%#[%f:%l:\ %#%m,%\\s%#%f:%l:\ %#%m,%\\s%#%f:%l:,%m\ [%f:%l]:,chdir\ /home/pascal/lockstockbarril
setlocal expandtab
if &filetype != 'ruby'
setlocal filetype=ruby
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=0
setlocal include=^\\s*\\<\\(load\\>\\|require\\>\\|autoload\\s*:\\=[\"']\\=\\h\\w*[\"']\\=,\\)
setlocal includeexpr=RailsIncludeexpr()
setlocal indentexpr=GetRubyIndent(v:lnum)
setlocal indentkeys=0{,0},0),0],!^F,o,O,e,=end,=else,=elsif,=when,=ensure,=rescue,==begin,==end
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=ri
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeprg=bin/rake
setlocal matchpairs=(:),{:},[:]
setlocal nomodeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=~/lockstockbarril/lib,~/lockstockbarril/vendor,~/lockstockbarril/app/models/concerns,~/lockstockbarril/app/controllers/concerns,~/lockstockbarril/app/controllers,~/lockstockbarril/app/helpers,~/lockstockbarril/app/mailers,~/lockstockbarril/app/models,~/lockstockbarril/app/*,~/lockstockbarril/app/views,~/lockstockbarril/spec,~/lockstockbarril/spec/controllers,~/lockstockbarril/spec/helpers,~/lockstockbarril/spec/mailers,~/lockstockbarril/spec/models,~/lockstockbarril/spec/views,~/lockstockbarril/spec/lib,~/lockstockbarril/spec/features,~/lockstockbarril/spec/requests,~/lockstockbarril/spec/integration,~/lockstockbarril/features,~/lockstockbarril/vendor/plugins/*/lib,~/lockstockbarril/vendor/plugins/*/test,~/lockstockbarril/vendor/rails/*/lib,~/lockstockbarril/vendor/rails/*/test,~/lockstockbarril,~/.rvm/rubies/ruby-2.2.3/lib/ruby/site_ruby/2.2.0,~/.rvm/rubies/ruby-2.2.3/lib/ruby/site_ruby/2.2.0/x86_64-linux,~/.rvm/rubies/ruby-2.2.3/lib/ruby/site_ruby,~/.rvm/rubies/ruby-2.2.3/lib/ruby/vendor_ruby/2.2.0,~/.rvm/rubies/ruby-2.2.3/lib/ruby/vendor_ruby/2.2.0/x86_64-linux,~/.rvm/rubies/ruby-2.2.3/lib/ruby/vendor_ruby,~/.rvm/rubies/ruby-2.2.3/lib/ruby/2.2.0,~/.rvm/rubies/ruby-2.2.3/lib/ruby/2.2.0/x86_64-linux
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=.rb
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'ruby'
setlocal syntax=ruby
endif
setlocal tabstop=2
setlocal tags=~/lockstockbarril/tags,~/lockstockbarril/tmp/tags,./tags,./TAGS,tags,TAGS,~/.rvm/rubies/ruby-2.2.3/lib/ruby/site_ruby/2.2.0/tags,~/.rvm/rubies/ruby-2.2.3/lib/ruby/site_ruby/2.2.0/x86_64-linux/tags,~/.rvm/rubies/ruby-2.2.3/lib/ruby/site_ruby/tags,~/.rvm/rubies/ruby-2.2.3/lib/ruby/vendor_ruby/2.2.0/tags,~/.rvm/rubies/ruby-2.2.3/lib/ruby/vendor_ruby/2.2.0/x86_64-linux/tags,~/.rvm/rubies/ruby-2.2.3/lib/ruby/vendor_ruby/tags,~/.rvm/rubies/ruby-2.2.3/lib/ruby/2.2.0/tags,~/.rvm/rubies/ruby-2.2.3/lib/ruby/2.2.0/x86_64-linux/tags
setlocal textwidth=0
setlocal thesaurus=
setlocal undofile
setlocal undolevels=-123456
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 24 - ((8 * winheight(0) + 7) / 14)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
24
normal! 068|
wincmd w
argglobal
edit app/lib/json_web_token.rb
let s:cpo_save=&cpo
set cpo&vim
nmap <buffer> gf <Plug>RailsTabFind
nmap <buffer> f <Plug>RailsSplitFind
nnoremap <buffer> <silent> g} :exe        "ptjump =RubyCursorIdentifier()"
nnoremap <buffer> <silent> } :exe          "ptag =RubyCursorIdentifier()"
nnoremap <buffer> <silent> g] :exe      "stselect =RubyCursorIdentifier()"
nnoremap <buffer> <silent> g :exe        "stjump =RubyCursorIdentifier()"
nnoremap <buffer> <silent>  :exe v:count1."stag =RubyCursorIdentifier()"
nnoremap <buffer> <silent> ] :exe v:count1."stag =RubyCursorIdentifier()"
nnoremap <buffer> <silent>  :exe  v:count1."tag =RubyCursorIdentifier()"
nmap <buffer> gf <Plug>RailsFind
nnoremap <buffer> <silent> g] :exe       "tselect =RubyCursorIdentifier()"
nnoremap <buffer> <silent> g :exe         "tjump =RubyCursorIdentifier()"
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=:#
setlocal commentstring=#\ %s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=^\\s*def\\s\\+\\(self\\.\\)\\=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=%\\S%\\+\ \ %#%[cefi]%[rxod]%[eir]%[a-z]%#%\\x1b[0m\ %\\+%\\S%\\+%$%\\&%\\x1b%\\S%\\+\ \ %#%m%\\>%\\x1b[0m\ \ %#%f,%\\s\ %#%[cefi]%[rxod]%[eir]%[a-z]%#\ %\\+%\\S%\\+%$%\\&%\\s\ %#%m%\\>\ \ %#%f,Overwrite%.%#%\\S%\\+\ \ %#%m%\\x1b[0m\ \ %#%f,%-GOverwrite%.%#\"h\"%.%#,%+GCurrent\ version:%.%#,%+G\ %#Status\ %#Migration\ ID%.%#,%+G\ %#Prefix\ %#Verb%.%#,%+G\ %#Code\ LOC:\ %.%#,%+GAbout\ your\ application's\ environment,%+Grun\ %\\S%#::Application.routes,%+Eruby:%.%#(LoadError),%+EUsage:%.%#,%+ECould\ not\ find\ generator%.%#,%+EType\ 'rails'\ for\ help.,%D(in\ %f),%\\s%#from\ %f:%l:%m,%\\s%#from\ %f:%l:,%\\s%##\ %f:%l:%m,%\\s%##\ %f:%l,%\\s%#[%f:%l:\ %#%m,%\\s%#%f:%l:\ %#%m,%\\s%#%f:%l:,%m\ [%f:%l]:,chdir\ /home/pascal/lockstockbarril
setlocal expandtab
if &filetype != 'ruby'
setlocal filetype=ruby
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=0
setlocal include=^\\s*\\<\\(load\\>\\|require\\>\\|autoload\\s*:\\=[\"']\\=\\h\\w*[\"']\\=,\\)
setlocal includeexpr=RailsIncludeexpr()
setlocal indentexpr=GetRubyIndent(v:lnum)
setlocal indentkeys=0{,0},0),0],!^F,o,O,e,=end,=else,=elsif,=when,=ensure,=rescue,==begin,==end
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=ri
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeprg=bin/rake
setlocal matchpairs=(:),{:},[:]
setlocal nomodeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=~/lockstockbarril/lib,~/lockstockbarril/vendor,~/lockstockbarril/app/models/concerns,~/lockstockbarril/app/controllers/concerns,~/lockstockbarril/app/controllers,~/lockstockbarril/app/helpers,~/lockstockbarril/app/mailers,~/lockstockbarril/app/models,~/lockstockbarril/app/*,~/lockstockbarril/app/views,~/lockstockbarril/spec,~/lockstockbarril/spec/controllers,~/lockstockbarril/spec/helpers,~/lockstockbarril/spec/mailers,~/lockstockbarril/spec/models,~/lockstockbarril/spec/views,~/lockstockbarril/spec/lib,~/lockstockbarril/spec/features,~/lockstockbarril/spec/requests,~/lockstockbarril/spec/integration,~/lockstockbarril/features,~/lockstockbarril/vendor/plugins/*/lib,~/lockstockbarril/vendor/plugins/*/test,~/lockstockbarril/vendor/rails/*/lib,~/lockstockbarril/vendor/rails/*/test,~/lockstockbarril,~/.rvm/rubies/ruby-2.2.3/lib/ruby/site_ruby/2.2.0,~/.rvm/rubies/ruby-2.2.3/lib/ruby/site_ruby/2.2.0/x86_64-linux,~/.rvm/rubies/ruby-2.2.3/lib/ruby/site_ruby,~/.rvm/rubies/ruby-2.2.3/lib/ruby/vendor_ruby/2.2.0,~/.rvm/rubies/ruby-2.2.3/lib/ruby/vendor_ruby/2.2.0/x86_64-linux,~/.rvm/rubies/ruby-2.2.3/lib/ruby/vendor_ruby,~/.rvm/rubies/ruby-2.2.3/lib/ruby/2.2.0,~/.rvm/rubies/ruby-2.2.3/lib/ruby/2.2.0/x86_64-linux
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=.rb
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'ruby'
setlocal syntax=ruby
endif
setlocal tabstop=2
setlocal tags=~/lockstockbarril/tags,~/lockstockbarril/tmp/tags,./tags,./TAGS,tags,TAGS,~/.rvm/rubies/ruby-2.2.3/lib/ruby/site_ruby/2.2.0/tags,~/.rvm/rubies/ruby-2.2.3/lib/ruby/site_ruby/2.2.0/x86_64-linux/tags,~/.rvm/rubies/ruby-2.2.3/lib/ruby/site_ruby/tags,~/.rvm/rubies/ruby-2.2.3/lib/ruby/vendor_ruby/2.2.0/tags,~/.rvm/rubies/ruby-2.2.3/lib/ruby/vendor_ruby/2.2.0/x86_64-linux/tags,~/.rvm/rubies/ruby-2.2.3/lib/ruby/vendor_ruby/tags,~/.rvm/rubies/ruby-2.2.3/lib/ruby/2.2.0/tags,~/.rvm/rubies/ruby-2.2.3/lib/ruby/2.2.0/x86_64-linux/tags
setlocal textwidth=0
setlocal thesaurus=
setlocal undofile
setlocal undolevels=-123456
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 12 - ((5 * winheight(0) + 7) / 14)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
12
normal! 037|
wincmd w
exe '1resize ' . ((&lines * 14 + 15) / 31)
exe '2resize ' . ((&lines * 14 + 15) / 31)
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
