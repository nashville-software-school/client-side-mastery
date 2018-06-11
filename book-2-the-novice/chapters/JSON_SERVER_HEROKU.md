# Deploying json-server API to Heroku

## Setup

Follow the instructions for [deploying json-server to Heroku](https://github.com/nashville-software-school/json-server-heroku#deploy-to-heroku)

> **Note:** If you alread have a JSON file for your database, copy that file into the new directory when you clone the repo. Either rename that file as `db.json`, or modify line 3 of `server.json` to be the name of your file.

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
