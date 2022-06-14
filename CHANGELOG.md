# 0.5.7

* `%class` supports `abstract`. Example, `%class abstract YourClass`
* `JisonParserMixin` added.
* Remove `InjectFunction` and `ParserRange`

# 0.5.5

* Remove the support of the `backtrack_lexer`, `flex` and `ranges` options

# 0.5.0

* `JisonParser` adds two methods: `getParserErrorMessage` and `getLexerErrorMessage`. They're used for providing customized messasges, such as I18N.
* `DefaultJisonParser` is added. It is the default base class of the generated Parser.
* `%extends` is supported
    * `%class` doesn't support `extends` any more

# 0.3.0

* Migrate to null-safety

# 0.2.0

* `%class` supports `extends`
* Rename `dison.js` to `jison2dart.js`

# 0.1.1

* Support the prologue: `%{` and `%}`. And, remove the `%code`-`%%` block

# 0.1.0

* First release
