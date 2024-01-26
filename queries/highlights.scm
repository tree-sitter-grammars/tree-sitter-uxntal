; Includes

(include
  "~" @include
  _ @text.uri @string.special)

(rune
  . rune_start: (rune_char ",")
  . (identifier) @function.call)

(rune
  . rune_start: (rune_char ";")
  . (identifier) @function.call)

((identifier) @function.call
  (#lua-match? @function.call "^:"))

; Keywords

(opcode) @keyword

; Labels

(label
  "@" @symbol
  (identifier) @function)

(sublabel_reference
  (identifier) @namespace
  "/" @punctuation.delimiter
  (identifier) @label)

; Macros

(macro
  "%"
  (identifier) @function.macro)

((identifier) @function.macro
  (#lua-match? @function.macro "^[a-z]?[0-9]*[A-Z-_]+$"))

; Variables

(identifier) @variable

; Repeats

((identifier) @repeat
  (#eq? @repeat "while"))

; Literals

(raw_ascii) @string

(hex_literal
  "#" @symbol
  (hex_lit_value) @constant.numeric)

(number) @constant.numeric

; Punctuation

[ "{" "}" ] @punctuation.bracket

[ "[" "]" ] @punctuation.bracket

[
  "%"
  "|"
  "$"
  ","
  "_"
  "."
  "-"
  ";"
  "="
  "!"
  "?"
  "&"
] @symbol

; Comments

(comment) @comment @spell
