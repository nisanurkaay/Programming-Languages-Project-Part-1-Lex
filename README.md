# Programming Language Mrt

Group Members: ..., ...

## Syntax

```bnf
<program> ::= <statement_list>

<statement_list> ::= <statement>
| <statement> <statement_list>

<statement> ::= <var_decl>
| <const_decl>
| <assignment>
| <if_stmt>
| <while_stmt>
| <func_decl>
| <func_call> ";"
| <print_stmt>
| <scan_stmt>
| <return_stmt>

<var_decl> ::= "ingredient" <type> <id> "=" <expr> ";"
| "ingredient" <type> <id> ";"

<const_decl> ::= "secret" <type> <id> "=" <expr> ";"

<assignment> ::= <id> "=" <expr> ";"

<type> ::= "amount"
| "measure"
| "flavor"
| "label"
| "piece"

<func_decl> ::= "recipe" <id> "(" <param_list> ")" "{" <statement_list> "}"
| "recipe" <id> "(" ")" "{" <statement_list> "}"

<param_list> ::= <type> <id>
| <type> <id> "," <param_list>

<return_stmt> ::= "serve" <expr> ";"

<if_stmt> ::= "heat" "(" <condition> ")" "{" <statement_list> "}"
| "heat" "(" <condition> ")" "{" <statement_list> "}" "burn" "{" <statement_list> "}"
| "heat" "(" <condition> ")" "{" <statement_list> "}" <elseif_list>
| "heat" "(" <condition> ")" "{" <statement_list> "}" <elseif_list> "burn" "{" <statement_list> "}"

<elseif_list> ::= "reheat" "(" <condition> ")" "{" <statement_list> "}"
| "reheat" "(" <condition> ")" "{" <statement_list> "}" <elseif_list>

<while_stmt> ::= "stir" "(" <condition> ")" "{" <statement_list> "}"

<print_stmt> ::= "serve" "(" <expr> ")" ";"
<scan_stmt> ::= "taste" "(" <id> ")" ";"

<condition> ::= <expr> <compare_op> <expr>
| <condition> "&&" <condition>
| <condition> "||" <condition>
| "!" <condition>

<compare_op> ::= "==" | "!=" | "<" | ">" | "<=" | ">="

<expr> ::= <expr> <arith_op> <term>
| <term>

<term> ::= <term> "\*" <factor>
| <term> "/" <factor>
| <factor>

<factor> ::= <id>
| <number>
| <float>
| <string>
| <char>
| <bool>
| <func_call>
| "(" <expr> ")"

<arith_op> ::= "+" | "-"

<func_call> ::= <id> "(" <arg_list> ")"
| <id> "(" ")"

<arg_list> ::= <expr>
| <expr> "," <arg_list>

<number> ::= [0-9]+
<float> ::= [0-9]+ "." [0-9]+
<string> ::= '"' [^"]_ '"'
<char> ::= "'" [^'] "'"
<bool> ::= "fresh" | "stale"
<id> ::= [a-zA-Z][a-zA-Z0-9_]_

<comment> ::= "//" [^\n]_
| "/_" [^*]_ "_/"
```

## Explanations about the language

- Takes a file with extension .mrt
- Has if, while, ...

- You can run your program by running the makefile and giving it to myprog as input:

make
./myprog < example.mrt
