# Using Grunt to Automate SASS Transpiling

When you are writing your SASS files, you certainly don't want to be constantly switching between your editor and the CLI in order to transpile the SASS into CSS. You want to automate it. 

You want to automate it with Grunt.

```js
module.exports = function(grunt) {

  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);

  grunt.initConfig({
    /*
      The sass task configures Grunt to read the contents of
      the `sass/main.scss` file, then use the SASS transpiler
      to build `styles/main.css`
    */
    sass: {
      dist: {
        files: {
          'styles/main.css': 'sass/main.scss'
        }
      }
    },

    /*
      Add a new watch task that will detect changes to any `.scss`
      file in the `sass` directory, and immediately run the task
      to execute the transpilation to css.
    */
    watch: {
      sassy: {
        files: ['./sass/**/*.scss'],
        tasks: ['sass']        
      }
    }
  });

  grunt.registerTask('default', ['sass', 'watch']);
};
```