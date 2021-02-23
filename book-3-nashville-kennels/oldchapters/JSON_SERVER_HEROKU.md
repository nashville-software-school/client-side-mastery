# Deploying React and API to Heroku

## Heroku Account

1. Signup for a [Heroku account](https://www.heroku.com/)
1. Install the [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli)

## Deploy React Application

1. Go to your [Heroku Dashboard](https://dashboard.heroku.com/apps)
1. Click the **New** button and choose _Create new app_.
1. Choose a unique name and click _Create app_.
1. Be in your React application's directory and run the following command. You will see the command under the **Create a new Git repository** section of the page you are reading in your browser.
    ```sh
    heroku git:remote -a {your Heroku app}
    ```
1. Then push your app to Heroku.
    ```sh
    git push heroku master
    ```
1. Then sit and wait while the deployment happens. It can take a couple minutes. Just be patient.

## Deploy API

### Local Setup

> To deploy to Heroku, your API must be its own, separate directory and repository. The `api` directory you have in your project will not work.

1. Create a *new* directory. We suggest it be a sibling of your application directory.
1. `git init` in that directory
1. Copy the example code below into a `package.json` file in your directory.
1. Copy the example code below into a `server.js` file in your directory.
1. Copy the JSON file you currently are using in your React application's `api` directory into this new directory.

### Deploy to Heroku

1. Go to your [Heroku Dashboard](https://dashboard.heroku.com/apps)
1. Click the **New** button and choose _Create new app_.
1. Choose a unique name and click _Create app_.
1. Be in your new API directory and run the following command. You will see the command under the **Create a new Git repository** section of the page you are reading in your browser.
    ```sh
    heroku git:remote -a {your Heroku API app}
    ```
1. Then push your app to Heroku.
    ```sh
    git push heroku master
    ```
1. Then sit and wait while the deployment happens. It can take a couple minutes. Just be patient.
1. When it's done, you will see the deployed URL for your API. Copy that URL.

## Modify Your API URL

You're not done yet. You now need to open your React application and change **all of your URLs** from `http://localhost` to your new Heroku URL for your API that you copied in the previous step.

Your new fetch calls will look like this, except your URL must be in there... not mine.

```js
fetch("https://nss-kennel-api.herokuapp.com/animals")
    .then(r => r.json())
    .then(animals => {
        // Do what you need with the response
    })
```

Once that's done. Add, commit, and `git push heroku master`.

---

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
