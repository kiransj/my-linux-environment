" Vim syntax file
" Language:         /var/log/messages file
" Maintainer:       Yakov Lerner <iler.ml@gmail.com>
" Latest Revision:  2008-06-29
" Changes:          2008-06-29 support for RFC3339 tuimestamps James Vega

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syntax clear

syn match   messagesBegin       display '^\[' nextgroup=messagesDate

syn match   messagesDate        contained display '\a\a\a [ 0-9]\d \d\d\d\d *'
                                \ nextgroup=messagesHour

syn match   messagesHour        contained display '\d\d:\d\d:\d\d.\d[0-9]* '
                                \ nextgroup=messagesPid

syn match   messagesPid        contained display '\d[0-9]* '
                                \ nextgroup=messagesConnNumber,messagesDash

syn match   messagesConnNumber  contained display '\d[0-9]*'
                                \ nextgroup=messagesLabel

syn match   messagesDash        contained display '-'
                                \ nextgroup=messagesLabel

syn match   messagesLabel       contained display '\s[a-zA-Z_0-9\/]*\s'
                                \ nextgroup=messagesType 


syn match   messagesType       contained display '[A-Z]*'
                                \ nextgroup=messagesCloseHeader contains=messagesError 

syn match   messagesCloseHeader       contained display '\]\s'
                                \ nextgroup=messagesIPString 

syn match   messagesIPString   contained display '{\d\+\.\d\+\.\d\+\.\d\+:\d\+\s\d\+\.\d\+\.\d\+\.\d\+:\d\+}'
                                \ nextgroup=messagesText contains=messagesIP

syn match   messagesIP          '\d\+\.\d\+\.\d\+\.\d\+:\d\+'

syn match   messagesURL         '\w\+://\S\+'

syn match   messagesText        contained display '.*'
                                \ contains=messagesImportant

syn match   messagesError       contained '\(FATAL\|ERR\|WARN\|NOTICE\)\]'
syn match   messagesImportant   contained '\(init client\|fini client\|Start flowing\).*'


hi def link messagesDate        Type 
hi def link messagesHour        Type
hi def link messagesPid         Identifier
hi def link messagesLabel       Operator
hi def link messagesPID         Constant
hi def link messagesKernel      Special
hi def link messagesError       ErrorMsg
hi def link messagesURL         Underlined
hi def link messagesText        Normal
hi def link messagesCloseHeader Normal
"hi def link messagesNumber      Number

hi messagesImportant  term=bold ctermfg=LightBlue guifg=#80a0ff  gui=bold
hi messagesConnNumber  term=bold ctermfg=White guifg=#80a0ff gui=bold
hi messagesType  term=bold ctermfg=Green guifg=#80a0ff gui=bold
hi messagesIP term=bold ctermfg=DarkCyan guifg=#80a0ff gui=bold

let b:current_syntax = "messages"

let &cpo = s:cpo_save
unlet s:cpo_save
