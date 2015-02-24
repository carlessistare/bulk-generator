"use strict"

fs = require 'fs'

outputSTDOUT = (line) ->
  console.log line

outputFILE = (line, fd) ->
  if typeof fd is "string"
    fs.appendFileSync fd, line
  else
    fs.write fd, line + "\n"

module.exports =
  outputSTDOUT: outputSTDOUT
  outputFILE: outputFILE
