module.exports = (grunt)->
  grunt.loadNpmTasks 'grunt-mocha-test'

  grunt.initConfig
    mochaTest:
      test:
        options:
          reporter: 'spec'
          # require: 'coffee-script/register'
        src: ['test/**/*.coffee']

  grunt.registerTask 'test', 'mochaTest'
