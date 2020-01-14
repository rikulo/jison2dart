
/* Jison generated parser */
// ignore_for_file: undefined_identifier, undefined_class, directive_after_declaration
// ignore_for_file: return_of_invalid_type, argument_type_not_assignable, non_bool_condition
// ignore_for_file: non_bool_operand, variable_type_mismatch, switch_expression_not_assignable
// ignore_for_file: unused_import, annotate_overrides, unused_local_variable, camel_case_types

import 'dart:math' as math;
import 'dart:collection';
import 'package:jison2dart/jison2dart.dart';


import "dart:math";
import "package:test/test.dart";

void main() {
    final calc = new Calculator();
    test("Calc", () {
        expect(calc.parse("3 + 5 * 2"), 13);
    });
}

class Calculator extends JisonParser {
    Map symbols = {};
    Map terminals = {};
    Map productions = {};
    Map table = {};
    Map defaultActions = {};
    String version = '0.4.17';
    bool debug = false;
    int none = 0;
    int shift = 1;
    int reduce = 2;
    int accept = 3;
    bool backtrack;
    InjectMatch getMatch;
    Map data = {};

    Map<String, bool> options = {};

    

    void trace() {
    }

    Calculator() {
        //Setup Parser
        
var 			$symbol0 = new ParserSymbol('accept', 0);
var 			$symbol1 = new ParserSymbol('end', 1);
var 			$symbol2 = new ParserSymbol('error', 2);
var 			$symbol3 = new ParserSymbol('expressions', 3);
var 			$symbol4 = new ParserSymbol('e', 4);
var 			$symbol5 = new ParserSymbol('EOF', 5);
var 			$symbol6 = new ParserSymbol('+', 6);
var 			$symbol7 = new ParserSymbol('-', 7);
var 			$symbol8 = new ParserSymbol('*', 8);
var 			$symbol9 = new ParserSymbol('/', 9);
var 			$symbol10 = new ParserSymbol('^', 10);
var 			$symbol11 = new ParserSymbol('(', 11);
var 			$symbol12 = new ParserSymbol(')', 12);
var 			$symbol13 = new ParserSymbol('NUMBER', 13);
			symbols[0] = $symbol0;
			symbols['accept'] = $symbol0;
			symbols[1] = $symbol1;
			symbols['end'] = $symbol1;
			symbols[2] = $symbol2;
			symbols['error'] = $symbol2;
			symbols[3] = $symbol3;
			symbols['expressions'] = $symbol3;
			symbols[4] = $symbol4;
			symbols['e'] = $symbol4;
			symbols[5] = $symbol5;
			symbols['EOF'] = $symbol5;
			symbols[6] = $symbol6;
			symbols['+'] = $symbol6;
			symbols[7] = $symbol7;
			symbols['-'] = $symbol7;
			symbols[8] = $symbol8;
			symbols['*'] = $symbol8;
			symbols[9] = $symbol9;
			symbols['/'] = $symbol9;
			symbols[10] = $symbol10;
			symbols['^'] = $symbol10;
			symbols[11] = $symbol11;
			symbols['('] = $symbol11;
			symbols[12] = $symbol12;
			symbols[')'] = $symbol12;
			symbols[13] = $symbol13;
			symbols['NUMBER'] = $symbol13;

			terminals = {
					2: $symbol2,
					5: $symbol5,
					6: $symbol6,
					7: $symbol7,
					8: $symbol8,
					9: $symbol9,
					10: $symbol10,
					11: $symbol11,
					12: $symbol12,
					13: $symbol13
				};

var			$table0 = new ParserState(0);
var			$table1 = new ParserState(1);
var			$table2 = new ParserState(2);
var			$table3 = new ParserState(3);
var			$table4 = new ParserState(4);
var			$table5 = new ParserState(5);
var			$table6 = new ParserState(6);
var			$table7 = new ParserState(7);
var			$table8 = new ParserState(8);
var			$table9 = new ParserState(9);
var			$table10 = new ParserState(10);
var			$table11 = new ParserState(11);
var			$table12 = new ParserState(12);
var			$table13 = new ParserState(13);
var			$table14 = new ParserState(14);
var			$table15 = new ParserState(15);
var			$table16 = new ParserState(16);
var			$table17 = new ParserState(17);
var			$table18 = new ParserState(18);
var			$table19 = new ParserState(19);

var			$tableDefinition0 = {
				
					3: new ParserAction(none, $table1),
					4: new ParserAction(none, $table2),
					7: new ParserAction(shift, $table3),
					11: new ParserAction(shift, $table4),
					13: new ParserAction(shift, $table5)
				};

var			$tableDefinition1 = {
				
					1: new ParserAction(accept)
				};

var			$tableDefinition2 = {
				
					5: new ParserAction(shift, $table6),
					6: new ParserAction(shift, $table7),
					7: new ParserAction(shift, $table8),
					8: new ParserAction(shift, $table9),
					9: new ParserAction(shift, $table10),
					10: new ParserAction(shift, $table11)
				};

var			$tableDefinition3 = {
				
					4: new ParserAction(none, $table12),
					7: new ParserAction(shift, $table3),
					11: new ParserAction(shift, $table4),
					13: new ParserAction(shift, $table5)
				};

var			$tableDefinition4 = {
				
					4: new ParserAction(none, $table13),
					7: new ParserAction(shift, $table3),
					11: new ParserAction(shift, $table4),
					13: new ParserAction(shift, $table5)
				};

var			$tableDefinition5 = {
				
					5: new ParserAction(reduce, $table9),
					6: new ParserAction(reduce, $table9),
					7: new ParserAction(reduce, $table9),
					8: new ParserAction(reduce, $table9),
					9: new ParserAction(reduce, $table9),
					10: new ParserAction(reduce, $table9),
					12: new ParserAction(reduce, $table9)
				};

var			$tableDefinition6 = {
				
					1: new ParserAction(reduce, $table1)
				};

var			$tableDefinition7 = {
				
					4: new ParserAction(none, $table14),
					7: new ParserAction(shift, $table3),
					11: new ParserAction(shift, $table4),
					13: new ParserAction(shift, $table5)
				};

var			$tableDefinition8 = {
				
					4: new ParserAction(none, $table15),
					7: new ParserAction(shift, $table3),
					11: new ParserAction(shift, $table4),
					13: new ParserAction(shift, $table5)
				};

var			$tableDefinition9 = {
				
					4: new ParserAction(none, $table16),
					7: new ParserAction(shift, $table3),
					11: new ParserAction(shift, $table4),
					13: new ParserAction(shift, $table5)
				};

var			$tableDefinition10 = {
				
					4: new ParserAction(none, $table17),
					7: new ParserAction(shift, $table3),
					11: new ParserAction(shift, $table4),
					13: new ParserAction(shift, $table5)
				};

var			$tableDefinition11 = {
				
					4: new ParserAction(none, $table18),
					7: new ParserAction(shift, $table3),
					11: new ParserAction(shift, $table4),
					13: new ParserAction(shift, $table5)
				};

var			$tableDefinition12 = {
				
					5: new ParserAction(reduce, $table7),
					6: new ParserAction(reduce, $table7),
					7: new ParserAction(reduce, $table7),
					8: new ParserAction(reduce, $table7),
					9: new ParserAction(reduce, $table7),
					10: new ParserAction(reduce, $table7),
					12: new ParserAction(reduce, $table7)
				};

var			$tableDefinition13 = {
				
					6: new ParserAction(shift, $table7),
					7: new ParserAction(shift, $table8),
					8: new ParserAction(shift, $table9),
					9: new ParserAction(shift, $table10),
					10: new ParserAction(shift, $table11),
					12: new ParserAction(shift, $table19)
				};

var			$tableDefinition14 = {
				
					5: new ParserAction(reduce, $table2),
					6: new ParserAction(reduce, $table2),
					7: new ParserAction(reduce, $table2),
					8: new ParserAction(shift, $table9),
					9: new ParserAction(shift, $table10),
					10: new ParserAction(shift, $table11),
					12: new ParserAction(reduce, $table2)
				};

var			$tableDefinition15 = {
				
					5: new ParserAction(reduce, $table3),
					6: new ParserAction(reduce, $table3),
					7: new ParserAction(reduce, $table3),
					8: new ParserAction(shift, $table9),
					9: new ParserAction(shift, $table10),
					10: new ParserAction(shift, $table11),
					12: new ParserAction(reduce, $table3)
				};

var			$tableDefinition16 = {
				
					5: new ParserAction(reduce, $table4),
					6: new ParserAction(reduce, $table4),
					7: new ParserAction(reduce, $table4),
					8: new ParserAction(reduce, $table4),
					9: new ParserAction(reduce, $table4),
					10: new ParserAction(shift, $table11),
					12: new ParserAction(reduce, $table4)
				};

var			$tableDefinition17 = {
				
					5: new ParserAction(reduce, $table5),
					6: new ParserAction(reduce, $table5),
					7: new ParserAction(reduce, $table5),
					8: new ParserAction(reduce, $table5),
					9: new ParserAction(reduce, $table5),
					10: new ParserAction(shift, $table11),
					12: new ParserAction(reduce, $table5)
				};

var			$tableDefinition18 = {
				
					5: new ParserAction(reduce, $table6),
					6: new ParserAction(reduce, $table6),
					7: new ParserAction(reduce, $table6),
					8: new ParserAction(reduce, $table6),
					9: new ParserAction(reduce, $table6),
					10: new ParserAction(reduce, $table6),
					12: new ParserAction(reduce, $table6)
				};

var			$tableDefinition19 = {
				
					5: new ParserAction(reduce, $table8),
					6: new ParserAction(reduce, $table8),
					7: new ParserAction(reduce, $table8),
					8: new ParserAction(reduce, $table8),
					9: new ParserAction(reduce, $table8),
					10: new ParserAction(reduce, $table8),
					12: new ParserAction(reduce, $table8)
				};

			$table0.setActions($tableDefinition0);
			$table1.setActions($tableDefinition1);
			$table2.setActions($tableDefinition2);
			$table3.setActions($tableDefinition3);
			$table4.setActions($tableDefinition4);
			$table5.setActions($tableDefinition5);
			$table6.setActions($tableDefinition6);
			$table7.setActions($tableDefinition7);
			$table8.setActions($tableDefinition8);
			$table9.setActions($tableDefinition9);
			$table10.setActions($tableDefinition10);
			$table11.setActions($tableDefinition11);
			$table12.setActions($tableDefinition12);
			$table13.setActions($tableDefinition13);
			$table14.setActions($tableDefinition14);
			$table15.setActions($tableDefinition15);
			$table16.setActions($tableDefinition16);
			$table17.setActions($tableDefinition17);
			$table18.setActions($tableDefinition18);
			$table19.setActions($tableDefinition19);

			table = {
				
					0: $table0,
					1: $table1,
					2: $table2,
					3: $table3,
					4: $table4,
					5: $table5,
					6: $table6,
					7: $table7,
					8: $table8,
					9: $table9,
					10: $table10,
					11: $table11,
					12: $table12,
					13: $table13,
					14: $table14,
					15: $table15,
					16: $table16,
					17: $table17,
					18: $table18,
					19: $table19
				};

var			defaultActions = {
				
					6: new ParserAction(reduce, $table1)
				};

			productions = {
				
					0: new ParserProduction($symbol0),
					1: new ParserProduction($symbol3,2),
					2: new ParserProduction($symbol4,3),
					3: new ParserProduction($symbol4,3),
					4: new ParserProduction($symbol4,3),
					5: new ParserProduction($symbol4,3),
					6: new ParserProduction($symbol4,3),
					7: new ParserProduction($symbol4,2),
					8: new ParserProduction($symbol4,3),
					9: new ParserProduction($symbol4,1)
				};




        //Setup Lexer
        
			rules = {
				
					0: new RegExp(r'''^(?:\s+)''', caseSensitive: true),
					1: new RegExp(r'''^(?:[0-9]+(\.[0-9]+)?\b)''', caseSensitive: true),
					2: new RegExp(r'''^(?:\*)''', caseSensitive: true),
					3: new RegExp(r'''^(?:\/)''', caseSensitive: true),
					4: new RegExp(r'''^(?:-)''', caseSensitive: true),
					5: new RegExp(r'''^(?:\+)''', caseSensitive: true),
					6: new RegExp(r'''^(?:\^)''', caseSensitive: true),
					7: new RegExp(r'''^(?:\()''', caseSensitive: true),
					8: new RegExp(r'''^(?:\))''', caseSensitive: true),
					9: new RegExp(r'''^(?:$)''', caseSensitive: true),
					10: new RegExp(r'''^(?:.)''', caseSensitive: true)
				};

			conditions = {
				
					'INITIAL': new LexerConditions([ 0,1,2,3,4,5,6,7,8,9,10], true)
				};


    }
    parserPerformAction($thisS, $yy, int $yystate, $s, $o) {
        
/* this == yyval */


switch ($yystate) {
case 1:
 return $s[$o-1]; 
break;
case 2:
$thisS.$ = $s[$o-2]+$s[$o];
break;
case 3:
$thisS.$ = $s[$o-2]-$s[$o];
break;
case 4:
$thisS.$ = $s[$o-2]*$s[$o];
break;
case 5:
$thisS.$ = $s[$o-2]/$s[$o];
break;
case 6:
$thisS.$ = math.pow($s[$o-2], $s[$o]);
break;
case 7:
$thisS.$ = -$s[$o];
break;
case 8:
$thisS.$ = $s[$o-1];
break;
case 9:
$thisS.$ = num.parse($thisS.text);
break;
}

    }

