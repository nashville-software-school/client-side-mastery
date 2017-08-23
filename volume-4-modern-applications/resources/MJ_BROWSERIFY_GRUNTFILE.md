# Multi-purpose Gruntfile

## JSLint, SASS, and Browserify
Do not use this Gruntfile until you first have a clear grasp of how each of these individual tasks works:
+ [JSHint with watcher](https://github.com/nashville-software-school/front-end-milestones/blob/master/4-modern-javascript-developer/resources/MJ_GRUNT_SETUP.md)
+ [SASS](https://github.com/nashville-software-school/front-end-milestones/blob/master/4-modern-javascript-developer/resources/MJ_GRUNT_SASS.md)
+ [Live reload](https://github.com/nashville-software-school/front-end-milestones/blob/master/4-modern-javascript-developer/resources/MJ_GRUNT_LIVERELOAD.md)

Here's a `Gruntfile.js` setup you can use for compiling CommonJS modules with Browserify as a Grunt task. It also runs `jshint` on your code before it is bundled by Browserify, and it compiles SASS into CSS.

First you need to install all of the packages as development dependencies.

```bash
npm init
npm install grunt grunt-contrib-sass grunt-contrib-jshint grunt-contrib-watch grunt-browserify jshint-stylish --save-dev
```

Then, create a `Gruntfile.js` in your project's root directory and paste this code into it.

##### Gruntfile.js
```js
module.exports = function(grunt) {

  grunt.initConfig({
    browserify: {
      js: {
          src: ['./js/main.js'],
          dest: 'dist/app.js'
      },
      options: {
          transform: ['hbsfy']
      }
    },
    jshint: {
      options: {
        predef: [ "document", "console" ],
        esnext: true,
        globalstrict: true,
        globals: {},
        browserify: true
      },
      files: ['./js/**/*.js']
    },
    sass: {
      dist: {
        files: {
          './css/main.css': './sass/main.sass'
        }
      }
    },
    watch: {
      options: {
        livereload: true,
      },
      javascripts: {
        files: ['./js/**/*.js'],
        tasks: ['jshint', 'browserify']
      },
      sass: {
        files: ['./sass/**/*.sass'],
        tasks: ['sass']
      },
      hbs: {
        files: ['./templates/**/*.hbs'],
        tasks: ['browserify']
      }
    }
  });

  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);

  grunt.registerTask('default', ['jshint', 'sass', 'browserify', 'watch']);
};
```
