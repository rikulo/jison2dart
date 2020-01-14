# jison2dart

Generate Dart parsers using [Jison](https://github.com/zaach/jison).

## Getting Started

First, you have to prepare [Nodejs](https://nodejs.org/en/) for your environment, and install `jison`.

```
git clone git@github.com:rikulo/jison2dart.git
cd jison2dart/lib/js
npm install
```

Then, you can compile a Jison file to a Dart parser. For example,

```
node bison.js examples/caculator.jison
```

For more options, please run

```
node bison.js --help
```

The Dart file will contain a class depending on the jison filename. For example,

```
class Caculator extends JisonParser {

  parse() {
...
```

To use the Dart parser in your application, you have to put `jison2dart` to your `pubspec.yaml`.

Then, you can use the parser. For example,

```
print(new Caculator().parse("2 * 3"));
```


## Special Extensions

### `%library`

Optional. Generates the library statement in the Dart pasrer.

```
%library my.lib
```

### `%class`

Optional. Specfies the name of the Dart pasrer.

```
%class CalcParser
```

### `%code`

Optional. If you'd like to import other libraries or embed Dart codes, you can put the code between `%code` and `%%`.

```
%code
  import "super/foo.dart";

  String camelize(String text) {
    ...
  }
%%
```

## Resources

* [API Reference](http://www.dartdocs.org/documentation/jison2dart/0.1.0)
* [Git Repos](https://github.com/rikulo/jison2dart)

## Who Uses

* [Quire](https://quire.io) - a simple, collaborative, multi-level task management tool.
* [Keikai](https://keikai.io) - a sophisticated spreadsheet for big data
