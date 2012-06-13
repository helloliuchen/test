require "./boot"

array = [1,2,3]
object =
  t1: 'x' 
  t2: 'y'

#each
_.each array, (value)->
  console.log value
_.each object, (value, key)->
  console.log key + ":" + value

#map
_.map array, (value)->
  value * 2
_.map object, (value, key) ->
  value = value + "x"

