
Talk highlight
------

This is a simple module for converting texts to HTML for forums.  
Markdown is not a good choice for forums, so I'd like to create one.  
As I talked at http://v2ex.com/t/71902 and https://github.com/cnodejs/nodeclub/issues/169

Features:

* Highlight common used keywords for programming languages
* A option list for the strings you want to highlight
* Links will be recognized
* Simple Links of images will be recognized

Notice:

* This is used togather with `white-space: pre-wrap`
* Use monospaced font for contents
* CSS is used to configure the colors

Known problems:

* Keywords like `span` and `class` may fail
* Strings cannot be markuped here

### Usage

Get this module from NPM:

```bash
npm install talk-highlight
```

Use it in your code:

```coffee
{convert} = require 'talk-highlight'

talk = 'hi console.log'

options =
  keyword: 'for console'
  'any-can-be-class': 'CoffeeScript JavaScript'

convert talk, options # outputs HTML
```

Or read the `test/` for more details.

### License

BSD
