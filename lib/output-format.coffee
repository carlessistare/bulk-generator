"use strict"

outputJSON = (input) ->
  JSON.stringify input

outputTSV = (input) ->
  line = ""
  for key, val of input
    line += val + "\t"
  line.substr 0, line.length - 1

outputCSV = (input) ->
  line = ""
  for key, val of input
    line += val + ","
  line.substr 0, line.length - 1

module.exports =
  outputJSON: outputJSON
  outputTSV: outputTSV
