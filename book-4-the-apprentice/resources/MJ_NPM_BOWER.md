###Bower vs npm

...what's the difference?

Both `npm` and `bower` are package managers, npm is short for *node package manager*. A package manager automates the process of installing computer programs used in applications including bootstrap, grunt, and jquery to name a few. See [wikipedia](https://en.wikipedia.org/wiki/Package_manager) for more information on package managers.

When installing dependencies on an existing project (cloned or forked from GitHub) [npm](https://www.npmjs.com/) and [Bower](https://bower.io/) are used in the same way, both require the command `npm install` and `bower install` in the terminal to install dependencies included in the json file associated with the specific package manager. To start a new project, the commands `npm init` and `bower init` will create a new json file along with `install --save-dev` to install dev dependencies used in development, and/or `--save` to install dependencies needed for the application to run.

Bower was initially used for front-end development only, and npm for server-side dependencies. Bower is used to install frameworks and libraries including jquery, angular, firebase and bootstrap. Since npm is _node_, it was typically used to install server-side dependencies including grunt, and jshint which are used in development.

As `npm` becomes more and more robust, front-end dependencies can also be installed using npm. It is important to be aware of both `npm` and `bower` when entering the job market, as some workplaces will still use a combination of both. Many professional development shops use npm exclusively, in conjunction with a tool like [Browserify](http://browserify.org/) which will [transpile](https://en.wikipedia.org/wiki/Source-to-source_compiler) a Node.js module for use in the browser.

If you aren't using a transpiler tool, then Bower is still the best source for libraries, components and frameworks for use in the browser.

--

It is important to note that although you may be able to use npm to install front-end libraries and frameworks, *the implementation may be slightly different* in your app. For example, when installing `angular-route`, a bower-installed version will use `angular.module('myApp', ['ngRoute']);`, and a npm-installed version will use `angular.module('myApp', [require('angular-route')]);`. Be sure to read the docs closely when installing dependencies.

####npm
* `npm init`
* `npm install <package_name> --save-dev`
* `npm install <package_name> --save`
* package.json

####Bower
* `bower init`
* `bower install <package_name> --save`
* `bower install <package_name> --save-dev`
* bower.json
