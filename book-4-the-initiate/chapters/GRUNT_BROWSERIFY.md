# Automating the Browserify Bundle

Time to add more automation. You certainly don't want to go the terminal every, single time you make a change in your code and type the `browserify` command.


## Browserify Grunt Task

### Install Package

The [grunt-browserify](https://www.npmjs.com/package/grunt-browserify) npm package is needed for Grunt to compile your modules into a single application.

Navigate to your `lib` directory and install the package.

```
npm install grunt-browserify --save-dev
```

### Task Configuration

Navigate to your `lib/grunt` directory, and `touch browserify.js`. Add the configuration below into the file.

```js
module.exports = {
    options: {
        browserifyOptions: {
            debug: true,
            paths: ["./scripts"],
        }
    },
    dist: {
        files: {
            "../dist/bundle.js": ["./scripts/main.js"]
        }
    }
}

```

Then update `watch.js` to include the `browserify` task when you make change to files.

```js
module.exports = {
    scripts: {
        files: ["./index.html", "./scripts/**/*.js", "./styles/**/*.css", "!node_modules/**/*.js"],
        tasks: ["eslint", "browserify", "uglify", "copy"],
        options: {
            spawn: false,
            debounceDelay: 1000
        }
    }
}
```
