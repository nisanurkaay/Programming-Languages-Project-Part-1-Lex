# CHEF Programming Language - Step 1 (Lexical Analyzer)

## Group Members
- Hüseyin Mert AFŞARLI - 20210808031
- Yiğit ARSLAN - 20220808051
- Nisa Nur KAYA - 20220808044

## Language Name
CHEF Programming Language

## Language Overview
CHEF is a cooking-themed imperative programming language designed for educational purposes. In this first step of the project, we implemented the lexical analyzer of the language using Lex/Flex. The language supports:
- Variable declarations
- Constant declarations
- Integer, float, boolean, string, and char data types
- Arithmetic operators (+, -, *, /)
- Comparison operators (==, !=, <, >, <=, >=)
- Logical operators (&&, ||, !)
- If / ElseIf / Else structures
- While loops
- Function definitions
- Input / Output operations
- Single-line and multi-line comments

The main purpose of CHEF is to make programming language concepts more memorable and enjoyable by using a consistent cooking metaphor for keywords and syntax.

## Updated Keyword Table

- ingredient : variable declaration (Example: ingredient amount x = 5;)
- secret     : constant declaration (Example: secret amount PI = 3;)
- recipe     : function definition (Example: recipe topla(amount x) { })
- serve      : return / print (Example: serve(sonuc);)
- taste      : input operation (Example: taste(x);)
- heat       : if (Example: heat (x > 0) { })
- reheat     : else if (Example: reheat (x == 0) { })
- burn       : else (Example: burn { })
- stir       : while loop (Example: stir (x < 10) { })
- fresh      : true (Example: flavor aktif = fresh;)
- stale      : false (Example: flavor aktif = stale;)
- amount     : int type (Example: ingredient amount yas = 20;)
- measure    : float type (Example: ingredient measure fiyat = 9.99;)
- flavor     : bool type (Example: ingredient flavor durum = fresh;)
- label      : string type (Example: ingredient label isim = "Ali";)
- piece      : char type (Example: ingredient piece harf = 'A';)

## Data Types

- amount  : integer
- measure : float
- flavor  : boolean
- label   : string
- piece   : char

Boolean values:
- fresh -> true
- stale -> false

## Supported Tokens in the Lexical Analyzer
The lexical analyzer recognizes the following token categories:
- Keywords: ingredient, secret, recipe, serve, taste, heat, reheat, burn, stir
- Type keywords: amount, measure, flavor, label, piece
- Boolean values: fresh, stale
- Arithmetic operators: +, -, *, /
- Comparison operators: ==, !=, <, >, <=, >=
- Logical operators: &&, ||, !
- Assignment operator: =
- Punctuation symbols: ;, ,, (, ), {, }
- Identifiers
- Integer literals
- Float literals
- String literals
- Character literals
- Comments
- Unknown characters / invalid tokens

## Example Programs

### Example Program 1

exampleprog1.chef

    ingredient amount x = 5;
    ingredient amount y = 10;

    recipe add(amount a, amount b) {
        serve(a + b);
    }

    ingredient amount result = add(x, y);

    heat (result > 10) {
        serve("Greater than 10");
    } burn {
        serve("Less or equal to 10");
    }

## Example Syntax

### Variable Declaration
    ingredient amount x = 5;

### Constant Declaration
    secret amount PI = 3;

### If Statement
    heat (x > 0) {
        serve("positive");
    } reheat (x == 0) {
        serve("zero");
    } burn {
        serve("negative");
    }

### While Loop
    stir (x < 10) {
        x = x + 1;
    }

### Function
    recipe add(amount a, amount b) {
        serve(a + b);
    }

## Project Structure

CHEF Language project files:

- chef.l : Lexical analyzer implementation
- exampleprog1.chef : Example program 1
- exampleprog2.chef : Example program 2
- Makefile : Build instructions
- README.md : Project documentation

## BNF Grammar

The following grammar describes the syntactic structure of the **CHEF programming language**.  
It defines how programs, statements, expressions, and language constructs are formed.

    <program> ::= <statement_list>

<statement_list> ::=
<statement>
| <statement> <statement_list>

