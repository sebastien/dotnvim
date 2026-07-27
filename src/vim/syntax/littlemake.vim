" Vim syntax file
" Language:     LittleMake
" Maintainer:   Sebastien Pierre
" Last Change:  2026-08-09
" Version:      2.0

if exists("b:current_syntax")
  finish
endif

if &l:filetype ==# 'littlemake-expression' || expand('%:e') ==# 'lme'
  let b:littlemake_expression = 1
else
  let b:littlemake_expression = 0
endif

syn case match

" -----------------------------------------------------------------------------
" Shared atoms

syn match littlemakeComment "#.*$" contains=@Spell
syn match littlemakeComment "//.*$" contains=@Spell

syn match littlemakeSymbol ":\<[A-Za-z][A-Za-z0-9_-]*\>"
syn match littlemakeSymbol "#[A-Za-z][A-Za-z0-9_-]*"
syn match littlemakeName "\<[A-Za-z0-9]\+\([_-][A-Za-z0-9]\+\)*[?!]\=\>"

" Built-in forms and operations. Keep these separate from ordinary names so
" calls to the standard library remain recognizable in large expressions.
syn keyword littlemakeKeyword def let if else do lambda fn quote
syn keyword littlemakeStdlib apply bool count empty filter flatmap first found keys last list map nth prune reduce slice sorted unique values
syn keyword littlemakeStdlib read write append trunc remove chmod chown stat mtime sha256 splitext dirname basename relpath abspath realpath wildcard
syn keyword littlemakeStdlib str replace strip quoted split join match matched template
syn keyword littlemakeStdlib ishellcmd shellcmd ishellrun shellrun ish sh shsrc
syn keyword littlemakeStdlib copy gc metadata move rebuild ref status stream resources

syn match littlemakeNumber "\<[-+]\=\d\+\(_\d\+\)*\>"
syn match littlemakeNumber "\<[-+]\=0[bB][01]\+\(_[01]\+\)*\>"
syn match littlemakeNumber "\<[-+]\=0[oO][0-7]\+\(_[0-7]\+\)*\>"
syn match littlemakeNumber "\<[-+]\=0[xX][0-9a-fA-F]\+\(_[0-9a-fA-F]\+\)*\>"
syn match littlemakeNumber "\<[-+]\=\d\+\.\d\+\([eE][-+]\=\d\+\)\=\>"
syn keyword littlemakeBoolean #t #f true false nil

" Paths require ./, /, or a protocol prefix; other slash-containing text is a
" normal string according to the LittleMake atom grammar.
syn match littlemakePath "\./[^ 	(){}|\"']*"
syn match littlemakePath "/[^ 	(){}|\"']*"
syn match littlemakePath "\<[A-Za-z][A-Za-z0-9]*:\(/\(/\)\=\)\=[^ 	(){}|\"']*"
syn match littlemakeKey "\<[A-Za-z0-9]\+\([_-][A-Za-z0-9]\+\)*:"

syn match littlemakeSlice "\<[-+]\=\d\+\.\.\.\>"
syn match littlemakeSlice "\<\.\.\.\d\+\>"
syn match littlemakeSlice "\<[-+]\=\d\+\.\.\d\+\>"
syn match littlemakeSelection "{\<[A-Za-z0-9][A-Za-z0-9_-]*\(,[A-Za-z0-9][A-Za-z0-9_-]*\)*}"
syn match littlemakeReference "\<[A-Za-z0-9][A-Za-z0-9_-]*\>\(\.\([A-Za-z0-9][A-Za-z0-9_-]*\|[-+]\=\d\+\.\.\.\|\.\.\.\d\+\|[-+]\=\d\+\.\.\d\+\|{[A-Za-z0-9,_-]*}\)\)\+"

syn match littlemakeSelector "@<[#*]\=\|@>[#*]\=\|@[#*_]\|@[<>][-+]\=\d\+\%([.]\.\%([-+]\=\d\+\)\=\)\="
syn match littlemakeSelector "@[<>]\%([#*]\|[-+]\=\d\+\|\.\.\.\d\+\|[-+]\=\d\+\.\.\%([-+]\=\d\+\)\=\)"
syn match littlemakeRest "\.\.\."

" -----------------------------------------------------------------------------
" Templates and strings

syn match littlemakeTemplateName "\<[A-Za-z][A-Za-z0-9_-]*:\|\(|\)[A-Za-z][A-Za-z0-9_]*\>" contained
syn match littlemakeTemplateGlob "[*?]\|\[[^]]*\]" contained
syn region littlemakeTemplateRegexp matchgroup=littlemakeBracket start="(" end=")" contained contains=littlemakeTemplateGlob
syn region littlemakeTemplate matchgroup=littlemakeBracket start="{" end="}" contains=littlemakeTemplateName,littlemakeTemplateRegexp,littlemakeTemplateGlob,littlemakeName,littlemakeSlice,littlemakeReference

syn match littlemakeExpansion "@\ze[A-Za-z][A-Za-z0-9]*:\S\+" contains=littlemakePath
syn region littlemakeExpansionParen matchgroup=littlemakeParen start="@(\@=" end=")" contains=@littlemakeExpression
syn region littlemakeExpansionRef matchgroup=littlemakeBracket start="@{" end="}" contains=littlemakeReference,littlemakeSelection,littlemakeSlice

