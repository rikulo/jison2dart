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

typedef Match InjectMatch(String key, String input);
typedef T InjectFunction<T>(JisonParser self, String input);

S cast<S>(value) => value as S;

abstract class JisonParser {
  dynamic parse(String input);
}

class ParserLocation {
  int firstLine = 1;
  int lastLine = 0;
  int firstColumn = 1;
  int lastColumn = 0;
  ParserRange range;

  ParserLocation([this.firstLine = 1, this.lastLine = 0, this.firstColumn = 1, this.lastColumn = 0]);

  void Range(ParserRange $range) {
    range = $range;
  }

  ParserLocation clone() {
    return new ParserLocation(firstLine, lastLine, firstColumn, lastColumn);
  }
}

class ParserValue {
  int leng = 0;
  ParserLocation loc;
  int lineNo = 0;
  var text;
  List stack;
  List vstack;
  List lstack;
  int yystate;
  var $;

  ParserValue clone() {
    var clone = new ParserValue();
    clone.leng = leng;
    if (loc != null) {
      clone.loc = loc.clone();
    }
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
  ParserAction action;
  ParserSymbol symbol;

  ParserCachedAction($action, [$symbol]) {
    action = $action as ParserAction;
    symbol = $symbol as ParserSymbol;
  }
}

class ParserAction {
  int action;
  ParserState state;
  String symbol;

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
  String text;
  ParserState state;
  ParserSymbol symbol;
  int lineNo;
  ParserLocation loc;
  List<String> expected;
  String _errStr;

  ParserError(this.text, this.state, this.symbol, this.lineNo, this.loc, this.expected);

  String get errStr => _errStr;
  set errStr(err) => _errStr = err as String;
  String toString() => _errStr;
}

class LexerError extends Error {
  String text;
  int token;
  int lineNo;
  String _errStr;

  LexerError(this.text, this.token, this.lineNo);

  String get errStr => _errStr;
  set errStr(err) => _errStr = err as String;
  String toString() => _errStr;
}

class ParserState {
  int index;
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
