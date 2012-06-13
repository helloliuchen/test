require "./boot"
should = require 'should'

describe 'collections', ->
  beforeEach ->
    @array = [1,2,3]
    @object = 
      t1: 'x'
      t2: 'y'
    @stooges =
      [
        {
          name: 'moe'
          age: 40
        }
        {
          name:'larry'
          age: 30
        }
      ]
  #################
  # each
  # function ( value, key, context)
  #################
  it 'each', ->
    _.each @array, (value)->
      console.log value
    _.each @object, (value, key)->
      console.log key + ":" + value

  #################
  # map
  # function (value, key, context)
  # return @array
  #################
  it 'map', ->
    ret = _.map @array, (value)->
      value * 2
    ret.should.eql([2,4,6])

    ret = _.map @object, (value, key) ->
      value = value + "x"
    ret.should.eql ['xx', 'yx']

  ################
  # reduce
  # function (list, iterator, memo, [context])
  ################
  it 'reduce', ->
    ret = _.reduce @array,
       (memo, num) -> 
         memo += num
    ret.should.equal(6)

    ret = _.reduce @array, 
      (memo, num)->
        memo += num
      , 3
    ret.should.equal(9)

    ret = _.reduce @object, 
      (memo, value)->
        memo = memo + "," + value
    ret.should.equal("x,y")

    ret = _.reduce @object, 
      (memo, value)->
        memo = memo + "," + value
      , "text"
    ret.should.equal("text,x,y")

  ################
  # reduceRight
  # function (list, iterator, memo, [context])
  ################
  it 'reduceRight', ->
    ret = _.reduceRight @object, 
      (memo, value)->
        memo = memo + "," + value
    ret.should.equal("y,x")

    ret = _.reduceRight @object, 
      (memo, value)->
        memo = memo + "," + value
      , "text"
    ret.should.equal("text,y,x")

  ################
  # find
  # function (list, iterator, [context])
  # return the first element, don't change origin list
  # if list is @object, return value
  ################
  it 'find', ->
    a = [2,3]
    e = _.find a, (num)-> 3<=num
    e.should.equal 3
    a.should.eql [2,3]
    ret = _.find @object, (value, key)->
      key == "t1"
    ret.should.equal 'x'

  ################
  # filter
  # function (list, iterator, [context])
  # return the @array, don't change origin list
  # if list is @object, return value's @array
  ################
  it 'filter',->
    ret = _.filter @array, (num)-> num<=2
    ret.should.eql [1,2]

    ret = _.filter @object, (value, key)-> key=="t1"
    ret.should.eql ['x']

  ################
  # reject
  # function (list, iterator, [context])
  # return the @array, don't change origin list
  # if list is @object, return value's @array
  ################
  it 'reject', ->
    ret = _.reject @array, (num)-> num<=2
    ret.should.eql [3]

    ret = _.reject @object, (value, key)-> key=="t1"
    ret.should.eql ['y']

  ################
  # all
  # function (list, iterator, [context])
  # return true, if every element pass the iterator
  ################
  it 'all', ->
    ret = _.all @array, (num)-> num<=2
    ret.should.not.ok
    ret = _.all @array, (num)-> num<=3
    ret.should.ok

    ret = _.all @object, (value, key)-> key=="t1"
    ret.should.not.ok
    ret = _.all @object, (value, key)-> value>='x'
    ret.should.ok

  ################
  # any
  # function (list, iterator, [context])
  # return true, if any element pass the iterator
  ################
  it 'any', ->
    ret = _.any @array, (num)-> num<=2
    ret.should.ok
    ret = _.any @array, (num)-> num>3
    ret.should.not.ok

    ret = _.any @object, (value, key)-> key=="t1"
    ret.should.ok
    ret = _.any @object, (value, key)-> value<'x'
    ret.should.not.ok

  ################
  # include
  # function (list, element)
  # return true, if list include element
  ################
  it 'include', ->
    ret = _.include @array, 2
    ret.should.ok

    ret = _.include @object, 'x'
    ret.should.ok

    ret = _.include @object, 't1'
    ret.should.not.ok

  ################
  # invoke
  # function (list, method, [*arguments])
  # not very familiar
  ################

  ################
  # pluck
  # function (list, peropertyName)
  # return array which element is the property of list's object
  ################
  it 'pluck', ->
    ret = _.pluck @stooges, 'name'
    ret.should.eql ['moe','larry']

    ret = _.pluck @object, 't1'
    ret.should.not.eql ['x']  # param must be array of object

  ################
  # max/min
  # function (list, [iterator])
  # list must be array
  # return the element of list which is max
  # iterator must return object that can compare
  ################
  it 'max', ->
    ret = _.max @stooges, (stooge)->
      stooge.age
    ret.should.eql { name: 'moe', age: 40 }

    ret = _.max @array
    ret.should.equal 3

    ret = _.max @object #param must be array, not object
    should.not.exist ret

  it 'min', ->
    ret = _.min @stooges, (stooge)->
      stooge.age
    ret.should.eql { name: 'larry', age:30 }

    ret = _.min @array
    ret.should.equal 1

  ################
  # sortBy
  # function (list, iterator)
  # asce
  # notice: iterator is a must
  ################
  it 'sortBy', ->
    ret = _.sortBy @array, (num) -> num
    console.log ret
    ret.should.eql [3,2,1]

    ret = _.sortBy @array, (num)-> 10-num
    console.log ret
    ret.should.eql [1,2,3]

  ################
  # groupBy
  # function (list, [iterator])
  # asce
  ################
