
exports.span = span = (text, key) -> "<span class='#{key}'>#{text}</span>"

exports.convert = (text, options) ->
  options ?= {}
  result = escape_html text
  for key, value of read_options options
    value.forEach (regex) ->
      result = result.replace regex, "<span class='#{key}'>$1</span>"
  result = markup_number result
  # result = markup_string result
  result = markup_link result
  result = markup_pic result
  result

read_options = (options) ->
  config = {}
  for key, value of options
    keywords = value.split(' ').map(as_regex)
    config[key] = keywords
  config

as_regex = (piece) -> new RegExp "(\\s#{piece}\\s)", 'g'

markup_number = (text) ->
  text.replace /(\s\d+\s)/g, "<span class='number'>$1</span>"

markup_string = (text) ->
  lines = text.split '\n'
  lines = lines.map (one) ->
    # one.replace(/('([^']|(\\'))*')/g, "<span class='string'>$1</span>")
    # one.replace(/("[^"]|(\\")*")/g, "<span class='string'>$1</span>")
  lines.join '\n'

escape_html = (text) ->
  text.replace(/</g, '&lt;').replace(/>/g, '&gt;')

markup_link = (text) ->
  text.replace /(http(s)?:\/\/\S+[^(\.jpg)(\.png)(\.gif)])/g, "<a href='$1' target='_blank'>$1</a>"

markup_pic = (text) ->
  text.replace /(http(s)?:\/\/\S+\.((jpg)|(png)|(gif)))/g, "<img src='$1'/>"