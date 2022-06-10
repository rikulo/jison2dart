%class StringParser

/* lexical grammar */
%lex
%x string
%%

\s+                   /* skip whitespace */
\["]                  begin("string");
<string>[^"\n]*       return "STRING";
<string>[\n]          return "NEWLINE_IN_STRING";
<string><<EOF>>       return "EOF_IN_STRING";
<string>["]           popState();
[.\n]+                /* skip over text not in quotes */
<<EOF>>               return "EOF";
.                     return 'INVALID';

/lex

/* operator associations and precedence */

%left '+' '-'
%left '*' '/'
%left '^'
%left UMINUS

%start expressions

%% /* language grammar */

expressions
    : e EOF
        { return $1; }
    ;
e
    : 'STRING'
        {$$ = $1;}
    | e "NEWLINE_IN_STRING"
        {$$ = $1 + '\n';}
    ;
