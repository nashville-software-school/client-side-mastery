# Express Yourself

A phrase you will see as you explore the World Wide Web as a software developer is...

> "Your job as a web application developer is to express data as HTML."

It may seem like an odd way to say that, but what it means is that your code's sole purpose is to take raw data and make it look pretty in a Web browser.

For example, your code turns this data 👇🏽

```json
posts = [
    {
        "id": 2,
        "imageURL": "https://media.giphy.com/media/26xBI73gWquCBBCDe/giphy.gif",
        "userId": 6,
        "description": "Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.",
        "timestamp": 1561695022812,
        "title": "Enhanced global utilisation"
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

Into this in the Web browser 👇🏽

![](./images/data-as-html.png)

The data has been beautifully expressed as HTML so that a person can understand it and interact with it.

## Your Main Module


Every application needs an HTML file so that your data can be displayed beautifully. That file will be `index.html`.

> #### giffygram/src/index.html

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

Your code has to start somewhere. For this application, it is going to start in a file called `main.js`. Note the `<script>` tag in the HTML file above. That is how you will run your JavaScript code that will convert your raw data to be beautifully expressed as HTML.

> #### giffygram/src/scripts/main.js

```js
import { GiffyGram } from "./GiffyGram.js"

const applicationElement = document.querySelector(".giffygram")

export const renderApp = () => {
    applicationElement.innerHTML = GiffyGram()
}

renderApp()
```

The other file you will need is the **`GiffyGram`** component, whose Sole Reponsbility is to display the posts - at least for now. You are starting off with the simple stuff.

> #### giffygram/src/scripts/GiffyGram.js

```js
import { getPosts } from "./store/index.js"

export const GiffyGram = () => {
    const allPosts = getPosts()
    let htmlStringOfAllPosts = ""

    for (const postObject of allPosts) {
        const htmlRepresentationOfThisPost = `
            <section class="post">
                <header>
                    <h2 class="post__title">${postObject.title}</h2>
                </header>
                <img class="post__image" src="${postObject.imageURL}" />
            </section>
        `
        htmlStringOfAllPosts += htmlRepresentationOfThisPost
    }

    return htmlStringOfAllPosts
}
```

Then start your Web server with the `serve` command in the terminal. Make sure you are in the `giffygram/src` directory when you do it.

![](./images/starting-serve.gif)

Now go to Chrome and paste with `Ctrl+V` on Windows or `Cmd+V` on Mac. Then hit enter and you should see a single post for Giffygram appear in the browser.


![](./images/first-giffygram-post.gif)

## Displaying More Properties as HTML

In the next couple chapters, you will see more comprehensive code for displaying the properties of a Post as HTML, but you are encouraged to give it a shot first.

Open `src/GiffyGram.js` and add more HTML structure, and interpolate the `description`, `timestamp`, and/or the `userId` property in it.