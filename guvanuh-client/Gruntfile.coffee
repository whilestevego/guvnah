#global module:false
module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig

    # Metadata.
    pkg: grunt.file.readJSON("package.json")
    banner: "/*! <%= pkg.title || pkg.name %> - v<%= pkg.version %> - " + "<%= grunt.template.today(\"yyyy-mm-dd\") %>\n" + "<%= pkg.homepage ? \"* \" + pkg.homepage + \"\\n\" : \"\" %>" + "* Copyright (c) <%= grunt.template.today(\"yyyy\") %> <%= pkg.author.name %>;" + " Licensed <%= _.pluck(pkg.licenses, \"type\").join(\", \") %> */\n"

    # Task configuration.
    copy:
      build:
        cwd: "source"
        src: [
          "**"
          "!**/*.styl"
          "!**/*.coffee"
          "!**/*.jade"
        ]
        dest: "build"
        expand: true

    clean:
      build:
        src: ["build"]

      stylesheets:
        src: [
          "build/**/*.css"
          "!build/application.css"
        ]

      scripts:
        src: [
          "build/**/*.js"
          "!build/application.js"
        ]


    # CSS Related
    stylus:
      build:
        options:
          linenos: true
          compress: false

        files: [
          expand: true
          cwd: "source"
          src: ["**/*.styl"]
          dest: "build"
          ext: ".css"
        ]

    autoprefixer:
      build:
        expand: true
        cwd: "build"
        src: ["**/*.css"]
        dest: "build"

    cssmin:
      build:
        files:
          "build/application.css": ["build/**/*.css"]


    # Scripts
    coffee:
      build:
        expand: true
        cwd: "source"
        src: ["**/*.coffee"]
        dest: "build"
        ext: ".js"

    uglify:
      build:
        options:
          mangle: false

        files:
          "build/application.js": ["build/**/*.js"]


    # Templating
    jade:
      compile:
        options:
          data: {}

        files: [
          expand: true
          cwd: "source"
          src: ["**/*.jade"]
          dest: "build"
          ext: ".html"
        ]


    # Watch
    watch:
      options:
        livereload: true

      stylesheets:
        files: "source/**/*.styl"
        tasks: ["stylesheets"]

      scripts:
        files: "source/**/*.coffee"
        tasks: ["scripts"]

      jade:
        files: "source/**/*.jade"
        tasks: ["jade"]

      copy:
        files: [
          "source/**"
          "!source/**/*.styl"
          "!source/**/*.coffee"
          "!source/**/*.jade"
        ]
        tasks: ["copy"]


    # Dev server
    express:
      server:
        options:
          port: 4000
          bases: ["build"]
          hostname: "0.0.0.0"
          livereload: true


  # // load the tasks
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-contrib-stylus"
  grunt.loadNpmTasks "grunt-autoprefixer"
  grunt.loadNpmTasks "grunt-contrib-cssmin"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-jade"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-express"

  # define the tasks
  grunt.registerTask "stylesheets", "Compiles the stylesheets.", [
    "stylus"
    "autoprefixer"
    "cssmin"
    "clean:stylesheets"
  ]
  grunt.registerTask "scripts", "Compiles the JavaScript files.", [
    "coffee"
    "uglify"
    "clean:scripts"
  ]
  grunt.registerTask "build", "Compiles all of the assets and copies the files to the build direction.", [
    "clean:build"
    "copy"
    "stylesheets"
    "scripts"
    "jade"
  ]
  grunt.registerTask "default", "Watches the project for changes, automatically builds them and runs a server.", [
    "build"
    "express"
    "watch"
  ]
  return

