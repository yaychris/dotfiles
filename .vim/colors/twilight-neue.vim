hi clear

if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "twilight-neue"

set background=dark



hi Normal guifg=#F8F8F8 guibg=#141414   " Normal: regular fg/bg 

hi Comment guifg=#5F5A60    " Comment: any comment

hi Constant guifg=#CF6A4C   " Constant: any constant
  hi String guifg=#8F9D6A     " String: a string constant: "this is a string"
                              " Character: a character constant: 'c', '\n'
                              " Number: a number constant: 234, 0xff
                              " Boolean: a boolean constant: TRUE, false
                              " Float: a floating point constant: 2.3e10



hi Identifier guifg=#7587A6   " Identifier: any variable name
  hi Function guifg=#9B703F     " Function: function name (also: methods for classes)

hi Statement guifg=#CDA869    " Statement: any statement
                                " Conditional: if, then, else, endif, switch, etc.
                                " Repeat: for, do, while, etc.
                                " Label: case, default, etc.
                                " Operator: "sizeof", "+", "*", etc.
                                " Keyword: any other keyword

hi PreProc guifg=#CDA869    " PreProc: generic Preprocessor
                              " Include: preprocessor #include
                              " Define: preprocessor #define
                              " Macro: same as Define
                              " PreCondit: preprocessor #if, #else, #endif, etc.

hi Type guifg=#9B859D       " Type: int, long, char, etc.
                              " StorageClass: static, register, volatile, etc.
                              " Structure: struct, union, enum, etc.
                              " Typedef: A typedef

" Special: any special symbol

" Error: any erroneous construct

" Todo: anything that needs extra attention



hi rubyRailsMethod guifg=#F9EE98    " Rails methods

hi LineNr guifg=#303030


" hi Comment guifg=#5F5A60 gui=italic " comments

" hi Constant guifg=#CF6A4C " constants
" hi RubySymbol guifg=#CF6A4C " ruby symbols

" hi Normal guifg=#F8F8F8 guibg=#141414 " regular fg/bg 

" strings
" hi String guifg=#8F9D6A
" hi Special guifg=#8F9D6A
" hi SpecialChar guifg=#8F9D6A
