# Automating with Gulp

Gulp is another task automator that is very similar to Grunt, but differs in a very fundamental way. 

In Grunt, you use configuration to define a task, and when to run it. They are discrete tasks and Grunt runs them sequentially, in the order that you specify in the `registerTask` method.

Gulp, conversely, focuses on stream-based code. More specifically, the developer defines, with code, what happens for each defined task. Results from one process are then *streamed* to another process until the task is complete. Additionally, Gulp tries to run task concurrently whenever possible.

## Setup

This installs a global NPM package to let you run gulp tasks

```bash
sudo npm install -g gulp-cli
```

To use Gulp in a project for automating the validation of your JavaScript with `js-hint`, `cd` to the directory for the project and execute these commands

```bash
npm init # Accept all defaults at the prompts
npm install gulp jshint gulp-jshint jshint-stylish gulp-watch
touch gulpfile.js
```

### Gulp File

Paste in the following code in your `gulpfile.js`.

```js
var gulp = require('gulp');
var jshint = require('gulp-jshint');
var watch = require('gulp-watch');

gulp.task('default', ['lint', 'watch']);

gulp.task('watch', function() {
  gulp.watch('path/to/javascript/files/**/*.js', ['lint']);
});

/*
  Notice how a Gulp task is written just like chained
  methods on an array that you would use in your production
  code. Gulp libraries expose more fine-grained interfaces
  and the developer calls them in whichever order is needed
  using `.pipe()` to send the results of one to the next.
 */
gulp.task('lint', function() {
  return gulp.src(['path/to/javascript/files/**/*.js'])
    .pipe(jshint())
    .pipe(jshint.reporter('jshint-stylish'))
    .on('error', function() {}
  );
});
```
