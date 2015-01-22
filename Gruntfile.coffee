grunt = require('grunt')
path = require('path')

# load all grunt tasks
require('load-grunt-tasks')(grunt)

grunt.initConfig
  recess:
    development:
      options:
        compile: true
      files: [
        expand: true
        cwd: './src'
        src:['stylesheets/*.less']
        dest: '.tmp/'
        ext: '.css'
        filter: (src) ->
          return src.split('/').pop()[0] != '_'
      ]

  sass:
    dist:
      files: [
        expand: true
        cwd: './src'
        src:['stylesheets/*.scss']
        dest: '.tmp/'
        ext: '.css'
        filter: (src) ->
          return src.split('/').pop()[0] != '_'
      ]

  stylus:
    compile:
      options:
        compress: true
      files: [
        expand: true
        cwd: './'
        src: [ 'src/stylesheets/*.styl' ]
        dest: '.tmp/'
        ext: '.css'
        filter: (src) ->
          return src.split('/').pop()[0] != '_'
      ]

  lddesign:
    development:
      options:
        templatesDirectory: 'components'
        configurationElement: 'script[type=ld-conf]'
      files: [
        expand: true
        cwd: './src'
        src: ['./']
        dest: '.tmp/'
      ]
    build:
      options:
        minify:
          collapseWhitespace: true
          removeComments: true
          removeCommentsFromCDATA: true
          removeCDATASectionsFromCDATA: true
        templatesDirectory: 'components'
        configurationElement: 'script[type=ld-conf]'
      files: [
        expand: true
        cwd: './src'
        src: ['./']
        dest: '.tmp/'
      ]

  copy:
    assets:
      files: [
        expand: true
        cwd: './src'
        src:[
          './images/**'
          './index.html'
        ]
        dest: '.tmp/'
        # exclude empty directories
        filter: (src) ->
          return src.split('/').pop().indexOf('.') != -1
      ]
    tmpToDist:
      files: [
        expand: true
        cwd: '.tmp/'
        src: ['**/*']
        dest: 'dist/'
      ]
    stylesheets:
      files: [
        expand: true
        cwd: './src'
        src:['stylesheets/**/*.css']
        dest: '.tmp/'
      ]
    editor:
      files: [
        expand: true
        cwd: 'dist/'
        src: ['**']
        dest: '../livingdocs-editor/app/designs/dist/'
      ]

  autoprefixer:
    styles:
      expand: true
      flatten: true
      src: '.tmp/stylesheets/*.css'
      dest: '.tmp/stylesheets/'

  watch:
    scripts:
      files: ['src/**/*']
      tasks: ['default']
      options:
        nospawn: true
        livereload: 35769

  clean:
    preBuild: ['.tmp/', 'dist/']
    postBuild: ['.tmp/']


  express:
    dev:
      options:
        port: 3333
        hostname: 'localhost'
        open: true
        server: './server'

  concurrent:
    tasks: ['express']


grunt.registerTask "postCompile", [
  "recess"
  "sass"
  "stylus"
  "copy:assets"
  "copy:stylesheets"
  "autoprefixer"
  "copy:tmpToDist"
  "clean:postBuild"
]


grunt.registerTask "build", [
  "clean:preBuild"
  "lddesign:development"
  "postCompile"
]


grunt.registerTask "serve", [
  "default"
  "express"
  "watch"
]


grunt.registerTask "default", ["build"]
grunt.registerTask "dev", ["serve"]

