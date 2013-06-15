
assert = require 'assert'
{convert, span} = require '../coffee/index'

describe 'the demos of convert', ->
  it 'just a demo', ->
    text = 'nothing to do'
    assert.equal text, (convert text)

  it 'contains for', ->
    text = 'a for b'
    result = "a#{span ' for ', 'key'}b"
    options =
      key: 'for'
    assert.equal (convert text, options), result

  it 'contains more keywords', ->
    text = 'so for a in b'
    result = "so#{span ' for ', 'key'}a#{span ' in ', 'key'}b"
    options =
      key: 'for in'
    assert.equal (convert text, options), result

  it 'markups number', ->
    text = 'say 1 ok'
    result = "say#{span ' 1 ', 'number'}ok"
    options = {}
    assert.equal (convert text, options), result

  it 'options is optional', ->
    text = 'say 1 ok'
    result = "say#{span ' 1 ', 'number'}ok"
    assert.equal (convert text), result

  it 'knows where word breaks', ->
    text = 'here Markdown and CoffeeScripts'
    result = "here#{span ' Markdown ', 'key'}and CoffeeScripts"
    options =
      key: 'Markdown CoffeeScript'
    assert.equal (convert text, options), result

  # it 'can markup string in double quotes', ->
  #   text = 'gives "a string"'
  #   result = "gives #{span '"a string"', 'string'}"
  #   assert.equal (convert text), result
  
  # it 'can markup string in single quotes', ->
  #   text = "gives 'a string'"
  #   result = "gives #{span "'a string'", 'string'}"
  #   assert.equal (convert text), result

  it 'markups links', ->
    text = 'http://qq.com'
    result = "<a href='#{text}' target='_blank'>#{text}</a>"
    assert.equal (convert text), result

  it 'markups pictures', ->
    text = 'http://a.jpg'
    result = "<img src='#{text}'/>"
    assert.equal (convert text), result