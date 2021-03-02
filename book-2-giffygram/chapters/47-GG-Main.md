# Main Runs The Show

## Learning Objectives
You should be able to:
* remember that the HTML that a user sees in the browser and is an expression of the state of your raw data
* define a JavaScript module
* explain and use the [document.querySelector()](https://www.youtube.com/watch?v=3oOKAJTD2F8)
* describe how to change the browser contents with [innerHTML](https://www.youtube.com/watch?v=1UsllDMhvN4)

## Data as HTML

As you explore the World Wide Web as a software developer you will discover that

> &#x275d; your job as a web application developer is to express data as HTML. &#x275e;

It may seem like an odd way to say that, but what it means is that your code's sole purpose is to take raw data and make it look pretty in a Web browser.

For example, your code turns this raw data 👇🏽

```js
posts = [
    {
        id: 2,
        imageURL: "https://media.giphy.com/media/26xBI73gWquCBBCDe/giphy.gif",
        userId: 6,
        description: "Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.",
        timestamp: 1561695022812,
        title: "Enhanced global utilisation"
    }
],
likes: [
    {
        id: 1,
        userId: 1,
        postId: 2
    }
]
```

Into this HTML representation of it in the Web browser 👇🏽

<img src="./images/data-as-html.png" height="500" />


The data has been expressed as HTML so that a user can understand and interact with it.

## Your Main Module

Every application needs an HTML file so that your data can be displayed beautifully. That file will be `index.html`.

> #### `giffygram/src/index.html`

```html
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Nashville Software School</title>
    <link rel="stylesheet" href="./styles/main.css">
</head>

<body>

    <main class="giffygram"></main>

    <script type="module" src="./scripts/main.js"></script>
</body>

</html>
```

| | |
|:---:|:---|
| <h1>&#x270e;</h1> |  _If you have multiple files of JavaScript code, and they export and import code from each other, they are called modules._ |

Your code has to start somewhere. For this application, it will start in a file called `main.js`. This file is the top-level [_module_ of code](https://javascript.info/modules-intro#what-is-a-module), and it will import code from other modules.


Notice the `<script>` tag in the HTML file. This connects your HTML and javascript. Be sure to include `type="module"`

> #### `giffygram/src/scripts/main.js`

```js
/**
 * Main logic module for what should happen on initial page load for Giffygram
 */

//Get a reference to the location on the DOM where the app will display
const applicationElement = document.querySelector(".giffygram")

/*
    This function performs one, specific task.

    1. Can you explain what that task is?
    2. Are you defining the function here or invoking it?
*/
const renderApp = () => {
    applicationElement.innerHTML = "Hello GiffyGram";
}

// Are you defining the function here or invoking it?
renderApp()
```

Start your Web server with the `serve` command in the terminal. Make sure you are in the `giffygram/src` directory when you do it.

![](./images/starting-serve.gif)

Now go to Chrome and paste with `Ctrl+V` on Windows or `Cmd+V` on Mac. Then hit enter and you should see a your message in the browser.