# Deploying json-server API to Heroku

## Setup

* To deploy to Heroku, your API must be its own, separate directory and repository. The `api` directory you have in your project will not work.

Follow the instructions for [deploying json-server to Heroku](https://github.com/nashville-software-school/json-server-heroku#deploy-to-heroku)

> **Note:** If you alread have a JSON file for your database, copy that file into the new directory when you clone the repo. Either rename that file as `db.json`, or modify line 3 of `server.json` to be the name of your file.

## Example package.json

You can straight up copy pasta this into a `package.json` file in your API repo.

```json
{
  "name": "json-server-heroku",
  "version": "1.0.0",
  "description": "Simple json-base database to deploy to Heroku",
  "main": "server.js",
  "scripts": {
    "start": "node server.js",
    "dev": "nodemon server.js"
  },
  "keywords": [
    "json-server,heroku, node, REST API"
  ],
  "author": "Jesper Orb",
  "license": "ISC",
  "dependencies": {
    "json-server": "^0.12.2"
  }
}
```

## Example server.js

Here's a sample `server.js` file that you can put in your API repo.  Replace `yak.json` below with the same of your JSON file.

```js
const jsonServer = require('json-server');
const server = jsonServer.create();
const router = jsonServer.router('yak.json');
const middlewares = jsonServer.defaults();
const port = process.env.PORT || 3000;

server.use(middlewares);
server.use(router);

server.listen(port);
```

## Using

Once you have the Heroku service running, modify your application's `fetch` or `$.ajax()` statements to your new URL.

For example...

> fetch

```js
fetch("https://nss-kitty-purry.herokuapp.com/")
    .then(r => r.json())
    .then(kittyPurry => {
        // Do what you need with the response
    })
```

> $.ajax()

```js
$.ajax("https://nss-kitty-purry.herokuapp.com/")
    .then(kittyPurry => {
        // Do what you need with the response
    })
```
