"use strict"

getRandomInt = (min, max) ->
  Math.floor(Math.random() * (max - min + 1) + min)

getRandomStringLength = (length) ->
  max_string = ""
  for num in [3..1]
    max_string += Math.random().toString(36).slice(2)
  max_string.substr(0, length)

getRandomStringOptions = (options) ->
  i = getRandomInt 0, options.length - 1
  options[i]

getRandomBoolean = () ->
  Boolean getRandomInt(0, 1)

getRandomTimestamp = (min, max) ->
  getRandomInt min, max


###
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
###
generateLine = (line_format) ->
  line = {}
  for field_name, format of line_format
    line[field_name] = if format.force?
      format.force
    else
      switch format.type
        when "int"
          getRandomInt format.limits[0], format.limits[1]
        when "string"
          if format["length"]?
            getRandomStringLength format["length"]
          else if format["options"]?
            getRandomStringOptions format["options"]
          else
            ""
        when "boolean"
          getRandomBoolean()
        when "timestamp"
          getRandomTimestamp format.limits[0], format.limits[1]
  line

module.exports =
  generateLine: generateLine
