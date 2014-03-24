module.exports = (grunt)->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
  
    coffee:
      compile:
        options:
          join: true
          sourceMap: true
        files:
          'coffee/tmp/src.js': 'coffee/src/**/*.coffee'

    # emberTemplates:
    #   compile:
    #     options:
    #       templateBasePath: 'js/handlebars/' 
    #     files:
    #       "js/tmp/handlebars.js": ["js/handlebars/*.handlebars"]
    # watch:
    #   files: [
    #     'js/coffeescript/**/*.coffee'
    #     'js/handlebars/**/*.handlebars'
    #   ]
    #   tasks: ['coffee','emberTemplates','concat','uglify']
    
    concat: 
      basic:
        files:
          'coffee/tmp/vendor.js':  ['coffee/vendor/ember-1.4.0.js','coffee/vendor/handlebars-1.1.2.js','coffee/vendor/jquery-1.10.2.js']
          'coffee/app.js': ['coffee/tmp/vendor.js','coffee/tmp/src.js']
    
    uglify:
      options:
        banner: "/*! <%= pkg.name %> <%= grunt.template.today(\"yyyy-mm-dd\") %> */\n"

      build:
        src: "coffee/app.js"
        dest: "coffee/app.min.js"
    
    clean: ['coffee/tmp/']
 
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-ember-templates'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-clean'
 
  grunt.task.registerTask('build', ['coffee','concat','uglify','clean']);
  grunt.registerTask 'default', ['watch']