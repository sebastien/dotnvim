" Vim syntax file
" Language: TOON - Token-Oriented Object Notation
" Maintainer: generated
" Spec: https://github.com/toon-format/spec
" Version: TOON 2.0 draft

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn case match
syn sync minlines=80

" ---------------------------------------------------------------------------
" Basic structural issues
" ---------------------------------------------------------------------------

" TOON uses spaces for indentation; tabs are only valid in quoted strings
" or as an active delimiter, not as indentation.
syn match toonIndentError /^\t\+/
syn match toonTrailingSpace /\s\+$/

" A bare line with only '-' is an empty object item in an expanded list.
syn match toonListMarker /^\s*\zs-\ze\%(\s\|$\)/

" ---------------------------------------------------------------------------
" Strings and escapes
" ---------------------------------------------------------------------------

syn match  toonEscape        /\\["\\nrt]/ contained
syn match  toonInvalidEscape /\\[^"\\nrt]/ contained

syn region toonString
      \ start=/"/
      \ skip=/\\"/
      \ end=/"/
      \ contains=toonEscape,toonInvalidEscape
      \ oneline

" ---------------------------------------------------------------------------
" Keys
" ---------------------------------------------------------------------------

" Unquoted keys: ^[A-Za-z_][A-Za-z0-9_.]*$
" Matches object keys and keyed array headers, including first fields after "- ".
syn match toonKey
      \ /^\s*\%(-\s\)\?\zs[A-Za-z_][A-Za-z0-9_.]*\ze\s*\%(\[[0-9]\+\%(|\|\t\)\?\]\%({[^}]*}\)\?\)\?:/

" Quoted keys before ":" or before "[N]:".
syn region toonQuotedKey
      \ start=/^\s*\%(-\s\)\?\zs"/
      \ skip=/\\"/
      \ end=/"\ze\s*\%(\[[0-9]\+\%(|\|\t\)\?\]\%({[^}]*}\)\?\)\?:/
      \ contains=toonEscape,toonInvalidEscape
      \ oneline

" ---------------------------------------------------------------------------
" Array headers
" ---------------------------------------------------------------------------

" Bracket segment: [N], [N|], or [N<TAB>].
syn match toonArrayCount /\[[0-9]\+\%(|\|\t\)\?\]/ contains=toonArrayDelimiter

syn match toonArrayDelimiter /[|\t]/ contained

" Field segment for tabular arrays: {field1,field2}, {field1|field2},
" or tab-separated fields. Field names may be quoted or unquoted keys.
syn region toonFieldList
      \ start=/{/
      \ end=/}/
      \ contains=toonFieldName,toonQuotedFieldName,toonDelimiter
      \ oneline

syn match toonFieldName /[A-Za-z_][A-Za-z0-9_.]*/ contained

syn region toonQuotedFieldName
      \ start=/"/
      \ skip=/\\"/
      \ end=/"/
      \ contains=toonEscape,toonInvalidEscape
      \ contained
      \ oneline

" A whole array header, keyed or root:
"   key[2]:
"   key[2]{id,name}:
"   [2]:
"   [2]{id,name}:
"   - key[2]:
"   - [2]:
syn match toonHeader
      \ /^\s*\%(-\s\)\?\%(\%([A-Za-z_][A-Za-z0-9_.]*\|"\%([^"\\]\|\\["\\nrt]\)*"\)\)\?\[[0-9]\+\%(|\|\t\)\?\]\%({[^}]*}\)\?:/
      \ contains=toonKey,toonQuotedKey,toonArrayCount,toonFieldList,toonListMarker

" Likely malformed array header: has [N] but no required colon.
syn match toonHeaderError
      \ /^\s*\%(-\s\)\?\%(\%([A-Za-z_][A-Za-z0-9_.]*\|"\%([^"\\]\|\\["\\nrt]\)*"\)\)\?\[[0-9]\+\%(|\|\t\)\?\]\%({[^}]*}\)\?\s*$/

" ---------------------------------------------------------------------------
" Primitive values
" ---------------------------------------------------------------------------

syn keyword toonBoolean true false
syn keyword toonNull    null

" Decoder accepts decimal and exponent forms, while encoders should emit
" canonical decimal form. Highlight accepted input forms.
syn match toonNumber
      \ /\%(^\|[,[| \t:]\)\zs-\?\%(\d\+\%(\.\d\+\)\?\|\.\d\+\)\%([eE][+-]\?\d\+\)\?\ze\%($\|[,\]| \t]\)/

" Leading-zero numerics are decoded as strings per spec, but are useful to flag.
syn match toonLeadingZeroNumber
      \ /\%(^\|[,[| \t:]\)\zs-\?0\d\+\%(\.\d\+\)\?\%([eE][+-]\?\d\+\)\?\ze\%($\|[,\]| \t]\)/

" Delimiters used in inline primitive arrays and tabular rows.
syn match toonDelimiter /[,|]/

" Colon separating key/header from value/body.
syn match toonColon /:/

" Brackets and braces, for cases not already captured by toonHeader.
syn match toonBracket /[\[\]]/
syn match toonBrace   /[{}]/

" ---------------------------------------------------------------------------
" Highlight links
" ---------------------------------------------------------------------------

hi def link toonKey               Identifier
hi def link toonQuotedKey         Identifier
hi def link toonString            String
hi def link toonEscape            SpecialChar
hi def link toonInvalidEscape     Error
hi def link toonBoolean           Boolean
hi def link toonNull              Constant
hi def link toonNumber            Number
hi def link toonLeadingZeroNumber WarningMsg
hi def link toonListMarker        Special
hi def link toonHeader            PreProc
hi def link toonArrayCount        Type
hi def link toonArrayDelimiter    Special
hi def link toonFieldList         PreProc
hi def link toonFieldName         Identifier
hi def link toonQuotedFieldName   Identifier
hi def link toonDelimiter         Delimiter
hi def link toonColon             Delimiter
hi def link toonBracket           Delimiter
hi def link toonBrace             Delimiter
hi def link toonIndentError       Error
hi def link toonTrailingSpace     Error
hi def link toonHeaderError       Error

let b:current_syntax = "toon"

let &cpo = s:cpo_save
unlet s:cpo_save