    ParserSymbol parserLex() {
        var token = lexerLex(); // $end = 1

        if (token != null) {
            if (token is num) {
                if (symbols[token] != null) {
                    return symbols[token] as ParserSymbol;
                }
            }
        }

        return symbols['end'] as ParserSymbol;
    }

    void parseError(String $str, ParserError $hash) {
        $hash.errStr = $str;
        throw $hash;
    }

    void lexerError(String $str, LexerError $hash) {
        $hash.errStr = $str;
        throw $hash;
    }

    parse(String $input) {
        if (table.isEmpty) {
            throw new Exception('Empty Table');
        }
        eof = new ParserSymbol('Eof', 1);
        var $firstAction = new ParserAction(0, table[0] as ParserState);
        var $firstCachedAction = new ParserCachedAction($firstAction);
        var $stack = [$firstCachedAction];
        var $vstack = <dynamic>[null];
        var $yy;
        ParserValue $_yy;
        var $recovering = 0;
        ParserSymbol $symbol;
        var $action;
        String $errStr = '';
        var $preErrorSymbol;

        setInput($input);

        while (true) {
            // retrieve state number from top of stack
           var  $state = $stack[$stack.length - 1].action.state;
            // use default actions if available
            if ($state != null && defaultActions[$state.index] != null) {
                $action = defaultActions[$state.index];
            } else {
                if ($symbol == null) {
                    $symbol = parserLex();
                }
                // read action for current state and first input
                if ($state != null && $state.actions[$symbol.index] != null) {
                    //$action = table[$state][$symbol];
                    $action = $state.actions[$symbol.index];
                } else {
                    $action = null;
                }
            }

            if ($action == null) {
                if ($recovering == 0) {
                    // Report error
                    var $expected = <String>[];
                    table[$state.index].actions.forEach(($k, $v) {
                        if (terminals[$k] != null && $k as num > 2) {
                            $expected.add(terminals[$k].name as String);
                        }
                    });

                    $errStr = 'Parse error on line ${yy.lineNo + 1}:\n${showPosition()} \nExpecting  \'${$expected.join('\', \'')}\', got \''
                        '${terminals[$symbol.index] != null ? terminals[$symbol.index].name : 'NOTHING'}\'';


                    parseError($errStr, new ParserError(match as String, $state, $symbol, yy.lineNo, yy.loc, $expected));
                }
            }