syn region littlemakeString start='"' skip='\\.' end='"' contains=littlemakeExpansion,littlemakeExpansionParen,littlemakeExpansionRef,littlemakeTemplate,littlemakeEscape
syn region littlemakeString start="'" skip='\\.' end="'" contains=littlemakeExpansion,littlemakeExpansionParen,littlemakeExpansionRef,littlemakeTemplate,littlemakeEscape
syn match littlemakeEscape "\\[(){}|\\@'\"]" contained

" -----------------------------------------------------------------------------
" Expression language

syn match littlemakeOperator "|\|=\|<-\|:"
syn match littlemakeQuote "['`]"
syn region littlemakeList matchgroup=littlemakeBracket start="\[" end="\]" contains=@littlemakeExpression
syn region littlemakeExpression matchgroup=littlemakeParen start="(" end=")" contains=@littlemakeExpression
syn region littlemakeExpressionTemplate matchgroup=littlemakeBracket start="{" end="}" contains=littlemakeTemplateGlob,littlemakeTemplateRegexp,littlemakeName,littlemakeReference

syn cluster littlemakeExpression contains=littlemakeComment,littlemakeNumber,littlemakeBoolean,littlemakeKeyword,littlemakeStdlib,littlemakeSymbol,littlemakeName,littlemakeKey,littlemakePath,littlemakeSlice,littlemakeSelection,littlemakeReference,littlemakeSelector,littlemakeRest,littlemakeString,littlemakeTemplate,littlemakeExpansionParen,littlemakeExpansionRef,littlemakeExpressionTemplate,littlemakeList,littlemakeExpression,littlemakeQuote,littlemakeOperator

" -----------------------------------------------------------------------------
" Full script language (.lmk)

if !b:littlemake_expression
  syn match littlemakeFunctionArgs "\<[A-Za-z0-9_-]\+\>" contained
  syn match littlemakeFunctionName "(\s*\zs[A-Za-z0-9_-]\+\ze\%([ 	)]\)" contained
  syn match littlemakeDefinition "^[ 	]*\%((\s*\)\@<![A-Za-z0-9][A-Za-z0-9_.-]*\s*=" contains=littlemakeName,littlemakeOperator
  syn match littlemakeFunctionDefinition "^[ 	]*(\s*[A-Za-z0-9_-]*\%([ 	][A-Za-z0-9_-]*\)*\s*)\s*=" contains=littlemakeFunctionName,littlemakeFunctionArgs,littlemakeOperator
  syn match littlemakeRule "^[ 	]*.*\(<-\|:\)" contains=littlemakeOperator,littlemakeTemplate,littlemakeExpansion,littlemakePath,littlemakeReference,littlemakeString,littlemakeName
  syn match littlemakeBodyExpression "^[ 	]*@(.*$" contains=littlemakeExpansion,@littlemakeExpression
  syn match littlemakeContinuation "^[ 	]*|.*$" contains=@littlemakeExpression
  syn match littlemakeLiteralBody "^[ 	]*||.*$" contains=littlemakeExpansion,littlemakeTemplate,littlemakeEscape
  syn match littlemakeBodyString "^[ 	]\+[^@|].*$" contains=littlemakeExpansion,littlemakeTemplate,littlemakeSelector,littlemakeEscape

  hi def link littlemakeDefinition Define
  hi def link littlemakeFunctionDefinition Function
  hi def link littlemakeFunctionName Function
  hi def link littlemakeFunctionArgs Type
  hi def link littlemakeRule Statement
  hi def link littlemakeBodyExpression Function
  hi def link littlemakeContinuation Operator
  hi def link littlemakeLiteralBody String
  hi def link littlemakeBodyString String
endif

" -----------------------------------------------------------------------------
" Highlight links

hi def link littlemakeComment Comment
hi def link littlemakeNumber Number
hi def link littlemakeBoolean Number
hi def link littlemakeKeyword Statement
hi def link littlemakeStdlib Statement
hi def littlemakeSymbol guifg=#F5C400 gui=bold
hi def link littlemakeName Identifier
hi def littlemakeKey guifg=#F5C400 gui=bold
hi def link littlemakePath String
hi def link littlemakeSlice Number
hi def link littlemakeSelection Type
hi def link littlemakeReference PreProc
hi def link littlemakeSelector Special
hi def link littlemakeRest SpecialChar
hi def link littlemakeTemplate Special
hi def link littlemakeTemplateName Type
hi def link littlemakeTemplateGlob SpecialChar
hi def link littlemakeTemplateRegexp String
hi def link littlemakeExpansion Special
hi def link littlemakeParen Delimiter
hi def link littlemakeBracket Statement
hi def link littlemakeString String
hi def link littlemakeEscape SpecialChar
hi def link littlemakeOperator Operator
hi def link littlemakeQuote SpecialChar
hi def link littlemakeList Type
hi def link littlemakeExpression Function
hi def link littlemakeExpressionTemplate Special

let b:current_syntax = 'littlemake'

" EOF
