" Vim syntax file
" Language:     LittleMake DSL
" Maintainer:   Sebastien Pierre
" Last Change:  2025-08-15
" Version:      1.0

if exists("b:current_syntax")
  finish
endif

" Comments
syn match littlemakeComment "#.*$" contains=@Spell
hi def link littlemakeComment Comment

" Keywords and operators
syn match littlemakeOperator "<-"
syn match littlemakeOperator ":"
syn match littlemakeOperator "="
syn match littlemakeOperator "|"
syn match littlemakeOperator "?"
syn match littlemakeOperator "!"
hi def link littlemakeKeyword Keyword
hi def link littlemakeOperator Operator

" Numbers (with Python-style separators)
syn match littlemakeNumber "\<\d\+\(_\d\+\)*\>"
syn match littlemakeNumber "\<0x[0-9a-fA-F]\+\(_[0-9a-fA-F]\+\)*\>"
syn match littlemakeNumber "\<0b[01]\+\(_[01]\+\)*\>"
syn match littlemakeNumber "\<\d\+\.\d\+\([eE][+-]\?\d\+\)\?\>"
hi def link littlemakeNumber Number

" Booleans and special values
syn keyword littlemakeBool #t #f nil
hi def link littlemakeBool Boolean

" Symbols (starting with #)
syn match littlemakeSymbol "#[A-Za-z][A-Za-z0-9_-]*"
hi def link littlemakeSymbol Constant

" Names (identifiers)
syn match littlemakeName "\<[A-Za-z0-9]\+\([_-][A-Za-z0-9]\+\)*[?!]\?\>"
hi def link littlemakeName Identifier

" Paths
syn match littlemakePath "\./[^ \t(){}|\"']*"
syn match littlemakePath "/[^ \t(){}|\"']*"
syn match littlemakePath "[A-Za-z][A-Za-z0-9+.-]*:[^ \t(){}|\"']*"
hi def link littlemakePath String

" References (@symbol, @{symbol.path})
syn match littlemakeRef "@[A-Za-z0-9_-]\+\(\.[A-Za-z0-9_-]\+\)*"
syn match littlemakeRef "@{[^}]*}"
syn match littlemakeRef "@<\*\?"
syn match littlemakeRef "@>\*\?"
syn match littlemakeRef "@[0-9]\+"
syn match littlemakeRef "@_"
syn match littlemakeRef "@\*"
syn match littlemakeRef "@#"
syn match littlemakeRef "@[0-9]*\.\.[0-9]*"
hi def link littlemakeRef PreProc

" Template expressions in strings and references
syn match littlemakeTemplate "@([^)]*)" contained
syn match littlemakeTemplate "@{[^}]*}" contained
syn match littlemakeTemplate "@[A-Za-z0-9_.-]\+" contained
hi def link littlemakeTemplate Special

" Templates with wildcards and captures
syn match littlemakeWildcard "\*\*\?"
syn match littlemakeWildcard "?"
syn match littlemakeWildcard "\[!\?[^\]]*\]"
syn region littlemakeCapture start="{" end="}" contains=littlemakeWildcard,littlemakeName
hi def link littlemakeWildcard SpecialChar
hi def link littlemakeCapture Type

" Strings (quoted)
syn region littlemakeString start='"' skip='\\"' end='"' contains=littlemakeTemplate
syn region littlemakeString start="'" skip="\\'" end="'" contains=littlemakeTemplate
hi def link littlemakeString String

" Expressions (Lisp-like with parentheses)
syn region littlemakeExpr start="(" end=")" contains=ALL
hi def link littlemakeExpr Function

" Lists [item1 item2 item3]
syn region littlemakeList start="\[" end="\]" contains=ALL
hi def link littlemakeList Type

" Rule definitions (pattern matching)
syn match littlemakeRuleDef "^[^#]*<-.*$" contains=ALL
syn match littlemakeRuleDef "^[^#:]*:$" contains=ALL
hi def link littlemakeRuleDef Statement

" Function definitions
syn match littlemakeFuncDef "^([^)]*)\s*=" contains=ALL
hi def link littlemakeFuncDef Define

" Variable assignments
syn match littlemakeVarDef "^[A-Za-z0-9._-]\+\s*=" contains=ALL
hi def link littlemakeVarDef Define

" Special rule variables
syn match littlemakeRuleVar "@<\*\?"
syn match littlemakeRuleVar "@>\*\?"
syn match littlemakeRuleVar "@[0-9]\+"
syn match littlemakeRuleVar "@_"
syn match littlemakeRuleVar "@\*"
syn match littlemakeRuleVar "@#"
syn match littlemakeRuleVar "@[0-9]*\.\.[0-9]*"
hi def link littlemakeRuleVar Special

" Continuation lines (starting with |)
syn match littlemakeContinuation "^\s*|.*$"
hi def link littlemakeContinuation Statement

" Expression lines (starting with @)
syn match littlemakeExprLine "^\s*@.*$" contains=ALL
hi def link littlemakeExprLine Function

" Literal string lines (starting with ||)
syn match littlemakeLiteral "^\s*||.*$"
hi def link littlemakeLiteral String

" Escaped characters
syn match littlemakeEscape "\\[(){}|\\@]"
hi def link littlemakeEscape SpecialChar

" File extensions for auto-detection
autocmd BufRead,BufNewFile *.lmk set filetype=littlemake
autocmd BufRead,BufNewFile *.littlemake set filetype=littlemake
autocmd BufRead,BufNewFile LittleMakefile set filetype=littlemake

let b:current_syntax = "littlemake"
" EOF
