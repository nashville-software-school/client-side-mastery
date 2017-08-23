# Modern Front End Tooling 101

## Install Grunt

Grunt is a widely used task runner tool. It can be configured to handle a number of jobs for you.

 * Checking code for errors
 * Uglify code (minifying it by removing all the white space)
 * Concatenate files
 * Other cool stuff

 It's like a second set of hands to do necessary, but boring and repetitive tasks that needs to happen when building a modern application.

Run the command `which grunt`. If you see the output `/usr/local/bin/grunt`, your instructor planned ahead and had you install it earlier. You're good to go. If not, you need to install the Grunt command line interface: `npm install -g grunt-cli`

## Working with 3rd Party Libraries

Up until now, we've simply been putting all of our files into one directory. You are about to start building much more complex applications, and this requires a bit more organization - not just at the code level, but also at the file system level.

First, in every project directory, you are going to create a `lib` subdirectory. The purpose of this directory is to hold all third-party libraries that are needed for you application.

To start using Grunt, you need a `Gruntfile.js` file. This will contain all of the task configuration needed to automate your workflow.

```bash
mkdir lib # Will store all 3rd-party libraries
touch lib/Gruntfile.js # Task automation script
```

Before you can run Grunt tasks, you need to use node and npm to have the libraries needed in order for Grunt to do its job. Below are the commands needed to get it set up. You will be given a series of prompts on the command line after you run `npm init` and you can just hit the return key for all of them to accept the default values.

```bash
cd lib
npm init  # Initialize directory with a package.json file
```

This will create a pretty standard `package.json` file in your `lib` folder. This file is what Node Package Manager (npm) uses to record all of the 3rd-party Node.js libraries that your application will use. For now, we're only going to install the packages needed to make Grunt run. More good stuff about the `package.json`; the basics, what you absolutely need, and how to customize. https://docs.npmjs.com/getting-started/using-a-package.json 

Replace the contents of `package.json` file with the following configuration code. Simply copy from here, delete all of the current contents, and paste this in.

```js
{
  "name": "modules",
  "version": "0.1.0",
  "devDependencies": {
    "grunt": "~0.4.5",
    "grunt-contrib-jshint": "^0.11.2",
    "grunt-contrib-nodeunit": "~0.4.1",
    "grunt-contrib-uglify": "~0.5.0",
    "grunt-contrib-watch": "^0.6.1",
    "matchdep": "^0.3.0"
  }
}
```

Make sure you are still in the `lib` directory. Now run `npm install` to install all those packages.

> **Windows users:** If you are running Windows, you may need to run `npm install --no-bin-link` instead so that no symlinks are created in the process (Windows no like symlinks).

## Automating JavaScript Syntax Validation

Next, open `Gruntfile.js` and put in the following code.

```js
module.exports = function(grunt) {

  // The `matchdep` package configuration, short for `match dependencies`,
  // looks in your node_modules directory and finds any npm package that
  // begins with `grunt-`. It will then load those packages for execution.
  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);


  // The initConfig method is where you will configure a series
  // of tasks that you want Grunt to automatically run for you
  grunt.initConfig({
    jshint: {
      files: ['../javascripts/**/*.js']
    },
  });


  // Set up the default Grunt task. The default task is executed
  // when you type `grunt`, without any additional parameters in the
  // command line.
  grunt.registerTask('default', ['jshint']);
};
```

This configures one task, `jshint`, for Grunt to run. To start your first automation, just run the `grunt` command in the same directory that contains the Gruntfile.

### Watching Files

You can configure Grunt to run continuously, and watch for changes to any file in a directory, and then perform a task when a file is changed. This is helpful for our `jshint` task. Any time you change a JavaScript file, Grunt will detect the change and immediate check your syntax without you having to switch to the terminal and typing in `grunt`.

```js
module.exports = function(grunt) {

  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);

  grunt.initConfig({
    jshint: {
      files: ['../javascripts/**/*.js']
    },

    // Adding a watch task. When any file that matches the pattern(s)
    // in the `files` key changes, Grunt will automatically start the
    // jshint task
    watch: {
      javascripts: {
        files: ['../javascripts/**/*.js'],
        tasks: ['jshint']
      }
    }
  });


  grunt.registerTask('default', ['jshint', 'watch']);
};
```