<statement> ::=
<variable_declaration>
| <constant_declaration>
| <assignment>
| <function_definition>
| <if_statement>
| <while_statement>
| <input_statement>
| <output_statement>
| <function_call> ";"
| <comment>

<variable_declaration> ::=
"ingredient" <type> <identifier> "=" <expression> ";"
| "ingredient" <type> <identifier> ";"

<constant_declaration> ::=
"secret" <type> <identifier> "=" <expression> ";"

<type> ::=
"amount"
| "measure"
| "flavor"
| "label"
| "piece"

<assignment> ::=
<identifier> "=" <expression> ";"

<function_definition> ::=
"recipe" <identifier> "(" <parameter_list_opt> ")"
"{" <statement_list> "}"

<parameter_list_opt> ::=
<parameter_list> | ε

<parameter_list> ::=
<parameter>
| <parameter> "," <parameter_list>

<parameter> ::=
<type> <identifier>

<if_statement> ::=
"heat" "(" <expression> ")"
"{" <statement_list> "}"
<elseif_list_opt>
<else_opt>

<elseif_list_opt> ::=
<elseif_list> | ε

<elseif_list> ::=
"reheat" "(" <expression> ")"
"{" <statement_list> "}"
| "reheat" "(" <expression> ")"
"{" <statement_list> "}" <elseif_list>

<else_opt> ::=
"burn" "{" <statement_list> "}"
| ε

<while_statement> ::=
"stir" "(" <expression> ")"
"{" <statement_list> "}"

<input_statement> ::=
"taste" "(" <identifier> ")" ";"

<output_statement> ::=
"serve" "(" <expression> ")" ";"
| "serve" <expression> ";"

<function_call> ::=
<identifier> "(" <argument_list_opt> ")"

<argument_list_opt> ::=
<argument_list> | ε

<argument_list> ::=
<expression>
| <expression> "," <argument_list>

<expression> ::=
<logical_or_expression>

<logical_or_expression> ::=
<logical_and_expression>
| <logical_and_expression> "||" <logical_or_expression>

<logical_and_expression> ::=
<equality_expression>
| <equality_expression> "&&" <logical_and_expression>

<equality_expression> ::=
<relational_expression>
| <relational_expression> "==" <equality_expression>
| <relational_expression> "!=" <equality_expression>

<relational_expression> ::=
<additive_expression>
| <additive_expression> "<" <relational_expression>
| <additive_expression> ">" <relational_expression>
| <additive_expression> "<=" <relational_expression>
| <additive_expression> ">=" <relational_expression>

<additive_expression> ::=
<multiplicative_expression>
| <multiplicative_expression> "+" <additive_expression>
| <multiplicative_expression> "-" <additive_expression>

<multiplicative_expression> ::=
<unary_expression>
| <unary_expression> "*" <multiplicative_expression>
| <unary_expression> "/" <multiplicative_expression>

<unary_expression> ::=
"!" <primary>
| <primary>

<primary> ::=
<identifier>
| <int_literal>
| <float_literal>
| <string_literal>
| <char_literal>
| <boolean_literal>
| "(" <expression> ")"
| <function_call>

<boolean_literal> ::=
"fresh" | "stale"

<identifier> ::=
letter (letter | digit | "_")*

<int_literal> ::=
digit+

<float_literal> ::=
digit+ "." digit+

<string_literal> ::=
""" <character_sequence> """

<char_literal> ::=
"'" <character> "'"

<comment> ::=
<single_line_comment>
| <multi_line_comment>

---

### 📌 Note

The BNF grammar above defines the **syntactic structure** of the CHEF language.  
In **Part 1 of the project**, only the **lexical analyzer (lexer)** is implemented using **Flex**.  
Parsing and semantic analysis will be implemented in later stages.

## Design Decisions
- Cooking-themed keywords were selected to make the language unique.
- Boolean values are represented by fresh and stale.
- The lexical analyzer prints token names for validation.
- Each literal type is separately tokenized.

## Build & Run

### Prerequisites
Make sure you have the following tools installed on your system:
- flex
- gcc
- make

### Building the Project
To generate and compile the lexical analyzer, run the following command in the project directory:

    make

### Running the Analyzer
You can test the lexer using the provided example programs:

    ./chef_lexer exampleprog1.chef
    ./chef_lexer exampleprog2.chef
