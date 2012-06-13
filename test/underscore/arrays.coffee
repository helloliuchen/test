require './boot'
should = require 'should'

describe 'arrays', ->
  beforeEach ->
    @array = [1,2,3,4,5]

  #################
  # first
  # function ( array,[n])
  #################
  it 'first', ->
    ret = _.first @array
    ret.should.equal 1
    ret.should.not.eql [1]
    ret = _.first @array, 2
    ret.should.eql [1,2]
    ret.should.not.equal [1,2]

  #################
  # initial
  # function ( array,[n=1])
  # return exclude the last n element
  # don't know how to use it....
  #################
  it 'initial', ->
    ret = _.initial @array
    ret.should.eql [1,2,3,4]

    ret = _.initial @array, 2
    ret.should.eql [1,2,3]

    ret = _.initial @array, 4
    ret.should.eql [1]
  
  #################
  # last
  # function ( array,[n=1])
  # return the last n element
  #################
  it 'last', ->
    ret = _.last @array
    ret.should.eql 5
    ret = _.last @array, 4
    ret.should.eql [2,3,4,5]

  #################
  # rest
  # function ( array,[n=1])
  # opposite to initial 
  #################
  it 'rest', ->
    ret = _.rest @array
    ret.should.eql [2,3,4,5]
    ret = _.rest @array, 3
    ret.should.eql [4,5]
    ret = _.rest @array, 4
    ret.should.eql [5]

  #################
  # compact
  # function (array)
  # del false, null, 0, "", undefined and NaN in array
  #################

  #################
  # flatten
  # function (array, [shallow])
  # flattens a nested array, shallow
  #################


  #################
  # without
  # function (array, [*values])
  # delete values appear in array
  #################
  it 'without', ->
    ret = _.without @array, 3, 2
    ret.should.eql [1,4,5]

  #################
  # union 
  # function (*array)
  #################

