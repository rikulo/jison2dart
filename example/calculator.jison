/* description: Parses and executes mathematical expressions. */
%library calculator

/* test code in Dart */
%{
import "dart:math" as math;
import "package:test/test.dart";

void main() {
  final calc = Calculator();
  test("Calc", () {
    expect(calc.parse("3 + 5 * 2"), 13);
    expect(calc.parse("3 + 5 * (2 + 1)"), 18);

    try {
      calc.parse("3 + 5 *");
      assert(false, "WRONG");
    } catch (ex) {
      print(ex);
    }

    try {
      calc.parse("3 + 5 7");
      assert(false, "WRONG");
    } catch (ex) {
      print(ex);
    }
  });
}
%}

/* lexical grammar */
%lex
%%

\s+                   /* skip whitespace */
[0-9]+("."[0-9]+)?\b  return 'NUMBER'
"*"                   return '*'
"/"                   return '/'
"-"                   return '-'
"+"                   return '+'
"^"                   return '^'
"("                   return '('
")"                   return ')'
<<EOF>>               return 'EOF'
.                     return 'INVALID'

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
    : e '+' e
        {$$ = $1+$3;}
    | e '-' e
        {$$ = $1-$3;}
    | e '*' e
        {$$ = $1*$3;}
    | e '/' e
        {$$ = $1/$3;}
    | e '^' e
        {$$ = math.pow($1, $3);}
    | '-' e %prec UMINUS
        {$$ = -$2;}
    | '(' e ')'
        {$$ = $2;}
    | NUMBER
        {$$ = num.parse($yytext);}
    ;

