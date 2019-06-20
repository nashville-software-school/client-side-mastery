# A static module bundler for your Application

## Introduction to Webpack

Webpack is a task runner and a module bundler. It originally started as a module bundler. This means that it took all your separate Javascript modules and put them together into a single file. Webpack also automates some of the tasks that we have to every time we change the code. It will automate these tasks so that we are not typing in the same commands every single time.

Visit the [Webpack documentation](https://webpack.js.org/concepts/) if you want to explore more.

## Configuring Webpack in your Projects

Create your application with the directory structure like below:

```
YourApplication/
    |-- api/
    |-- src/
        |-- scripts/
    |-- .gitignore
    |-- README.md
    |-- index.html         
```

You are going to create a new project that uses Webpack to bundle your modules and to automate three things for your when you run it.

1. Checking your JavaScript syntax and alerting you to any problems.
1. Converting your ES6 Javascript to ES5.
1. Starting `http-server` for you.
1. Starting `json-server` for you.

This project will have a sample API using `json-server`.

### .gitignore

Because our application will be set up using Webpack, your `.gitignore` should be updated to include the following:

```
package-lock.json
node_modules/
dist/
build/
```

### package.json

1. In your root directory, run the following command. This will create a `package.json` file. This preps our app so that we can install dependencies ie, any external libraries our application may need. All dependencies will be listed in your `package.json`.

GO INTO MORE DETAIL ABOUT NPM

```
npm init
```

1. Modify the main, scripts, author, and license values, your `package.json` so that it looks like this:

```js
{
  "name": "new-repo",
  "version": "1.0.0",
  "description": "",
  "main": "src/javascripts/main.js",
  "scripts": {
    "start": "webpack-dev-server --mode development --open"
  },
  "keywords": [],
  "author": "Your Name",
  "license": "MIT"
}
```

1. Now that our `package.json` is ready, let's go ahead and install our dependencies for this application.

```
npm install @babel/core @babel/preset-env babel-loader eslint  eslint-loader eslint-plugin-import webpack webpack-cli webpack-dev-server webpack-shell-plugin --save-dev
```

Once you have ran the above command, you will notice the presence of an additional file called `package-lock.json`. This file contains a more details on the external dependencies the app will be using including the exact version numbers. You should never have to create this file, this file is generated for you. 

### ESLint

To use eslint we will need two different configuration files. In your root directory, create two files: `.eslintignore` and `.eslintrc`. Both of these will be hidden files that specify the rules for which our linter will check for syntax errors in the code.

It is highly recommended that you bookmark the [listing of all Eslint rules](https://eslint.org/docs/rules/) so that as you gain more understanding of JavaScript, and want to have your code validated in more sophisticated ways in the future, you have the rule list handy.

##### .eslintignore
The `.eslintignore` file operates very similarly to the `.gitignore` file.  Anything that is in the `.eslintignore` file will be ignored from linting.  Currently you should have the following entries in your `.eslintignore`.
```js
webpack.config.js
node_modules
```

##### .eslintrc
The `.eslintrc` file is where we configure our rules for eslint.  Your file should look like this:

```
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

### Babel

Create a file called `.babelrc` at the root of your project. This file tells babel how to convert the JS in our project. Add this to that file:

BROWSER COMPATIBILITY WITH ES5 VS ES6

```
{
  "presets": [
      "@babel/preset-env"
  ]
}
```

### webpack.config.js

Create a file called `webpack.config.js` in your root directory. This wll contain the configuration for Webpack. 

```
const WebpackShellPlugin = require('webpack-shell-plugin');
module.exports = {
  entry: './src/scripts/main.js',
  module: {
    rules: [
      {
        enforce: "pre",
        test: /\.js$/,
        exclude: /node_modules/,
        loader: "eslint-loader"
      },
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: "babel-loader"
        }
      }
    ]
  },
  plugins: [
    new WebpackShellPlugin({onBuildEnd:['json-server -p 8088 -w api/database.json']})
  ],
  output: {
    filename: "bundle.js"
  }
};
```


### webpack.config.js

To run your server, `npm start`.
