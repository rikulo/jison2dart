
// Jison2dart generated parser

// ignore_for_file: directive_after_declaration
// ignore_for_file: return_of_invalid_type, argument_type_not_assignable, non_bool_condition
// ignore_for_file: non_bool_operand, variable_type_mismatch, switch_expression_not_assignable
// ignore_for_file: annotate_overrides, unused_local_variable, camel_case_types

import 'package:jison2dart/jison2dart.dart';



class StringParser extends DefaultJisonParser {
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
  //late InjectMatch getMatch;

  

  //void trace() {
  //}

  StringParser() {
    //Setup Parser
    
var 			$symbol0 = ParserSymbol('accept', 0);
var 			$symbol1 = ParserSymbol('end', 1);
var 			$symbol2 = ParserSymbol('error', 2);
var 			$symbol3 = ParserSymbol('expressions', 3);
var 			$symbol4 = ParserSymbol('e', 4);
var 			$symbol5 = ParserSymbol('EOF', 5);
var 			$symbol6 = ParserSymbol('STRING', 6);
var 			$symbol7 = ParserSymbol('NEWLINE_IN_STRING', 7);
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
			symbols['STRING'] = $symbol6;
			symbols[7] = $symbol7;
			symbols['NEWLINE_IN_STRING'] = $symbol7;

			terminals = {
					2: $symbol2,
					5: $symbol5,
					6: $symbol6,
					7: $symbol7
				};

var			$table0 = ParserState(0);
var			$table1 = ParserState(1);
var			$table2 = ParserState(2);
var			$table3 = ParserState(3);
var			$table4 = ParserState(4);
var			$table5 = ParserState(5);

var			$tableDefinition0 = {
				
					3: ParserAction(none, $table1),
					4: ParserAction(none, $table2),
					6: ParserAction(shift, $table3)
				};

var			$tableDefinition1 = {
				
					1: ParserAction(accept)
				};

var			$tableDefinition2 = {
				
					5: ParserAction(shift, $table4),
					7: ParserAction(shift, $table5)
				};

var			$tableDefinition3 = {
				
					5: ParserAction(reduce, $table2),
					7: ParserAction(reduce, $table2)
				};

var			$tableDefinition4 = {
				
					1: ParserAction(reduce, $table1)
				};

var			$tableDefinition5 = {
				
					5: ParserAction(reduce, $table3),
					7: ParserAction(reduce, $table3)
				};

			$table0.setActions($tableDefinition0);
			$table1.setActions($tableDefinition1);
			$table2.setActions($tableDefinition2);
			$table3.setActions($tableDefinition3);
			$table4.setActions($tableDefinition4);
			$table5.setActions($tableDefinition5);

			table = {
				
					0: $table0,
					1: $table1,
					2: $table2,
					3: $table3,
					4: $table4,
					5: $table5
				};

			defaultActions = {
				
					4: ParserAction(reduce, $table1)
				};

			productions = {
				
					0: ParserProduction($symbol0),
					1: ParserProduction($symbol3,2),
					2: ParserProduction($symbol4,1),
					3: ParserProduction($symbol4,2)
				};




    //Setup Lexer
    
			_rules = {
				
					0: RegExp(r'''^(?:\s+)''', caseSensitive: true),
					1: RegExp(r'''^(?:\[\]                  begin\(string\);\n<string>\[\^\n*)''', caseSensitive: true),
					2: RegExp(r'''^(?:[\n])''', caseSensitive: true),
					3: RegExp(r'''^(?:$)''', caseSensitive: true),
					4: RegExp(r'''^(?:["])''', caseSensitive: true),
					5: RegExp(r'''^(?:[.\n]+)''', caseSensitive: true),
					6: RegExp(r'''^(?:$)''', caseSensitive: true),
					7: RegExp(r'''^(?:.)''', caseSensitive: true)
				};

			_conditions = {
				
					'string': LexerConditions([ 2,3,4], false),
					'INITIAL': LexerConditions([ 0,1,5,6,7], true)
				};


  }
  parserPerformAction($thisS, $yy, int $yystate, $s, $o) {
    
/* this == yyval */


switch ($yystate) {
case 1:
 return $s[$o-1]; 

case 2:
$thisS.$ = $s[$o];
break;
case 3:
$thisS.$ = $s[$o-1] + '\n';
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

  @override
  Object parse(String $input) {
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
            _input, matched, match, $expected,
            terminals[$symbol!.index] != null ? terminals[$symbol.index].name : 'NOTHING');
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
          var $len = productions[$action.state.index].len;
          // perform semantic action
          $_yy = ParserValue();
          $_yy.$ = $_yy.text = $len == 0 ? null : $vstack[$vstack.length - ($len as int)];// default to $S = $1
          // default location, uses first token for firsts, last for lasts
          // ignore: undefined_identifier

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
  static final eof = ParserSymbol('Eof', 1);

  late ParserValue yy;
  var match = '',
    matched = '',
    _rules = <int, dynamic>{},
    _conditions = <String, LexerConditions>{},
    done = false,
    _more = false;
  final _conditionStack = <String>[];
  late String _input;
  //late int _offset;

  void setInput(String $input) {
    _input = $input;
    _more = done = false;
    matched = match = '';
    yy = ParserValue();
    _conditionStack..clear()..add('INITIAL');
    // ignore: undefined_identifier
    yy.loc = ParserLocation();
    //_offset = 0;
  }

  String input() {
    var ch = _input[0];
    yy.text += ch;
    yy.leng++;
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
    // ignore: undefined_identifier

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
    var r = yy.loc.range;
    var oldLinesLength = oldLines[oldLinesCount - linesCount].length;

    yy.loc = ParserLocation(
        yy.loc.firstLine,
        yy.lineNo,
        yy.loc.firstColumn,
        (lines.isEmpty ?
            (linesCount == oldLinesCount ? yy.loc.firstColumn : 0) + oldLinesLength:
            yy.loc.firstColumn - len)
    );
    // ignore: undefined_identifier
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

    var $rules = currentRules();
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
        // ignore: undefined_identifier
        //if (options['flex'] != true) {
          break;
        //}
      }
    }

    if ($match != null) {
      $token = testMatch($match, $rules[$index!]);
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

  // test the lexed token: return FALSE when not a match, otherwise return token
  Object testMatch(Match $match, int $ruleIndex) {
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

    yy.leng = yy.text.length as int;
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

  Object lexerLex() {
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

  List<int> currentRules() => _conditions[_conditionStack.last]!.rules;

  // ignore: avoid_init_to_null
  dynamic _lexerPerformAction(yy, int $avoidingNameCollisions, String $YY_START) {
    
;
switch($avoidingNameCollisions) {
case 0:/* skip whitespace */
break;
case 1:return "STRING";

case 2:return "NEWLINE_IN_STRING";

case 3:return "EOF_IN_STRING";

case 4:popState();
break;
case 5:/* skip over text not in quotes */
break;
case 6:return "EOF";

case 7:return 'INVALID';

}

  }
}
