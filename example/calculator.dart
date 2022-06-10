library calculator;
// Jison2dart generated parser

// ignore_for_file: directive_after_declaration, camel_case_types
// ignore_for_file: return_of_invalid_type, argument_type_not_assignable, non_bool_condition
// ignore_for_file: non_bool_operand, variable_type_mismatch, switch_expression_not_assignable

import 'package:jison2dart/jison2dart.dart';


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

class Calculator extends DefaultJisonParser {
  final Map<dynamic, ParserSymbol> _symbols;
  final Map<int, ParserSymbol> _terminals;
  final Map<int, ParserProduction> _productions;
  final Map<int, ParserState> _table;
  final Map<int, ParserAction> _defaultActions;

  //const version = '0.4.17';

  static const int none = 0;
  static const int shift = 1;
  static const int reduce = 2;
  static const int accept = 3;

  

  //void trace() {
  //}

  //Setup Lexer
  
	final _rules = <int, dynamic>{
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

	final _conditions = {
		'INITIAL': LexerConditions([ 0,1,2,3,4,5,6,7,8,9,10], true)
	};



  factory Calculator() {
    //Setup Parser
    
		var $symbol0 = ParserSymbol('accept', 0);
		var $symbol1 = ParserSymbol('end', 1);
		var $symbol2 = ParserSymbol('error', 2);
		var $symbol3 = ParserSymbol('expressions', 3);
		var $symbol4 = ParserSymbol('e', 4);
		var $symbol5 = ParserSymbol('EOF', 5);
		var $symbol6 = ParserSymbol('+', 6);
		var $symbol7 = ParserSymbol('-', 7);
		var $symbol8 = ParserSymbol('*', 8);
		var $symbol9 = ParserSymbol('/', 9);
		var $symbol10 = ParserSymbol('^', 10);
		var $symbol11 = ParserSymbol('(', 11);
		var $symbol12 = ParserSymbol(')', 12);
		var $symbol13 = ParserSymbol('NUMBER', 13);
		var symbols = {
			0: $symbol0,
			'accept': $symbol0,
			1: $symbol1,
			'end': $symbol1,
			2: $symbol2,
			'error': $symbol2,
			3: $symbol3,
			'expressions': $symbol3,
			4: $symbol4,
			'e': $symbol4,
			5: $symbol5,
			'EOF': $symbol5,
			6: $symbol6,
			'+': $symbol6,
			7: $symbol7,
			'-': $symbol7,
			8: $symbol8,
			'*': $symbol8,
			9: $symbol9,
			'/': $symbol9,
			10: $symbol10,
			'^': $symbol10,
			11: $symbol11,
			'(': $symbol11,
			12: $symbol12,
			')': $symbol12,
			13: $symbol13,
			'NUMBER': $symbol13
		};

		var terminals = {
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

		var $table0 = ParserState(0);
		var $table1 = ParserState(1);
		var $table2 = ParserState(2);
		var $table3 = ParserState(3);
		var $table4 = ParserState(4);
		var $table5 = ParserState(5);
		var $table6 = ParserState(6);
		var $table7 = ParserState(7);
		var $table8 = ParserState(8);
		var $table9 = ParserState(9);
		var $table10 = ParserState(10);
		var $table11 = ParserState(11);
		var $table12 = ParserState(12);
		var $table13 = ParserState(13);
		var $table14 = ParserState(14);
		var $table15 = ParserState(15);
		var $table16 = ParserState(16);
		var $table17 = ParserState(17);
		var $table18 = ParserState(18);
		var $table19 = ParserState(19);

		var $tableDefinition0 = {
			3: ParserAction(none, $table1),
			4: ParserAction(none, $table2),
			7: ParserAction(shift, $table3),
			11: ParserAction(shift, $table4),
			13: ParserAction(shift, $table5)
		};

		var $tableDefinition1 = {
			1: ParserAction(accept)
		};

		var $tableDefinition2 = {
			5: ParserAction(shift, $table6),
			6: ParserAction(shift, $table7),
			7: ParserAction(shift, $table8),
			8: ParserAction(shift, $table9),
			9: ParserAction(shift, $table10),
			10: ParserAction(shift, $table11)
		};

		var $tableDefinition3 = {
			4: ParserAction(none, $table12),
			7: ParserAction(shift, $table3),
			11: ParserAction(shift, $table4),
			13: ParserAction(shift, $table5)
		};

		var $tableDefinition4 = {
			4: ParserAction(none, $table13),
			7: ParserAction(shift, $table3),
			11: ParserAction(shift, $table4),
			13: ParserAction(shift, $table5)
		};

		var $tableDefinition5 = {
			5: ParserAction(reduce, $table9),
			6: ParserAction(reduce, $table9),
			7: ParserAction(reduce, $table9),
			8: ParserAction(reduce, $table9),
			9: ParserAction(reduce, $table9),
			10: ParserAction(reduce, $table9),
			12: ParserAction(reduce, $table9)
		};

		var $tableDefinition6 = {
			1: ParserAction(reduce, $table1)
		};

		var $tableDefinition7 = {
			4: ParserAction(none, $table14),
			7: ParserAction(shift, $table3),
			11: ParserAction(shift, $table4),
			13: ParserAction(shift, $table5)
		};

		var $tableDefinition8 = {
			4: ParserAction(none, $table15),
			7: ParserAction(shift, $table3),
			11: ParserAction(shift, $table4),
			13: ParserAction(shift, $table5)
		};

		var $tableDefinition9 = {
			4: ParserAction(none, $table16),
			7: ParserAction(shift, $table3),
			11: ParserAction(shift, $table4),
			13: ParserAction(shift, $table5)
		};

		var $tableDefinition10 = {
			4: ParserAction(none, $table17),
			7: ParserAction(shift, $table3),
			11: ParserAction(shift, $table4),
			13: ParserAction(shift, $table5)
		};

		var $tableDefinition11 = {
			4: ParserAction(none, $table18),
			7: ParserAction(shift, $table3),
			11: ParserAction(shift, $table4),
			13: ParserAction(shift, $table5)
		};

		var $tableDefinition12 = {
			5: ParserAction(reduce, $table7),
			6: ParserAction(reduce, $table7),
			7: ParserAction(reduce, $table7),
			8: ParserAction(reduce, $table7),
			9: ParserAction(reduce, $table7),
			10: ParserAction(reduce, $table7),
			12: ParserAction(reduce, $table7)
		};

		var $tableDefinition13 = {
			6: ParserAction(shift, $table7),
			7: ParserAction(shift, $table8),
			8: ParserAction(shift, $table9),
			9: ParserAction(shift, $table10),
			10: ParserAction(shift, $table11),
			12: ParserAction(shift, $table19)
		};

		var $tableDefinition14 = {
			5: ParserAction(reduce, $table2),
			6: ParserAction(reduce, $table2),
			7: ParserAction(reduce, $table2),
			8: ParserAction(shift, $table9),
			9: ParserAction(shift, $table10),
			10: ParserAction(shift, $table11),
			12: ParserAction(reduce, $table2)
		};

		var $tableDefinition15 = {
			5: ParserAction(reduce, $table3),
			6: ParserAction(reduce, $table3),
			7: ParserAction(reduce, $table3),
			8: ParserAction(shift, $table9),
			9: ParserAction(shift, $table10),
			10: ParserAction(shift, $table11),
			12: ParserAction(reduce, $table3)
		};

		var $tableDefinition16 = {
			5: ParserAction(reduce, $table4),
			6: ParserAction(reduce, $table4),
			7: ParserAction(reduce, $table4),
			8: ParserAction(reduce, $table4),
			9: ParserAction(reduce, $table4),
			10: ParserAction(shift, $table11),
			12: ParserAction(reduce, $table4)
		};

		var $tableDefinition17 = {
			5: ParserAction(reduce, $table5),
			6: ParserAction(reduce, $table5),
			7: ParserAction(reduce, $table5),
			8: ParserAction(reduce, $table5),
			9: ParserAction(reduce, $table5),
			10: ParserAction(shift, $table11),
			12: ParserAction(reduce, $table5)
		};

		var $tableDefinition18 = {
			5: ParserAction(reduce, $table6),
			6: ParserAction(reduce, $table6),
			7: ParserAction(reduce, $table6),
			8: ParserAction(reduce, $table6),
			9: ParserAction(reduce, $table6),
			10: ParserAction(reduce, $table6),
			12: ParserAction(reduce, $table6)
		};

		var $tableDefinition19 = {
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

		var table = {
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

		var defaultActions = {
			6: ParserAction(reduce, $table1)
		};

		var productions = {
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


    return Calculator._(symbols, terminals, table, defaultActions, productions);
  }

  Calculator._(this._symbols, this._terminals, this._table, this._defaultActions, this._productions);

  dynamic _parserPerformAction(ParserValue $thisS, ParserValue $yy, int $yystate, List $s, int $o) {
    
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

  dynamic _lexerPerformAction(ParserValue yy, int $avoidingNameCollisions, String $YY_START) {
    
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

  ParserSymbol _parserLex() {
    var token = _lexerLex(); // $end = 1

    if (token is num) {
      final symbol = _symbols[token];
      if (symbol != null) {
        return symbol;
      }
    }

    return _symbols['end']!;
  }

  @override
  Object parse(String $input) {
    var $firstAction = ParserAction(0, _table[0] as ParserState);
    var $firstCachedAction = ParserCachedAction($firstAction);
    var $stack = [$firstCachedAction];
    var $vstack = <dynamic>[null]; //its type depends on parser's action
    var $yy;
    ParserValue? $_yy;
    var $recovering = 0;
    ParserSymbol? $symbol;
    var $action;
    String $errStr = '';
    var $preErrorSymbol;

    _setInput($input);

    while (true) {
      // retrieve state number from top of stack
      var $state = $stack.last.action!.state;
      // use default actions if available
      if ($state != null && _defaultActions[$state.index] != null) {
        $action = _defaultActions[$state.index];
      } else {
        $symbol ??= _parserLex();

        // read action for current state and first input
        if ($state != null && $state.actions[$symbol.index] != null) {
          //$action = _table[$state][$symbol];
          $action = $state.actions[$symbol.index];
        } else {
          $action = null;
        }
      }

      if ($action == null) {
        if ($recovering == 0) {
          // Report error
          var $expected = <String>[];
          _table[$state!.index]!.actions.forEach(($k, $v) {
            final terminal = _terminals[$k];
            if (terminal != null && $k > 2) {
                $expected.add(terminal.name);
            }
          });

          final terminal = _terminals[$symbol!.index];
          $errStr = getParserErrorMessage(yy.lineNo + 1,
            _input, matched, match, $expected,
            terminal != null ? terminal.name : 'NOTHING');
          throw ParserError($errStr,
              match, $state, $symbol, yy.lineNo, yy.loc, $expected);
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
          var $len = _productions[$action.state.index]!.length;
          // perform semantic action
          $_yy = ParserValue();
          $_yy.$ = $_yy.text = $len == 0 ? null : $vstack[$vstack.length - $len];// default to $S = $1
          // default location, uses first token for firsts, last for lasts

          yy.yystate = $action.state.index as int;
          var $r = _parserPerformAction($_yy, $yy, $action.state.index, $vstack, $vstack.length - 1);

          if ($r != null) {
            if ($r is ParserValue) return $r.$;
            return $r;
          }

          // pop off stack
          while ($len > 0) {
            $len--;
            $stack.removeLast();
            $vstack.removeLast();
          }

          $vstack.add($_yy.$);

          var $nextSymbol = _productions[$action.state.index]!.symbol;
          // goto new state = _table[STATE][NONTERMINAL]
          var $nextState = $stack.last.action!.state!;
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
  static final eof = ParserSymbol('Eof', 1);

  late ParserValue yy;
  var match = '',
    matched = '',
    done = false,
    _more = false;
  final _conditionStack = <String>[];
  late String _input;
  //late int _offset;

  void _setInput(String $input) {
    _input = $input;
    _more = done = false;
    matched = match = '';
    yy = ParserValue();
    _conditionStack..clear()..add('INITIAL');
    yy.loc = ParserLocation();
    //_offset = 0;
  }

  String input() {
    var ch = _input[0];
    yy.text += ch;
    yy.length++;
    //_offset++;
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

    _input = _input.substring(1);
    return ch;
  }

  void unput(String $ch) {
    var len = $ch.length;
    var lines = $ch.split( RegExp(r'(?:\r\n?|\n)'));
    var linesCount = lines.length;

    _input = $ch + _input;
    yy.text = yy.text.substring(0, len - 1);
    //yylen -= $len;
    //_offset -= len;
    var oldLines = match.split( RegExp(r'(?:\r\n?|\n)'));
    var oldLinesCount = oldLines.length;
    match = match.substring(0, match.length - 1);
    matched = matched.substring(0, matched.length - 1);

    if ((linesCount - 1) > 0) yy.lineNo -= linesCount - 1;
    var oldLinesLength = oldLines[oldLinesCount - linesCount].length;

    yy.loc = ParserLocation(
        yy.loc.firstLine,
        yy.lineNo,
        yy.loc.firstColumn,
        (lines.isEmpty ?
            (linesCount == oldLinesCount ? yy.loc.firstColumn : 0) + oldLinesLength:
            yy.loc.firstColumn - len)
    );
  }

  void more() {
    _more = true;
  }
  void less(int n) {
    this.unput(match.substring(n));
  }

  Object next() {
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

    var $rules = _currentRules();
    int? $index;
    Match? $match;
    var $token;
    for (var $i = 0, $j = $rules.length; $i < $j; $i++) {
      Match? $tempMatch;
      final rule = _rules[$rules[$i]];
      if (rule is InjectFunction) {
        $tempMatch = cast(rule(this, _input));
      } else {
        $tempMatch = (rule as RegExp).firstMatch(_input);
      }
      if ($tempMatch != null && (match.isEmpty == true || $tempMatch.group(0)!.length > $match!.group(0)!.length)) {
        $match = $tempMatch;
        $index = $i;
        //if (options['flex'] != true) {
          break;
        //}
      }
    }

    if ($match != null) {
      $token = _testMatch($match, $rules[$index!]);
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
        getLexerErrorMessage(yy.lineNo + 1, _input, matched, match),
          yy.lineNo);
    }
  }

  /// test the lexed token: return FALSE when not a match, otherwise return token
  Object _testMatch(Match $match, int $ruleIndex) {
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
    match += $match[0]!;
//  matches = $match;
    matched += $match[0]!;

    yy.length = yy.text.length as int;
    _more = false;
    _input = _input.substring($matchCount);
    var $nextCondition = _conditionStack.last;

    var $token = _lexerPerformAction(yy, $ruleIndex, $nextCondition);

    if (done == true && _input.isNotEmpty) {
      done = false;
    }

    if ($token != null) {
      return $token;
    } else {
      return false;
    }
  }

  Object _lexerLex() {
    var $r = next();

    while ((/*$r == null ||*/ $r == false) && !done) {
      $r = next();
    }

    return $r;
  }

  void begin(String $condition) {
    _conditionStack.add($condition);
  }

  String popState() {
    if (_conditionStack.length > 1) {
      return _conditionStack.removeLast();
    }
    return _conditionStack[0];
  }

  void pushState(String $condition) {
    begin($condition);
  }

  List<int> _currentRules() => _conditions[_conditionStack.last]!.rules;
}
