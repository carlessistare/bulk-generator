should = require('chai').should()

linegenerator = require '../lib/line-generator'
bulkgenerator = require '../lib/bulk-generator'

describe 'Bulk generator', ->

  it 'test a line', ->
    line = linegenerator.generateLine
      field1:
        type: "int"
        limits: [ 0, 1000 ]
      field2:
        type: "string"
        length: 16
      field3:
        type: "string"
        options: [ "aaa", "bbb" ]
      field4:
        type: "boolean"
      field5:
        type: "timestamp"
        limits: [ 1424425310, 1424525310 ]
    line.field1.should.be.a.Number
    line.field2.should.be.a.String
    line.field2.should.have.length(16)
    line.field3.should.be.a.String
    line.field4.should.be.a.Boolean
    line.field5.should.be.a.Number

  it 'test a bulk stdout', ->
    bulkgenerator.generateBulk 10,
      field1:
        type: "int"
        limits: [ 0, 1000 ]
      field2:
        type: "string"
        length: 16
      field3:
        type: "string"
        options: [ "aaa", "bbb" ]
      field4:
        type: "boolean"
      field5:
        type: "timestamp"
        limits: [ 1424425310, 1424525310 ]

  it 'test a bulk file', ->
    bulkgenerator.generateBulk 10,
    {
      field1:
        type: "int"
        limits: [ 0, 1000 ]
      field2:
        type: "string"
        length: 16
      field3:
        type: "string"
        options: [ "aaa", "bbb" ]
      field4:
        type: "boolean"
      field5:
        type: "timestamp"
        limits: [ 1424425310, 1424525310 ]
    }, "json", "file", "/Users/carles/bulk-test.txt"
