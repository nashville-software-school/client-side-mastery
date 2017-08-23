# Multi-purpose Gulpfile

## JSLint, SASS, and Browserify

Here's a `gulpfile.js` setup you can use for compiling CommonJS modules with Browserify as a Gulp task. It also runs `jshint` on your code before it is bundled by Browserify, and it compiles SASS into CSS.

First you need to install all of the packages as development dependencies.

```bash
npm init
npm install gulp jshint gulp-sass gulp-jshint gulp-watch watchify browserify  vinyl-source-stream vinyl-buffer gulp-util gulp-sourcemaps jshint-stylish --save-dev
```

Then, create a `gulpfile.js` in your project's root directory and paste this code into it.

##### gulpfile.js

```js
"use strict";

let gulp = require('gulp');
let jshint = require('gulp-jshint');
let watch = require('gulp-watch');
let watchify = require('watchify');
let browserify = require('browserify');
let source = require('vinyl-source-stream');
let buffer = require('vinyl-buffer');
let gutil = require('gulp-util');
let sourcemaps = require('gulp-sourcemaps');
let sass = require('gulp-sass');

let handleError = function(task) {
  return function(err) {

    notify.onError({
      message: task + ' failed, check the logs..',
      sound: false
    })(err);
    
    gutil.log(gutil.colors.bgRed(task + ' error:'), gutil.colors.red(err));
  };
};


/*
  BROWSERIFY SECTION

  Delete or comment out if you are not using Browserify
 */

let customOpts = {
  entries: ['./src/scripts/index.js'],
  debug: true
};
let opts = Object.assign({}, watchify.args, customOpts);
let bundler = watchify(browserify(opts)); 
bundler.on('update', bundle); // on any dep update, runs the bundler
bundler.on('log', gutil.log); // output build logs to terminal

function bundle() {
  return bundler.bundle()
    // log errors if they happen
    .on('error', gutil.log.bind(gutil, 'Browserify Error'))
    .pipe(source('bundle.js'))
    // optional, remove if you don't need to buffer file contents
    .pipe(buffer())
    // optional, remove if you dont want sourcemaps
    .pipe(sourcemaps.init({loadMaps: true})) // loads map from browserify file
       // Add transformation tasks to the pipeline here.
    .pipe(sourcemaps.write('./')) // writes .map file
    .pipe(gulp.dest('./dist'));
}
gulp.task('browserify', bundle);



/*
  JSHINT SECTION

  Not optional. You should always be validating your JavaScript
 */
gulp.task('lint', function() {
  return gulp.src(['./src/scripts/**/*.js'])
    .pipe(jshint())
    .pipe(jshint.reporter('jshint-stylish'))
    .on('error', function() { });
});


/*
  SASS SECTION

  Delete or comment out if you are not using SASS
 */
gulp.task('sass', function() {
  return gulp.src('./src/sass/*.scss')
    // sourcemaps + sass + error handling
    .pipe(sourcemaps.init())
    .pipe(sass({
      sourceComments: true,
      outputStyle: 'compressed'  // nested || compressed
    }))
    .on('error', handleError('SASS'))
    // generate .maps
    .pipe(sourcemaps.write({
      'includeContent': false,
      'sourceRoot': '.'
    }))
    .pipe(sourcemaps.write({
      'includeContent': true
    }))
    // write sourcemaps to a specific directory
    // give it a file and save
    .pipe(gulp.dest('./dist/css'));
});


/*
  WATCH TASK SECTION

  Detects when you make a change to any JavaScript file, and/or
  SASS file and immediately runs the corresponding task.
 */
gulp.task('watch', function() {
  // Run the link task when any JavaScript file changes
  gulp.watch(['./src/scripts/**/*.js'], ['lint']);

  // Run the sass task when any SCSS file changes
  // Remov if not using SASS
  gulp.watch('./src/sass/**/*.scss', ['sass']);

  gutil.log(gutil.colors.bgGreen('Watching for changes...'));
});

// This task runs when you type `gulp` in the CLI
gulp.task('default', ['lint', 'sass', 'watch'], bundle);
```

Here is a link to a simpler version example that sets up a basic [watch/lint task](https://gist.github.com/chortlehoort/552acdb39294d4c105b5)

Note that when setting up jshint you may need to create a .jshintrc in the roof of your project. Add this code to get you started:  

```js
{
  "predef": [ "document", "jQuery", "$", "console" ],
  "esversion": 6,
  "globalstrict": true
}
```
