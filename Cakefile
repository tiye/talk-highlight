
task 'dev', 'watch files and test', ->
  require('calabash').do 'test',
    'mocha --compilers coffee:coffee-script -w'

task 'build', 'convert to js', ->
  require('calabash').do 'compile',
    'coffee -o lib/ -bc coffee/'