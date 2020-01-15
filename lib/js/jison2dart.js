var fs = require('fs'),
    util = require('util'),
    path = require('path'),
    Generator = require('jison').Generator;

global.convertToSyntax = function (types, body) {
    if (types['dart'] || types['DART']) {
        return body;
    }
    return '';
};
function puts(error, stdout, stderr) {
    util.puts(stdout);
}

function processInputFile (raw, opts) {
    var fs = require('fs');
    var path = require('path');

    // getting raw files
    var lex;
    // if (opts.lexfile) {
    //     lex = fs.readFileSync(path.normalize(opts.lexfile), 'utf8');
    // }

    var name = path.basename(opts.outfile || opts.file);
    name = name.replace(/\..*$/g, '');
    opts.outfile = opts.outfile || (name + '.dart');

    raw = parseCode(raw, opts);

    if (!opts.class) {
        var ns = name.split(/[-_]/), klass = '';
        for (var i = 0; i < ns.length; ++i)
            klass += ns[i].charAt(0).toUpperCase() + ns[i].substring(1);
        opts.class = klass;
    }
    if (!opts.moduleName) {
        opts.moduleName = opts.class;
    }

    if (!opts.moduleName && name) {
        opts.moduleName = name.replace(/-\w/g,
            function (match) {
                return match.charAt(1).toUpperCase();
            });
    }

    var parser = new Generator(raw, opts);
    fs.writeFileSync(opts.outfile, 
        processToDart(parser, parser.generate(), opts));
}

function parseCode(raw, opts) {
    function parse(begin, end) {
        var i = raw.startsWith(begin) ? 0: raw.indexOf('\n' + begin);
        if (i >= 0) {
            var k = i;
            if (i == 0 && raw[0] != '\n') --i;
            var j = raw.indexOf(end, i += begin.length + 1);
            if (j < 0) {
                if (end != '\n')
                    throw begin + " must end with " + end;
                j = raw.length;
            }

            var found = raw.substring(i, j);
            raw = raw.substring(0, k) + '\n' + raw.substring(j + end.length);
            return found;
        }
    }

    var found = parse('%library', '\n');
    if (found && !opts.library) opts.library = found.trim();

    found = parse('%class', '\n');
    if (found && !opts.class) opts.class = found.trim();

    found = parse('%{', '\n%}');
    if (found) opts.code = found;
    return raw;
}

function generateDart(content, options) {
    var opts = Object.assign({
        'library': '',
        'class': '',
        'file': options.file + '.dart',
        'use': '',
        'type': 'lalr'
    }, options);

    return processInputFile(content, opts);
}