            if ($state == null || $action == null) {
                break;
            }

            switch ($action.action as int) {
                case 1:
                    // shift
                    //shiftCount++;
                    $stack.add(new ParserCachedAction($action, $symbol));

                    $vstack.add(yy.text);

                    $symbol = null;
                    if ($preErrorSymbol == null) { // normal execution/no error
                        $yy = yy.clone();
                        if ($recovering > 0) $recovering--;
                    } else { // error just occurred, resume old look ahead f/ before error
                        $symbol = $preErrorSymbol as ParserSymbol;
                        $preErrorSymbol = null;
                    }
                    break;

                case 2:
                    // reduce
                    var $len = productions[$action.state.index].len;
                    // perform semantic action
                    $_yy = new ParserValue();
                    $_yy.$ = $_yy.text = $len == 0 ? null : $vstack[$vstack.length - ($len as int)];// default to $S = $1
                    // default location, uses first token for firsts, last for lasts
                    // ignore: undefined_identifier
                    if (options['ranges'] == true) {
                        //TODO: add ranges
                        throw new UnimplementedError('Not supported in dart version');
                    }

                    yy.yystate = $action.state.index as int;
                    var $r = parserPerformAction($_yy, $yy, $action.state.index, $vstack, $vstack.length - 1);

                    if ($r != null) {
                        if ($r is ParserValue) return $r.$;
                        return $r;
                    }

                    // pop off stack
                    while ($len as int > 0) {
                        $len--;

                        $stack.removeLast();

                        $vstack.removeLast();
                    }

                    if ($_yy == null) {
                        $vstack.add(null);
                    } else {
                        $vstack.add($_yy.$);
                    }

                    var $nextSymbol = productions[$action.state.index].symbol;
                    // goto new state = table[STATE][NONTERMINAL]
                    var $nextState = $stack[$stack.length - 1].action.state;
                    var $nextAction = $nextState.actions[$nextSymbol.index];

                    $stack.add(new ParserCachedAction($nextAction, $nextSymbol));


                    yy.stack = $stack;
                    yy.vstack = $vstack;
                    break;

                case 3:
                    // accept
                    return true;
            }

        }

        return true;
    }


    /* Jison generated lexer */
    ParserSymbol eof;
    ParserValue yy;
    dynamic match = '';
    String matched = '';
    List conditionStack = [];
    Map<int, dynamic> rules = {};
    Map<String, LexerConditions> conditions = {};
    bool done = false;
    bool _more;
    String _input;
    int offset;
    dynamic ranges;
    bool flex = false;

    void setInput(String $input) {
        _input = $input;
        _more = this.backtrack = done = false;
        matched = match = '';
        yy = new ParserValue();
        conditionStack = ['INITIAL'];
        // ignore: undefined_identifier
        if (options['ranges'] == true) {
            var loc = yy.loc = new ParserLocation();
            loc.Range(new ParserRange(0, 0));
        } else {
            yy.loc = new ParserLocation();
        }
        offset = 0;
    }

    String input() {
        var ch = _input[0];
        yy.text += ch;
        yy.leng++;
        offset++;
        match += ch;
        matched += ch;
        RegExp regex = new RegExp(r'(?:\r\n?|\n).*');
        Iterable<Match> lines = regex.allMatches(ch);
        if (lines.length > 0) {
            yy.lineNo++;
            yy.loc.lastLine++;
        } else {
            yy.loc.lastColumn++;
        }
        // ignore: undefined_identifier
        if (options['ranges'] == true) {
            yy.loc.range.y++;
        }

        _input = _input.substring(1);
        return ch;
    }

    unput(String $ch) {
        var len = $ch.length;
        var lines = $ch.split(new RegExp(r'(?:\r\n?|\n)'));
        var linesCount = lines.length;

        _input = $ch + _input;
        yy.text = yy.text.substring(0, len - 1);
        //yylen -= $len;
        offset -= len;
        var oldLines = match.split(new RegExp(r'(?:\r\n?|\n)'));
        var oldLinesCount = oldLines.length;
        match = match.substring(0, match.length - 1);
        matched = matched.substring(0, matched.length - 1);

        if ((linesCount - 1) > 0) yy.lineNo -= linesCount - 1;
        var r = yy.loc.range;
        var oldLinesLength = (oldLines[oldLinesCount - linesCount]) != null ?
            oldLines[oldLinesCount - linesCount].length : 0;

        yy.loc = new ParserLocation(
            yy.loc.firstLine,
            yy.lineNo,
            yy.loc.firstColumn,
            (lines.isEmpty ?
                (linesCount == oldLinesCount ? yy.loc.firstColumn : 0) + (oldLinesLength as int):
                yy.loc.firstColumn - len)
        );
        // ignore: undefined_identifier
        if (options['ranges'] == true) {
            yy.loc.range = new ParserRange(r.x, r.x + yy.leng - len);
        }
    }

    void more() {
        _more = true;
    }
    void reject() {
        // ignore: undefined_identifier
        if (options['backtrack_lexer'] == true) {
            this.backtrack = true;
        } else {
            lexerError('Lexical error on line ${yy.lineNo + 1}. '
            'You can only invoke reject() in the lexer when the lexer'
            'is of the backtracking persuasion (options.backtrack_lexer = true).\n'
                + showPosition(), new LexerError('', -1, yy.lineNo));
        }
    }

    void less(int n) {
        this.unput((this.match as String).substring(n));
    }

    String pastInput() {
        var past = matched.substring(0, (matched.length - (match as String).length));
        return (past.length > 20 ? '...' : '') + past.replaceAll('\n', '');
    }

    String upcomingInput() {
        var next = match as String;
        if (next.length < 20) {
            next += _input.substring(0, math.min(20 - next.length, _input.length));
        }
        return (next.substring(0, math.min(20, next.length)) + (next.length > 20 ? '...' : '')).replaceAll('\n', '');
    }

    String showPosition() {
        var pre = pastInput();

        var c = '';
        for(var i = 0, $preLength = pre.length; i < $preLength; i++) {
            c += '-';
        }
        return '$pre${upcomingInput()}\n$c^';
    }

    next() {
        if (done == true) {
            return eof;
        }

        if (_input.isEmpty) {
            done = true;
        }

        if (!_more) {
            yy.text = '';
            match = '';
        }

        var $rules = currentRules();
        int $index;
        Match $match;
        var $token;
        for (var $i = 0, $j = $rules.length as int; $i < $j; $i++) {
            Match $tempMatch;
            final rule = rules[$rules[$i]];
            if (rule is InjectFunction) {
              $tempMatch = cast(rule(this, _input));
            } else {
                $tempMatch = (rule as RegExp).firstMatch(_input);
            }
            if ($tempMatch != null && (match.isEmpty == true || $tempMatch.group(0).length > $match.group(0).length)) {
                $match = $tempMatch;
                $index = $i;
                // ignore: undefined_identifier
                if (options['backtrack_lexer'] == true) {
                    $token = testMatch($tempMatch, $rules[$i] as int);
                    if ($token != false) {
                        return $token;
                    } else if (this.backtrack) {
                        $match = null;
                        continue; // rule action called reject() implying a rule MISmatch.
                    } else {
                        // else: this is a lexer rule which consumes input without producing a token (e.g. whitespace)
                        return false;
                    }
                // ignore: undefined_identifier
                } else if (options['flex'] != true) {
                    break;
                }
            }
        }
        if ($match != null) {
            $token = testMatch($match, $rules[$index] as int);
            if ($token != false) {
                return $token;
            }
            // else: this is a lexer rule which consumes input without producing a token (e.g. whitespace)
            return false;
        }

        if (_input.isEmpty) {
            return eof;
        } else {
            lexerError('Lexical error on line ${yy.lineNo + 1}. Unrecognized text.\n' + showPosition(), new LexerError('', -1, yy.lineNo));
            return null;
        }
    }

    // test the lexed token: return FALSE when not a match, otherwise return token
    testMatch(Match $match, int $ruleIndex) {
        Map<String, dynamic> backup;
        // ignore: undefined_identifier
        if (options['backtrack_lexer'] == true) {
            // save context
            backup = {
                'yy': this.yy.clone(),
                'match': this.match,
                'matched': this.matched,
                'offset': this.offset,
                '_more': this._more,
                '_input': this._input,
                'conditionStack': this.conditionStack.toList(),
                'done': this.done
            };
        }
        int $matchCount = $match.group(0).length;
        var $lineCount = new RegExp(r'(?:\r\n?|\n).*').firstMatch($match.group(0));
        var $line = $lineCount != null ? $lineCount.group(0) : '';
        yy.lineNo += $lineCount != null ? $lineCount.groupCount : 0;

        yy.loc = new ParserLocation(
            yy.loc.lastLine,
            yy.lineNo + 1,
            yy.loc.lastColumn,
            ($lineCount != null && $lineCount.groupCount > 0 ?
            $line.length - new RegExp(r'\r?\n?').firstMatch($line).groupCount :
            yy.loc.lastColumn + $matchCount
            )
        );


        yy.text += $match[0];
        match += $match[0];
//            matches = $match;
        matched += $match[0];

        yy.leng = yy.text.length as int;
        if (ranges != null) {
            yy.loc.range = new ParserRange(offset, offset += yy.leng);
        }
        _more = false;
        backtrack = false;
        _input = _input.substring($matchCount);
        var $nextCondition = conditionStack[conditionStack.length - 1];

        var $token = LexerPerformAction(yy, $ruleIndex, $nextCondition);

        if (done == true && _input.isNotEmpty) {
            done = false;
        }
        try {
            if ($token != null) {
                return $token;
            } else if (this.backtrack) {
                backup.forEach((k, v) {
                    switch (k) {
                        case 'yy':
                            this.yy = v as ParserValue;
                            break;
                        case 'match':
                            this.match = v;
                            break;
                        case 'matched':
                            this.matched = v as String;
                            break;
                        case 'offset':
                            this.offset = v as int;
                            break;
                        case '_more':
                            this._more = v as bool;
                            break;
                        case '_input':
                            this._input = v as String;
                            break;
                        case 'conditionStack':
                            this.conditionStack = v as List;
                            break;
                        case 'done':
                            this.done = v as bool;
                            break;
                        default:
                            throw new UnsupportedError('Key is unknown [$k]');
                    }
                });
                return false; // rule action called reject() implying the next rule should be tested instead.
            } else {
                return false;
            }
        } finally { // extra feature
            if (data['backtrack'] == true) {
                backup.forEach((k, v) {
                    switch (k) {
                        case 'yy':
                            this.yy = v as ParserValue;
                            break;
                        case 'match':
                            this.match = v;
                            break;
                        case 'matched':
                            this.matched = v as String;
                            break;
                        case 'offset':
                            this.offset = v as int;
                            break;
                        case '_more':
                            this._more = v as bool;
                            break;
                        case '_input':
                            this._input = v as String;
                            break;
                        case 'conditionStack':
                            this.conditionStack = v as List;
                            break;
                        case 'done':
                            this.done = v as bool;
                            break;
                        default:
                            throw new UnsupportedError('Key is unknown [$k]');
                    }
                });
                popState();
                data['backtrack'] = false;
            }
        }
    }
    lexerLex() {
        var $r = next();

        while (($r == null || $r == false) && !done) {
            $r = next();
        }

        return $r;
    }

    begin($condition) {
        conditionStack.add($condition);
    }

    popState() {
        var n = conditionStack.length - 1;
        if (n > 0) {
            return conditionStack.removeLast();
        }
        return conditionStack[0];
    }

    void pushState($condition) {
        this.begin($condition);
    }

    currentRules() {
        if (this.conditionStack.length > 0 && this.conditionStack[this.conditionStack.length - 1] != null) {
            return this.conditions[this.conditionStack[this.conditionStack.length - 1]].rules;
        } else {
            return this.conditions["INITIAL"].rules;
        }
    }

    // ignore: avoid_init_to_null
    LexerPerformAction(yy, int $avoidingNameCollisions, [$YY_START = null]) {
        
;
switch($avoidingNameCollisions) {
case 0:/* skip whitespace */
break;
case 1:return 13;
break;
case 2:return 8;
break;
case 3:return 9;
break;
case 4:return 7;
break;
case 5:return 6;
break;
case 6:return 10;
break;
case 7:return 11;
break;
case 8:return 12;
break;
case 9:return 5;
break;
case 10:return 'INVALID';
break;
}

    }
}
