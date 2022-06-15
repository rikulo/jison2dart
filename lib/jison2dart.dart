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

//typedef Match InjectMatch(String key, String input);
//typedef T InjectFunction<T>(JisonParser self, String input);

//S cast<S>(value) => value as S;

/// The base class of the parser.
/// By default, [DefaultJisonParser] is used.
/// 
/// If you prefer to provide your own implementation of [getParseErrorMessage]
/// and [getParseErrorMessage], you extend from [JisonParser] by specifying
/// `@extends YourClass`.
/// 
/// If you'd like to extend from [JisonParser], you have to do:
/// 
///     %class abstract YourAbstractParser
///     %extends JisonParser
/// 
/// Then, you have to implement [getParseErrorMessage] and [getParseErrorMessage].
abstract class JisonParser {
  Object parse(String input);

  /// Retrieves the error message for a parser error.
  /// 
  /// - [input] the substring that the error was detected.
  /// - [matched] the substring that was parsed successfully.
  ///   It includes [match].
  /// - [match] the latest matched token.
  String getParserErrorMessage(int lineNo,
      String input, String matched, String match,
      List<String> expected, String unexpected);
  /// Retrieves the error message for a lexer error.
  /// 
  /// - [input] the substring that the error was detected.
  /// - [matched] the substring that was parsed successfully.
  ///   It includes [match].
  /// - [match] the latest matched token.
  /// Currently, it is always empty since we don't support *flex* option.
  String getLexerErrorMessage(int lineNo,
      String input, String matched, String match);
}

/// A mixin providing the default implementation of [getParserErrorMessage]
/// and [getLexerErrorMessage] for [JisonParser].
/// Example: [DefaultJisonParser].
mixin JisonParserMixin {
  String getParserErrorMessage(int lineNo,
      String input, String matched, String match,
      List<String> expected, String unexpected)
  => 'Line $lineNo:\n${ShowPosition(input, matched, match).show()}\nExpecting \'${expected.join('\', \'')}\', got \'$unexpected\'';

  String getLexerErrorMessage(int lineNo,
      String input, String matched, String match)
  => 'Line $lineNo:\n${ShowPosition(input, matched, match).show()}\nUnrecognized text.';
}

/// The default base class for the generated parser.
/// It extends [JisonParser] to generate the error message.
abstract class DefaultJisonParser extends JisonParser
with JisonParserMixin {
}

class ParserLocation {
  int firstLine;
  int lastLine;
  int firstColumn;
  int lastColumn;

  ParserLocation(
      [this.firstLine = 1,
      this.lastLine = 0,
      this.firstColumn = 1,
      this.lastColumn = 0]);

  ParserLocation clone() {
    return ParserLocation(firstLine, lastLine, firstColumn, lastColumn);
  }
}

class ParserValue {
  int length;
  late ParserLocation loc;
  int lineNo;
  var text; //its type depends on parser's action
  List? stack;
  List? vstack;
  List? lstack;
  int? yystate;
  var $;

  ParserValue([this.length = 0, this.lineNo = 0]);

  ParserValue clone() {
    var clone = ParserValue(length, lineNo);
    clone.loc = loc.clone();
    clone.text = text;
    clone.$ = $;
    return clone;
  }
}

class LexerConditions {
  final List<int> rules;
  final bool inclusive;

  const LexerConditions(this.rules, this.inclusive);
}

class ParserProduction {
  final int length;
  final ParserSymbol symbol;

  const ParserProduction(this.symbol, [this.length = 0]);
}

class ParserCachedAction {
  final ParserAction? action;
  final ParserSymbol? symbol;

  const ParserCachedAction(this.action, [this.symbol]);
}

class ParserAction {
  final int action;
  final ParserState? state;
  final String? symbol;

  const ParserAction(this.action, [this.state, this.symbol]);
}

class ParserSymbol {
  final String name;
  final int index;
  //Map<int, ParserSymbol> symbols = {};
  //Map<String, ParserSymbol> symbolsByName = {};

  const ParserSymbol(this.name, this.index);

  //void addAction(ParserSymbol $a) {
  //  symbols[$a.index] = symbolsByName[$a.name] = $a;
  //}
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
  Map<int, ParserAction> actions = const {};

  ParserState(this.index);

  void setActions(Map<int, ParserAction> actions) {
    this.actions = actions;
  }
}

//class ParserRange {
//  int x;
//  int y;
//
//  ParserRange(this.x, this.y);
//}

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
