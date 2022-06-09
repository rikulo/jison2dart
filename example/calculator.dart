library calculator;
// Jison2dart generated parser

// ignore_for_file: directive_after_declaration
// ignore_for_file: return_of_invalid_type, argument_type_not_assignable, non_bool_condition
// ignore_for_file: non_bool_operand, variable_type_mismatch, switch_expression_not_assignable
// ignore_for_file: annotate_overrides, unused_local_variable, camel_case_types

import 'package:jison2dart/jison2dart.dart';


import "dart:math" as math;
import "package:test/test.dart";

void main() {
  final calc = Calculator();
  test("Calc", () {
    expect(calc.parse("3 + 5 * 2"), 13);
    expect(calc.parse("3 + 5 * (2 + 1)"), 18);
  });
}

class Calculator extends DefaultJisonParser {
  Map symbols = {};
  Map terminals = {};
  Map productions = {};
  Map table = {};
  Map defaultActions = {};
  //String version = '0.4.17';
  //bool debug = false;
  static const int none = 0;
  static const int shift = 1;
  static const int reduce = 2;
  static const int accept = 3;
  late bool backtrack;
  //late InjectMatch getMatch;
  Map data = {};

  Map<String, bool> options = {};

  

  //void trace() {
  //}

  Calculator() {
    //Setup Parser
    
var 			$symbol0 = ParserSymbol('accept', 0);
var 			$symbol1 = ParserSymbol('end', 1);
var 			$symbol2 = ParserSymbol('error', 2);
var 			$symbol3 = ParserSymbol('expressions', 3);
var 			$symbol4 = ParserSymbol('e', 4);
var 			$symbol5 = ParserSymbol('EOF', 5);
var 			$symbol6 = ParserSymbol('+', 6);
var 			$symbol7 = ParserSymbol('-', 7);
var 			$symbol8 = ParserSymbol('*', 8);
var 			$symbol9 = ParserSymbol('/', 9);
var 			$symbol10 = ParserSymbol('^', 10);
var 			$symbol11 = ParserSymbol('(', 11);
var 			$symbol12 = ParserSymbol(')', 12);
var 			$symbol13 = ParserSymbol('NUMBER', 13);
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

var			$table0 = ParserState(0);
var			$table1 = ParserState(1);
var			$table2 = ParserState(2);
var			$table3 = ParserState(3);
var			$table4 = ParserState(4);
var			$table5 = ParserState(5);
var			$table6 = ParserState(6);
var			$table7 = ParserState(7);
var			$table8 = ParserState(8);
var			$table9 = ParserState(9);
var			$table10 = ParserState(10);
var			$table11 = ParserState(11);
var			$table12 = ParserState(12);
var			$table13 = ParserState(13);
var			$table14 = ParserState(14);
var			$table15 = ParserState(15);
var			$table16 = ParserState(16);
var			$table17 = ParserState(17);
var			$table18 = ParserState(18);
var			$table19 = ParserState(19);

var			$tableDefinition0 = {
				
					3: ParserAction(none, $table1),
					4: ParserAction(none, $table2),
					7: ParserAction(shift, $table3),
					11: ParserAction(shift, $table4),
					13: ParserAction(shift, $table5)
				};

var			$tableDefinition1 = {
				
					1: ParserAction(accept)
				};

var			$tableDefinition2 = {
				
					5: ParserAction(shift, $table6),
					6: ParserAction(shift, $table7),
					7: ParserAction(shift, $table8),
					8: ParserAction(shift, $table9),
					9: ParserAction(shift, $table10),
					10: ParserAction(shift, $table11)
				};

var			$tableDefinition3 = {
				
					4: ParserAction(none, $table12),
					7: ParserAction(shift, $table3),
					11: ParserAction(shift, $table4),
					13: ParserAction(shift, $table5)
				};

var			$tableDefinition4 = {
				
					4: ParserAction(none, $table13),
					7: ParserAction(shift, $table3),
					11: ParserAction(shift, $table4),
					13: ParserAction(shift, $table5)
				};

var			$tableDefinition5 = {
				
					5: ParserAction(reduce, $table9),
					6: ParserAction(reduce, $table9),
					7: ParserAction(reduce, $table9),
					8: ParserAction(reduce, $table9),
					9: ParserAction(reduce, $table9),
					10: ParserAction(reduce, $table9),
					12: ParserAction(reduce, $table9)
				};

var			$tableDefinition6 = {
				
					1: ParserAction(reduce, $table1)
				};

var			$tableDefinition7 = {
				
					4: ParserAction(none, $table14),
					7: ParserAction(shift, $table3),
					11: ParserAction(shift, $table4),
					13: ParserAction(shift, $table5)
				};

var			$tableDefinition8 = {
				
					4: ParserAction(none, $table15),
					7: ParserAction(shift, $table3),
					11: ParserAction(shift, $table4),
					13: ParserAction(shift, $table5)
				};

var			$tableDefinition9 = {
				
					4: ParserAction(none, $table16),
					7: ParserAction(shift, $table3),
					11: ParserAction(shift, $table4),
					13: ParserAction(shift, $table5)
				};

var			$tableDefinition10 = {
				
					4: ParserAction(none, $table17),
					7: ParserAction(shift, $table3),
					11: ParserAction(shift, $table4),
					13: ParserAction(shift, $table5)
				};

var			$tableDefinition11 = {
				
					4: ParserAction(none, $table18),
					7: ParserAction(shift, $table3),
					11: ParserAction(shift, $table4),
					13: ParserAction(shift, $table5)
				};

var			$tableDefinition12 = {
				
					5: ParserAction(reduce, $table7),
					6: ParserAction(reduce, $table7),
					7: ParserAction(reduce, $table7),
					8: ParserAction(reduce, $table7),
					9: ParserAction(reduce, $table7),
					10: ParserAction(reduce, $table7),
					12: ParserAction(reduce, $table7)
				};

var			$tableDefinition13 = {
				
					6: ParserAction(shift, $table7),
					7: ParserAction(shift, $table8),
					8: ParserAction(shift, $table9),
					9: ParserAction(shift, $table10),
					10: ParserAction(shift, $table11),
					12: ParserAction(shift, $table19)
				};

var			$tableDefinition14 = {
				
					5: ParserAction(reduce, $table2),
					6: ParserAction(reduce, $table2),
					7: ParserAction(reduce, $table2),
					8: ParserAction(shift, $table9),
					9: ParserAction(shift, $table10),
					10: ParserAction(shift, $table11),
					12: ParserAction(reduce, $table2)
				};

var			$tableDefinition15 = {
				
					5: ParserAction(reduce, $table3),
					6: ParserAction(reduce, $table3),
					7: ParserAction(reduce, $table3),
					8: ParserAction(shift, $table9),
					9: ParserAction(shift, $table10),
					10: ParserAction(shift, $table11),
					12: ParserAction(reduce, $table3)
				};

var			$tableDefinition16 = {
				
					5: ParserAction(reduce, $table4),
					6: ParserAction(reduce, $table4),
					7: ParserAction(reduce, $table4),
					8: ParserAction(reduce, $table4),
					9: ParserAction(reduce, $table4),
					10: ParserAction(shift, $table11),
					12: ParserAction(reduce, $table4)
				};

var			$tableDefinition17 = {
				
					5: ParserAction(reduce, $table5),
					6: ParserAction(reduce, $table5),
					7: ParserAction(reduce, $table5),
					8: ParserAction(reduce, $table5),
					9: ParserAction(reduce, $table5),
					10: ParserAction(shift, $table11),
					12: ParserAction(reduce, $table5)
				};

var			$tableDefinition18 = {
				
					5: ParserAction(reduce, $table6),
					6: ParserAction(reduce, $table6),
					7: ParserAction(reduce, $table6),
					8: ParserAction(reduce, $table6),
					9: ParserAction(reduce, $table6),
					10: ParserAction(reduce, $table6),
					12: ParserAction(reduce, $table6)
				};

var			$tableDefinition19 = {
				
					5: ParserAction(reduce, $table8),
					6: ParserAction(reduce, $table8),
					7: ParserAction(reduce, $table8),
					8: ParserAction(reduce, $table8),
					9: ParserAction(reduce, $table8),
					10: ParserAction(reduce, $table8),
					12: ParserAction(reduce, $table8)
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

			defaultActions = {
				
					6: ParserAction(reduce, $table1)
				};

			productions = {
				
					0: ParserProduction($symbol0),
					1: ParserProduction($symbol3,2),
					2: ParserProduction($symbol4,3),
					3: ParserProduction($symbol4,3),
					4: ParserProduction($symbol4,3),
					5: ParserProduction($symbol4,3),
					6: ParserProduction($symbol4,3),
					7: ParserProduction($symbol4,2),
					8: ParserProduction($symbol4,3),
					9: ParserProduction($symbol4,1)
				};




    //Setup Lexer
    
			rules = {
				
					0: RegExp(r'''^(?:\s+)''', caseSensitive: true),
					1: RegExp(r'''^(?:[0-9]+(\.[0-9]+)?\b)''', caseSensitive: true),
					2: RegExp(r'''^(?:\*)''', caseSensitive: true),
					3: RegExp(r'''^(?:\/)''', caseSensitive: true),
					4: RegExp(r'''^(?:-)''', caseSensitive: true),
					5: RegExp(r'''^(?:\+)''', caseSensitive: true),
					6: RegExp(r'''^(?:\^)''', caseSensitive: true),
					7: RegExp(r'''^(?:\()''', caseSensitive: true),
					8: RegExp(r'''^(?:\))''', caseSensitive: true),
					9: RegExp(r'''^(?:$)''', caseSensitive: true),
					10: RegExp(r'''^(?:.)''', caseSensitive: true)
				};

			conditions = {
				
					'INITIAL': LexerConditions([ 0,1,2,3,4,5,6,7,8,9,10], true)
				};


  }
  parserPerformAction($thisS, $yy, int $yystate, $s, $o) {
    
/* this == yyval */


switch ($yystate) {
case 1:
 return $s[$o-1]; 

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

    if (token is num) {
      final symbol = symbols[token];
      if (symbol != null) {
        return symbol as ParserSymbol;
      }
    }

    return symbols['end'] as ParserSymbol;
  }

  dynamic parse(String $input) {
    if (table.isEmpty) {
      throw StateError('Empty');
    }
    eof = ParserSymbol('Eof', 1);
    var $firstAction = ParserAction(0, table[0] as ParserState);
    var $firstCachedAction = ParserCachedAction($firstAction);
    var $stack = [$firstCachedAction];
    var $vstack = <dynamic>[null];
    var $yy;
    ParserValue? $_yy;
    var $recovering = 0;
    ParserSymbol? $symbol;
    var $action;
    String $errStr = '';
    var $preErrorSymbol;

    setInput($input);

    while (true) {
     // retrieve state number from top of stack
     var $state = $stack[$stack.length - 1].action!.state;
      // use default actions if available
      if ($state != null && defaultActions[$state.index] != null) {
        $action = defaultActions[$state.index];
      } else {
        $symbol ??= parserLex();

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
          table[$state!.index].actions.forEach(($k, $v) {
            if (terminals[$k] != null && $k as num > 2) {
                $expected.add(terminals[$k].name as String);
            }
          });

          $errStr = getParserErrorMessage(yy.lineNo + 1,
            _input, matched, match as String, $expected,
            terminals[$symbol!.index] != null ? terminals[$symbol.index].name : 'NOTHING');
          throw ParserError($errStr,
              match as String, $state, $symbol, yy.lineNo, yy.loc, $expected);
        }
      }

      if ($state == null || $action == null) {
        break;
      }

      switch ($action.action as int) {
        case 1:
          //shift
          //shiftCount++;
          $stack.add( ParserCachedAction($action, $symbol));
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
          $_yy = ParserValue();
          $_yy.$ = $_yy.text = $len == 0 ? null : $vstack[$vstack.length - ($len as int)];// default to $S = $1
          // default location, uses first token for firsts, last for lasts
          // ignore: undefined_identifier
          if (options['ranges'] == true) {
            //TODO: add ranges
            throw UnimplementedError('ranges');
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

          $vstack.add($_yy.$);

          var $nextSymbol = productions[$action.state.index].symbol;
          // goto new state = table[STATE][NONTERMINAL]
          var $nextState = $stack[$stack.length - 1].action!.state!;
          var $nextAction = $nextState.actions[$nextSymbol.index];

          $stack.add( ParserCachedAction($nextAction, $nextSymbol));

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
  late ParserSymbol eof;
  late ParserValue yy;
  dynamic match = '';
  String matched = '';
  List conditionStack = [];
  Map<int, dynamic> rules = {};
  Map<String, LexerConditions> conditions = {};
  bool done = false;
  late bool _more;
  late String _input;
  late int offset;
  dynamic ranges;
  bool flex = false;

  void setInput(String $input) {
    _input = $input;
    _more = this.backtrack = done = false;
    matched = match = '';
    yy = ParserValue();
    conditionStack = ['INITIAL'];
    // ignore: undefined_identifier
    if (options['ranges'] == true) {
      var loc = yy.loc = ParserLocation();
      loc.setRange( ParserRange(0, 0));
    } else {
      yy.loc = ParserLocation();
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
    RegExp regex = RegExp(r'(?:\r\n?|\n).*');
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
    var lines = $ch.split( RegExp(r'(?:\r\n?|\n)'));
    var linesCount = lines.length;

    _input = $ch + _input;
    yy.text = yy.text.substring(0, len - 1);
    //yylen -= $len;
    offset -= len;
    var oldLines = match.split( RegExp(r'(?:\r\n?|\n)'));
    var oldLinesCount = oldLines.length;
    match = match.substring(0, match.length - 1);
    matched = matched.substring(0, matched.length - 1);

    if ((linesCount - 1) > 0) yy.lineNo -= linesCount - 1;
    var r = yy.loc.range;
    var oldLinesLength = (oldLines[oldLinesCount - linesCount]) != null ?
      oldLines[oldLinesCount - linesCount].length : 0;

    yy.loc = ParserLocation(
        yy.loc.firstLine,
        yy.lineNo,
        yy.loc.firstColumn,
        (lines.isEmpty ?
            (linesCount == oldLinesCount ? yy.loc.firstColumn : 0) + (oldLinesLength as int):
            yy.loc.firstColumn - len)
    );
    // ignore: undefined_identifier
    if (options['ranges'] == true) {
      yy.loc.range = ParserRange(r.x, r.x + yy.leng - len);
    }
  }

/*
  void more() {
    _more = true;
  }
  void reject() {
    // ignore: undefined_identifier
    if (options['backtrack_lexer'] == true) {
      this.backtrack = true;
    } else {
      throw LexerError(
        getLexerErrorMessage(yy.lineNo + 1, _input, matched, match as String, reject: true),
        yy.lineNo);
    }
  }

  void less(int n) {
    this.unput((this.match as String).substring(n));
  }
*/

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
    int? $index;
    Match? $match;
    var $token;
    for (var $i = 0, $j = $rules.length as int; $i < $j; $i++) {
      Match? $tempMatch;
      final rule = rules[$rules[$i]];
      if (rule is InjectFunction) {
        $tempMatch = cast(rule(this, _input));
      } else {
        $tempMatch = (rule as RegExp).firstMatch(_input);
      }
      if ($tempMatch != null && (match.isEmpty == true || $tempMatch.group(0)!.length > $match!.group(0)!.length)) {
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
      throw LexerError(
        getLexerErrorMessage(yy.lineNo + 1, _input, matched, match as String),
          yy.lineNo);
    }
  }

  // test the lexed token: return FALSE when not a match, otherwise return token
  testMatch(Match $match, int $ruleIndex) {
    late Map<String, dynamic> backup;
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
    int $matchCount = $match.group(0)!.length;
    var $lineCount = RegExp(r'(?:\r\n?|\n).*').firstMatch($match.group(0)!);
    var $line = $lineCount != null ? $lineCount.group(0)! : '';
    yy.lineNo += $lineCount != null ? $lineCount.groupCount : 0;

    yy.loc = ParserLocation(
      yy.loc.lastLine,
      yy.lineNo + 1,
      yy.loc.lastColumn,
      ($lineCount != null && $lineCount.groupCount > 0 ?
      $line.length -  RegExp(r'\r?\n?').firstMatch($line)!.groupCount :
      yy.loc.lastColumn + $matchCount
      )
    );


    yy.text += $match[0];
    match += $match[0];
//  matches = $match;
    matched += $match[0]!;

    yy.leng = yy.text.length as int;
    if (ranges != null) {
      yy.loc.range = ParserRange(offset, offset += yy.leng);
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
              throw UnsupportedError('Unknown $k');
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
              throw UnsupportedError('Unknown $k');
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
      return this.conditions[this.conditionStack[this.conditionStack.length - 1]]!.rules;
    } else {
      return this.conditions["INITIAL"]!.rules;
    }
  }

  // ignore: avoid_init_to_null
  LexerPerformAction(yy, int $avoidingNameCollisions, [$YY_START = null]) {
    
;
switch($avoidingNameCollisions) {
case 0:/* skip whitespace */
break;
case 1:return 13;

case 2:return 8;

case 3:return 9;

case 4:return 7;

case 5:return 6;

case 6:return 10;

case 7:return 11;

case 8:return 12;

case 9:return 5;

case 10:return 'INVALID';

}

  }
}