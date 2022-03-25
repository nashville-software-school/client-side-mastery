# Deploying API to Digital Ocean

First, if you haven't used Digital Ocean yet, [sign up for $100 credit](https://m.do.co/c/47e5e578d1cd) which is good for 60 days. Deploying your first three static sites is cost free, and deploying a small Django app is only $5.00 per month, so you get two months of having a deployed API on credit.

Your applicatons are considered to be static apps, so you won't be charged for them, unless you go over your 3 free static deployed apps.

## Prepare Your Server

1. Create a new directory on your file system to contain the files for this task. For example, if you want to deploy the API for Sink Repair, you can create `~/workspace/sink-repair-api`.
1. Copy your `database.json` file that you have in the `api` directory of your application into the new directory you just created.
1. In your directory, create a file named `package.json` and place the following content in it.
    ```json
    {
        "name": "sink-repair-api",
        "version": "1.0.0",
        "description": "Simple json-server database to deploy to the cloud",
        "main": "server.js",
        "scripts": {
            "start": "node server.js"
        },
        "keywords": [
            "json-server, node, REST API"
        ],
        "author": "NSS Student",
        "license": "ISC",
        "dependencies": {
            "json-server": "latest"
        }
    }
    ```
1. Create a file named `server.js` and place the following content in it.
    ```js
    const jsonServer = require('json-server')
    const server = jsonServer.create()
    const router = jsonServer.router('database.json')
    const middlewares = jsonServer.defaults()
    const port = process.env.PORT || 3000

    server.use(middlewares)
    server.use(router)

    server.listen(port, () => {
        console.log('JSON Server is running')
    })
    ```
1. Create a `.gitignore` file in your project and place the following contents in it.
    ```text
    node_modules
    .DS_Store
    ```
1. Run the command `npm install` and wait for the process to complete.
1. Create a Github repository and connect it to this new directory.
1. Add, commit, and push your code to Github.

## Deploy JSON Server

1. In Digital Ocean, create an app.
1. Click the Github icon.
1. Connect Digital Ocean to your Github account if you haven't yet.
1. Click the Github icon again.
1. Choose your repository from the search field that appears.
1. Click next.
1. It will auto-detect that you're trying to deploy a **Web Service** and all of the defaults should be unchanged.
1. Click next.
1. Type in an app name like "sinks-api-steve" or anything else that works.
1. Click next.
1. Make sure **Basic Plan** is chosen. You won't get charged as long as you have the $100 credit.
1. In the containers section, change the basic size to the $5.00 type.
1. Click **Launch Basic App**.

Now wait for a few minutes while your application is built and deployed. Once successful, you can click on the link they provide and see your API!

## New API URL

1. Copy the URL of your deployed API.
1. Go to your application code and change **every instance** of `http://localhost:8088` in your fetch calls to your deployed API URL.

Your new fetch calls will look like this, except your URL must be in there... not mine.

```js
fetch("https://json-api-ys75q.ondigitalocean.app/animals")
    .then(r => r.json())
    .then(animals => {
        // Do what you need with the response
    })
```

Now go to the next chapter and deploy your project.