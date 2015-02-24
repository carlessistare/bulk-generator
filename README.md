
## Install

```bash
$ npm install bulk-generator
```

## Usage

```js
var bulkgenerator = require('bulk-generator');

var line_format = {
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
};

bulkgenerator.generateBulk(10, line_format, "json", "file", "~/bulk-test.txt")
```
