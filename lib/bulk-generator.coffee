"use strict"

fs = require 'fs'

outputformat = require "./output-format"
linegenerator = require "./line-generator"
outputsupport = require "./output-support"

generateBulk = (num_lines, doc_format, output_format = "json"
, output_support = "stdout", output_support_opt = "") ->

  fd = null

  for i in [0..num_lines]
    line = linegenerator.generateLine doc_format
    formated_line = ""
    if output_format is "json"
      formated_line = outputformat.outputJSON line
    else if output_format is "tsv"
      formated_line = outputformat.outputTSV line
    else if output_format is "csv"
      formated_line = outputformat.outputCSV line

    if output_support is "stdout"
      outputsupport.outputSTDOUT(formated_line)
    else if output_support is "file"
      fd = fs.openSync output_support_opt, "w" unless fd?
      outputsupport.outputFILE(formated_line, fd)

  if df?
    fs.close(fd)



module.exports =
  generateBulk: generateBulk
