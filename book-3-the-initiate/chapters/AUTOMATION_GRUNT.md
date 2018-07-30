# Automating Repetitive Tasks with Grunt

Grunt is a tool to automate tasks that annoy developers. Before automation tools came along, there were many tasks that used to be done manually over and over again.

1. Verifying code syntax
1. Moving files from one location to another for testing
1. Compiling code
1. Running unit tests
1. Running code coverage tool
1. Integration tests
1. Minifying code
1. etc...

After the 500th time, in a single day, that you have to switch to your terminal and run all these commands, you start to feel like this.

Since the tooling for a front end developer was getting more complex, automation tools started to emerge so that we could be more productive, and have all these tasks run automatically instead of breaking our code focus constantly.

## Using Grunt

Grunt was the tool written specifically with the front end developer in mind.

Please read Grunt's [Getting Started Guide](https://gruntjs.com/getting-started) and come to class with questions after you've run through it.

## Practice: Linting Your Personal Site

Implement Grunt, and the ESList plugin for your personal site. Every time you work on your personal site, you should have Grunt running to check your syntax each time you save a JavaScript file.

### Plugins You Need to Install

1. [eslint-grunt](https://www.npmjs.com/package/eslint-grunt): For verifying your JavaScript against community standards, and checking sytax
1. [grunt-contrib-watch](https://www.npmjs.com/package/grunt-contrib-watch): For verifying your JavaScript against community standards, and checking sytax
