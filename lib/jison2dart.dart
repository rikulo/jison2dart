/** 
 * jison2dart.dart
 *
 * Purpose:
 *
 * Description:
 *
 * History:
 *    24/11/2016, Created by jumperchen
 *
 * Copyright (C) 2016 Potix Corporation. All Rights Reserved.
 */
library jison2dart;

import 'dart:math' as math;

typedef Match InjectMatch(String key, String input);
typedef T InjectFunction<T>(JisonParser self, String input);

S cast<S>(value) => value as S;

/// The base class of the parser.
/// By default, [DefaultJisonParser] is used.
/// 
/// If you prefer to provide your own implementation of [getParseErrorMessage]
/// and [getParseErrorMessage], you extend from [JisonParser] and then
/// specify your class with `@extends`.
abstract class JisonParser {
  dynamic parse(String input);

  /// Retrieves the error message for a parser error.
  String getParserErrorMessage(int lineNo,
      String input, String matched, String match,
      List<String> expected, String unexpected);
  /// Retrieves the error message for a lexer error.
  String getLexerErrorMessage(int lineNo,
      String input, String matched, String match);
}

/// The default base class for the generated parser.
/// It extends [JisonParser] to generate the error message.
abstract class DefaultJisonParser extends JisonParser {
  @override
  String getParserErrorMessage(int lineNo,
      String input, String matched, String match,
      List<String> expected, String unexpected)
  => 'Line $lineNo:\n${ShowPosition(input, matched, match).show()}\nExpecting \'${expected.join('\', \'')}\', got \'$unexpected\'';

  @override
  String getLexerErrorMessage(int lineNo,
      String input, String matched, String match,)
  => 'Line $lineNo:\n${ShowPosition(input, matched, match).show()}\nUnrecognized text.';
  //reject:
  // 'You can only invoke reject() when the lexer'
  // 'is of the backtracking persuasion (options.backtrack_lexer = true)'
}

class ParserLocation {
  int firstLine = 1;
  int lastLine = 0;
  int firstColumn = 1;
  int lastColumn = 0;
  late ParserRange range;

  ParserLocation(
      [this.firstLine = 1,
      this.lastLine = 0,
      this.firstColumn = 1,
      this.lastColumn = 0]);

  void setRange(ParserRange $range) {
    range = $range;
  }

  ParserLocation clone() {
    return ParserLocation(firstLine, lastLine, firstColumn, lastColumn);
  }
}

class ParserValue {
  int leng = 0;
  late ParserLocation loc;
  int lineNo = 0;
  var text;
  List? stack;
  List? vstack;
  List? lstack;
  int? yystate;
  var $;

  ParserValue clone() {
    var clone = ParserValue();
    clone.leng = leng;
    clone.loc = loc.clone();
    clone.lineNo = lineNo;
    clone.text = text;
    clone.$ = $;
    return clone;
  }
}

class LexerConditions {
  List<int> rules;
  bool inclusive;

  LexerConditions(this.rules, this.inclusive);
}

class ParserProduction {
  int len = 0;
  ParserSymbol symbol;

  ParserProduction(this.symbol, [this.len = 0]);
}

class ParserCachedAction {
  ParserAction? action;
  ParserSymbol? symbol;

  ParserCachedAction(this.action, [this.symbol]);
}

class ParserAction {
  int action;
  ParserState? state;
  String? symbol;

  ParserAction(this.action, [this.state, this.symbol]);
}

class ParserSymbol {
  String name;
  int index = -1;
  Map symbols = {};
  Map symbolsByName = {};

  ParserSymbol(this.name, this.index);

  void addAction($a) {
    symbols[$a.index] = symbolsByName[$a.name] = $a;
  }
}

class ParserError extends Error {
  /// The error message.
  final String message;
  /// The source text causing the error.
  final String text;
  final ParserState state;
  final ParserSymbol symbol;
  final int lineNo;
  final ParserLocation loc;
  final List<String> expected;

  ParserError(this.message, this.text, this.state, this.symbol, this.lineNo, this.loc, this.expected);

  @override
  String toString() => message;
}

class LexerError extends Error {
  final String message;
  final int lineNo;

  LexerError(this.message, this.lineNo);

  @override
  String toString() => message;
}

class ParserState {
  final int index;
  Map<int, ParserAction> actions = {};

  ParserState(this.index);

  void setActions(Map<int, ParserAction> actions) {
    this.actions = actions;
  }
}

class ParserRange {
  int x;
  int y;

  ParserRange(this.x, this.y);
}

class ShowPosition {
  final String input, matched, match;

  ShowPosition(this.input, this.matched, this.match);

  String pastInput() {
    var past = matched.substring(0, (matched.length - match.length));
    return (past.length > 20 ? '...' : '') + past.replaceAll('\n', '');
  }

  String upcomingInput() {
    var next = match;
    if (next.length < 20) {
      next += input.substring(0, math.min(20 - next.length, input.length));
    }
    return (next.substring(0, math.min(20, next.length)) + (next.length > 20 ? '...' : '')).replaceAll('\n', '');
  }

  /// Shows the position.
  String show() {
    var pre = pastInput();
    var c = '';
    for(var i = 0, $preLength = pre.length; i < $preLength; i++) {
      c += '-';
    }
    return '$pre${upcomingInput()}\n$c^';
  }
}
