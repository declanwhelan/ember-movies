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
    
    # concat: 
    #   basic: 
    #    src: ['js/tmp/handlebars.js','js/tmp/coffee.js']
    #    dest: 'coffee/app.js'
    
    # uglify:
    #   options:
    #     banner: "/*! <%= pkg.name %> <%= grunt.template.today(\"yyyy-mm-dd\") %> */\n"

    #   build:
    #     src: "js/app.js"
    #     dest: "js/app.min.js"
    
    # clean: ['js/tmp/']
 
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-ember-templates'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-clean'
 
  grunt.task.registerTask('build', ['coffee']);
  grunt.registerTask 'default', ['watch']