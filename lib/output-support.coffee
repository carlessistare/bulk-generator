"use strict"

fs = require 'fs'

outputSTDOUT = (line, repeat = 1) ->
  for i in [0..repeat-1]
    console.log line

outputFILE = (line, fd, repeat = 1) ->
  buffer = ""
  for i in [0..repeat-1]
    buffer += line + "\n"
  if typeof fd is "string"
    fs.appendFileSync fd, buffer
  else
    fs.write fd, buffer

module.exports =
  outputSTDOUT: outputSTDOUT
  outputFILE: outputFILE