function requireFromString(src, fileName) {
    var Module = module.constructor;
    var m = new Module();
    m._compile(src, fileName);
    return m.exports;
}
function processToDart(parser, parserContent, options) {
    String.prototype.trim = function () {
        return this.replace(/^\s+|\s+$/g, '');
    };

    var fileName = options.file.replace('.jison', ''),
        comments = require(path.resolve(__dirname, './src/comments.js'));

    var Parser = requireFromString(parserContent, fileName + '.js'),
        symbols = Parser.parser.symbols_,
        terminals = Parser.parser.terminals_,
        productions = Parser.parser.productions_,
        table = Parser.parser.table,
        defaultActions = Parser.parser.defaultActions,
        //turn regex into string
        rules = [];

    for (var i = 0; i < Parser.parser.lexer.rules.length; i++) {
        rules.push(Parser.parser.lexer.rules[i].toString());
    }

    var conditions = Parser.parser.lexer.conditions,
        opts = Parser.parser.lexer.options,
        parserPerformAction = Parser.parser.performAction.toString(),
        lexerPerformAction = Parser.parser.lexer.performAction.toString();

    function jsFnBody(str) {
        str = str.split('{');
        str.shift();
        str = str.join('{');

        str = str.split('}');
        str.pop();
        str = str.join('}');

        return str;
    }

    function jsPerformActionToDart(str) {
        str = jsFnBody(str);
        str = str.replace("var $0 = $$.length - 1;", '');
        str = str.replace("var YYSTATE=YY_START", '');
        str = str.replace(new RegExp('[$]0', 'g'), '$o');
        str = str.replace(new RegExp('[$][$]', 'g'), '$s');
        str = str.replace(new RegExp('default[:][;]', 'g'), '');
        str = str.replace(new RegExp('this[.][$]', 'g'), '$thisS.$');
        str = str.replace(new RegExp('this[-][>]', 'g'), '');
        str = str.replace(new RegExp('yystate', 'g'), '$yystate');
        str = str.replace(new RegExp('yy[.][$]yystate', 'g'), 'yy.yystate'); // LexerPerformAction
        //str = str.replace(new RegExp('yytext', 'g'), 'yy->text');
        str = str.replace(new RegExp('[$]yy[_][.]', 'g'), 'yy.');
        str = str.replace(new RegExp('[$]this[-][>]yy[-][>]yy', 'g'), 'yy.');
        str = str.replace(new RegExp('[^yy_\.]yytext', 'g'), '$thisS.text');
        str = str.replace(new RegExp('yy[.]', 'g'), 'yy.');
        str = str.replace(new RegExp('yy_[.][$]', 'g'), 'yy.');
        str = str.replace(new RegExp('yy_\.yytext', 'g'), 'yy.text'); // LexerPerformAction
        str = str.replace(new RegExp('[$]accept', 'g'), 'accept');
        str = str.replace(new RegExp('[$]end', 'g'), 'end');
        str = str.replace(new RegExp('console[.]log'), 'print(');
        str = str.replace(new RegExp('[$]avoiding_name_collisions'), '$avoidingNameCollisions');

        str = comments.parse(str);

        //Add ';' to end a line (JS doesn't need, but Dart does)
        str = str.replace(/([\d'])\n/g, function () {
            return arguments[1] + ';\n';
        });

        return str.replace(/\$/g, '$$$$'); // escape special character in JS replace function
    }

    var parserRaw = fs.readFileSync(__dirname + "/src/dart-template", "utf8");

    function parserInject() {
        var result = '\n';
        this.symbols = [];
        this.symbolsByIndex = [];
        this.tableInstantiation = [];
        this.tableDefinition = [];
        this.tableSetActions = [];
        this.table = [];
        this.terminals = [];
        this.defaultActions = [];
        this.productions = [];

        var actions = [
            'none',
            'shift',
            'reduce',
            'accept'
        ];

        for (var i in symbols) {
            this.symbolsByIndex[symbols[i] * 1] = {
                name: i.replace('$', ''),
                index: symbols[i]
            };
        }

        //console.log(this.symbolsByIndex);

        for (var i in this.symbolsByIndex) {
            var symbol = this.symbolsByIndex[i];
            result += 'var \t\t\t$symbol' + symbol.index + ' = new ParserSymbol(\'' + symbol.name + '\', ' + symbol.index + ');\n';
            this.symbols.push('\t\t\tsymbols[' + symbol.index + '] = $symbol' + symbol.index + '');
            this.symbols.push('\t\t\tsymbols[\'' + symbol.name + '\'] = $symbol' + symbol.index + '');

        }

        result += this.symbols.join(';\n') + ';\n\n';

        for (var i in terminals) {
            this.terminals.push('\t\t\t\t\t' + i + ': $symbol' + i + '');
        }

        result += '\t\t\tterminals = {\n' + this.terminals.join(',\n') + '\n\t\t\t\t};\n\n';

        for (var i in table) {
            var items = [];
            for (var j in table[i]) {
                var item = table[i][j],
                    action = 0,
                    state = 0;
                if (item.join) { //is array
                    if (item.length == 1) {
                        action = item[0];
                        items.push('\t\t\t\t\t' + j + ': new ParserAction(' + actions[action] + ')');
                    } else {
                        action = item[0];
                        state = item[1];
                        items.push('\t\t\t\t\t' + j + ': new ParserAction(' + actions[action] + ', $table' + state + ')');
                    }
                } else {
                    state = item;
                    items.push('\t\t\t\t\t' + j + ': new ParserAction(' + actions[action] + ', $table' + state + ')');
                }
            }

            this.tableInstantiation.push('var\t\t\t$table' + i + ' = new ParserState(' + i + ')');
            this.tableDefinition.push('var\t\t\t$tableDefinition' + i + ' = {\n\t\t\t\t\n' + items.join(',\n') + '\n\t\t\t\t}');
            this.tableSetActions.push('\t\t\t$table' + i + '.setActions($tableDefinition' + i + ')');
            this.table.push('\t\t\t\t\t' + i + ': $table' + i + '');
        }

        result += this.tableInstantiation.join(';\n') + ';\n\n';
        result += this.tableDefinition.join(';\n\n') + ';\n\n';
        result += this.tableSetActions.join(';\n') + ';\n\n';
        result += '\t\t\ttable = {\n\t\t\t\t\n' + this.table.join(',\n') + '\n\t\t\t\t};\n\n';

        for (var i in defaultActions) {
            var action = defaultActions[i][0];
            var state = defaultActions[i][1];
            this.defaultActions.push('\t\t\t\t\t' + i + ': new ParserAction(' + actions[action] + ', $table' + state + ')');
        }

        result += 'var\t\t\tdefaultActions = {\n\t\t\t\t\n' + this.defaultActions.join(',\n') + '\n\t\t\t\t};\n\n';

        for (var i in productions) {
            var production = productions[i];
            if (production.join) {
                var symbol = production[0],
                    len = production[1];
                this.productions.push('\t\t\t\t\t' + i + ': new ParserProduction($symbol' + this.symbolsByIndex[symbol].index + ',' + len + ')');
            } else {
                var symbol = production;
                this.productions.push('\t\t\t\t\t' + i + ': new ParserProduction($symbol' + this.symbolsByIndex[symbol].index + ')');
            }
        }

        result += '\t\t\tproductions = {\n\t\t\t\t\n' + this.productions.join(',\n') + '\n\t\t\t\t};\n\n\n';

        return result;
    }

    function lexerInject() {
        var result = '\n';
            this.rules = [],
            this.conditions = [];

        for (var i in rules) {
            if (rules[i].startsWith('function(')) {
                this.rules.push('\t\t\t\t\t' + i + ': ' + rules[i].substring(8, rules[i].length));
            } else {
                this.rules.push('\t\t\t\t\t' + i + ': new RegExp(r\'\'\'' + rules[i].substring(1, rules[i].length - 1) + '\'\'\', caseSensitive: ' +  (opts['case-insensitive'] != true)  + ')');
            }
        }

        result += '\t\t\trules = {\n\t\t\t\t\n' + this.rules.join(',\n') + '\n\t\t\t\t};\n\n';

        for (var i in conditions) {
            this.conditions.push('\t\t\t\t\t\'' + i + '\': new LexerConditions([ ' + conditions[i].rules.join(',') + '], ' + conditions[i].inclusive + ')');
        }

        return result + '\t\t\tconditions = {\n\t\t\t\t\n' + this.conditions.join(',\n') + '\n\t\t\t\t};\n\n';
    }

    parserRaw = parserRaw
        .simpleReplace('//@@LIBRARY@@', options.library ? 'library ' + options.library + ';' : '')
        .simpleReplace('//@@CODE@@', options.code || '')
        .simpleReplace('/*@@CLASS@@*/', options.class, true/*global*/)
        .simpleReplace('//@@PARSER_MODULE_INJECTION@@', comments.parse(parser.moduleInclude))
        .simpleReplace('//@@OPTIONS_INJECT@@',
            'Map<String, bool> options = ' + JSON.stringify(opts) + ';'
        )
        .simpleReplace('//@@PARSER_INJECT@@',
            parserInject()
        )
        .simpleReplace('//@@LEXER_INJECT@@',
            lexerInject()
        )
        .replace('//@@ParserPerformActionInjection@@',
            jsPerformActionToDart(parserPerformAction)
        )
        .replace('//@@LexerPerformActionInjection@@',
            jsPerformActionToDart(lexerPerformAction, true)
        );
    return parserRaw;
}

function getCommandlineOptions () {
    "use strict";
    var version = require('./package.json').version;
    var opts = require("nomnom")
        .script('jison')
        .option('file', {
            flag : true,
            position : 0,
            help : 'file containing a grammar'
        })
        .option('outfile', {
            abbr : 'o',
            metavar : 'FILE',
            help : 'Filename and base module name of the generated parser'
        })
        .option('library', {
            abbr : 'l',
            metavar : 'LIBRARY',
            help : 'The library of the Dart file'
        })
        .option('class', {
            abbr : 'c',
            metavar : 'CLASS',
            help : "The class's name. If omitted, the output file's name is used."
        })
        .option('version', {
            abbr : 'v',
            flag : true,
            help : 'print version and exit',
            callback : function () {
                return version;
            }
        }).parse();
    return opts;
}

String.prototype.simpleReplace = function (from, to, global) {
    for (var i = 0, val = this;;) {
        i = val.indexOf(from, i);
        if (i < 0) return val;
        val = val.substring(0, i) + to + val.substring(i + from.length);
        if (!global) return val;
        i += to.length;
    }
}

if (require.main === module) {
    var options = getCommandlineOptions() || {};
    if (options.file)
        generateDart(fs.readFileSync(path.normalize(options.file), 'utf8'), options);
    else
        console.log("Specify -h for help.");
}
