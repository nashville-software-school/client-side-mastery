# Automating Tasks with Grunt

## What is Grunt?

Grunt is a command-line tool that you will be using throughout the course to automate repetitive tasks that you hate having to type over, and over, and over again in the terminal.

Visit the [Grunt website](https://gruntjs.com/getting-started) and follow the _Getting Started_ instructions to get it installed.

## Configuring Grunt in your Projects

You are going to create a new project that uses Grunt to automate three things for your when you run it.

1. Checking your JavaScript syntax and alerting you to any problems
1. Starting `http-server` for you.
1. Starting `json-server` for you.

This project will have a sample API using `json-server`.

### Directory Setup

1. Go to your food application directory that you've been using in the previous chapters.
1. Once you are in the directory in your terminal, follow these command to get your directory structure, and base files, established.


```sh
cd src
mkdir -p lib/grunt
touch .eslintrc
touch lib/Gruntfile.js
touch lib/grunt/aliases.yaml
touch lib/grunt/eslint.js
touch lib/grunt/http-server.js
touch lib/grunt/bgShell.js
touch lib/grunt/watch.js
```

The `lib` directory (short for library) is where you will install any 3rd-party open source libraries that you want to use in your project. All of the files you just created will hold the configuration options for different menial tasks that you will be automating.

> **Pro tip:** The `-p` flag on the `mkdir` command allows you to create an entire directory structure at once instead of having to `mkdir` and `cd` multiple times.

![initial structure](./images/initial-directory-structure.png)

### Installing 3rd Party Dependencies from npm

Time to install all of the software that is needed for Grunt to automate your tasks for you. First, you need to initialize the `lib` directory as the location of your packages.

```sh
cd src/lib
npm init
```

When you run `npm init` you will see a prompt. Just keep pressing enter using all of the prompts are gone. This will create a `package.json` file in your `lib` directory.

Next, you run this command to install all of the required dependencies. It will install these packages, and _their_ dependencies, in the `src/lib/node_modules` directory.

```sh
npm i load-grunt-config grunt-contrib-watch grunt-eslint grunt grunt-http-server grunt-bg-shell -D
```

![](./images/jkB4Pbhad0.gif)

### List of Tasks

The `src/lib/grunt/aliases.yaml` file contains the name of all the automated tasks that you want to run when you type `grunt` in your project's `lib` directory. You are going to start off with four tasks.

> src/lib/grunt/aliases.yaml

```yaml
default:
  - "eslint"
  - "http-server"
  - "bgShell:launchAPI"
  - "watch"
```

The description and configuration of each automated task follows below.

### Syntax Checking with Eslint

This file sets the rules that will be used to check your code. Normal language syntax rules get checked by default, and additional rules can be set in this file. For example, the `rules.semi` rule here is defaulted to 0, which will ignore whether you have semi-colons at the end of every expression or not.

* "off" or 0 - turn the rule off
* "warn" or 1 - turn the rule on as a warning (doesn’t affect exit code)
* "error" or 2 - turn the rule on as an error (exit code will be 1)

Go ahead and change that rule's value to 2 if you want to use semi-colons and have your code validated every time you save a file.

It is highly recommended that you bookmark the [listing of all Eslint rules](https://eslint.org/docs/rules/) so that as you gain more understanding of JavaScript, and want to have your code validated in more sophisticated ways in the future, you have the rule list handy.

> src/.eslintrc

```json
{
    "parserOptions": {
        "ecmaVersion": 8,
        "sourceType": "module",
        "ecmaFeatures": {
            "jsx": true
        }
    },
    "rules": {
        "semi": 0,
        "quotes": ["error", "double"],
        "eqeqeq": 2,
        "no-trailing-spaces": 2
    }
}
```

This next file is the Grunt configuration specifying which files should be checked for their syntax. This configuration specifies that every file in the `scripts` directory, or any sub-directory, that has a file extension of `.js` should be checked.

> src/lib/grunt/eslint.js

```js
module.exports = {
    src: ["../scripts/**/*.js", "!node_modules/**/*.js"]
}
```

### Launching your Web Server

Rather than having one terminal window open for checking your JavaScript syntax, and another terminal window open for running `http-server`, you are going to combine them both. When you type in `grunt` in the terminal window, it will launch your web server **and** start checking your syntax.

This is the beginning of understanding the true power of a task runner like Grunt.

> src/lib/grunt/http-server.js

```js
module.exports = {
    "dev": {

        // the server root directory
        root: "../",

        // the server port
        // can also be written as a function, e.g.
        // port: function() { return 8282; }
        port: 8080,

        // the host ip address
        // If specified to, for example, "127.0.0.1" the server will
        // only be available on that ip.
        // Specify "0.0.0.0" to be available everywhere
        host: "0.0.0.0",

        showDir : false,
        autoIndex: true,

        // server default file extension
        ext: "html",

        // run in parallel with other tasks
        runInBackground: true,

        // Change to true for grunt task to open the
        // browser automatically
        openBrowser : false
    }
}
```

### Launching your JSON Server

Below is an example configuration for launching your API when Grunt starts. In this configuration, the API will be listening on port 8088. It will watch (the `-w` flag) the file `database.json`. Make sure the path is correct when you add yor configuration file. The path is always relative from _the directory in which you typed the **grunt** command_.

> src/lib/grunt/bgShell.js

```js
module.exports = {
    launchAPI: {
        cmd: "json-server -p 8088 -w ../../api/database.json"
    },
    _defaults: {
        bg: true
    }
}
```

### Keep Grunt Always Running

This next task will keep Grunt running indefinitely. Without the watch task, when you type the `grunt` command, all of the tasks will be performed and the process ends. The next time you want all the tasks to run again, you have to go to your terminal and type `grunt` again. This task is further automation, increasing your productivity as a developer. It just keep running until you intentionally terminate the process.

Once this task is configured, when you run `grunt`, it will continue to listen for changes to any JavaScript file, and then immediately check the syntax.

> src/lib/grunt/watch.js

```js
module.exports = {
    scripts: {
        files: [
            "../scripts/**/*.js",
            "!node_modules/**/*.js"
        ],
        tasks: ["eslint"],
        options: {
            spawn: false,
            debounceDelay: 1000
        }
    }
}
```

## Loading All Tasks

Your `Gruntfile.js` only needs to require the `load-grunt-config` package, and it will read all of the tasks in the `grunt` directory.

> src/lib/Gruntfile.js

```js
module.exports = function (grunt) {
    require("load-grunt-config")(grunt)
}
```

## Run Grunt

In your terminal, be in the directory that contains your `Gruntfile.js` and then type in `grunt` and watch it start up. Come see a learning team member if it doesn't start correctly.

### Grunt Didn't Start

If you type in `grunt` and you are now in the grunt directory (instead of having grunt start up), that means you have a newer version of oh-my-zsh. To circumvent this, go ahead and create a new alias in your `.zshrc`/`.bashrc` that looks like this: `alias gr="/usr/local/bin/grunt"`. After reloading your `.zshrc`/`.bashrc`, you can run grunt my typing in your new alias: `gr`.

Remember, you can edit your terminal configuration file with Visual Studio Code.

#### Windows

`code ~/.bashrc`

#### OSX

`code ~/.zshrc`

When you make the change, reload the configuration file.

#### Windows

`source ~/.bashrc`

#### OSX

`source ~/.zshrc`



## Configuring New Projects

Now that you have your Food API project directory set up with all the files and configuration needed, you can follow these steps when you create a new project to run these automated tasks.

1. Create your new project directory
1. Create an `api` sub-directory
1. Create a `src` sub-directory
1. Create a `src/scripts` sub-directory
1. Create a `src/lib` sub-directory
1. Now you can copy the following items from `food-api/src/lib` to the `lib` directory of your new project.
    * The `grunt` directory (remember to use `cp -r` when copying a directory)
    * The `Gruntfile.js` file
    * The `package.json` file
1. Next, copy the `.eslintrc` file from the source `src` directory to your new `src` directory

Once those are copied over, `cd` to the `lib` directory of your new project and run the `npm install` command. Once that process is complete, you can run `grunt`.
