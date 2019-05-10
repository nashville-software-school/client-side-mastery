# JavaScript Map

[Maps](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map) are intended to hold key value pairs. To this point in the course, you've been using plain old JavaScript objects (POJO) to do that, and it's worked fine. Yet using the `Map` object has advantages in many situations, which the linked article above tries to explain.

The main difference is that when you create a new object, you inherit all of the methods and properties from the big `Object` in JavaScript - `toString()`, `hasOwnProperty()`, etc. The next difference is that a `Map` is iterable like an array. With objects, you need to use `for..in` loop or `Object.keys`

If all you need to do is store key:value pairs, then use a `Map`

## Videos to Watch

1. [JavaScript ES6 - Maps](https://www.youtube.com/watch?v=QjYk58e-8v4)
1. [Map data structure & ES6 map object](https://youtu.be/_1BPrCHcjhs?t=169)
1. [JavaScript ES6 Maps vs Objects](https://www.youtube.com/watch?v=sAJ82Ma33kM)
1. [JavaScript ES6 Map Methods](https://www.youtube.com/watch?v=FIPjd0wycNI)

## Basic Keys and Values in Maps

To create a new entry in a Map, you use the `set()` method.

```js
const friends = new Map()
friends.set("John", { id: 1, "firstName": "John", "lastName": "Wark" })
friends.set("Steve", { id: 2, "firstName": "Steve", "lastName": "Brownlee" })
friends.set("Laura", { id: 3, "firstName": "Laura", "lastName": "Buchanan" })
```

To then get the value of one of the keys, use the `get()` method.

```js
friends.get("Steve") // { id: 2, "firstName": "Steve", "lastName": "Brownlee" }
```

If you want to determine if a Map has a certain key, use `has()`

```js
console.log(friends.has("Steve"))  // true
console.log(friends.has("Joe"))    // false
console.log(friends.has("John"))   // true
```

If you need to remove all items in the Map, use the `clear()` method.

```js
friends.clear()
console.log(friends.has("Steve"))  // false
console.log(friends.has("Joe"))    // false
console.log(friends.has("John"))   // false
```

## Add Properties to an Object Without Modifying the Object

A huge, but often misunderstood, difference between Object and Map is that the key on a Map can be an Object.

![WAT??](https://i.giphy.com/media/3o84szkYYORHu98qIw/giphy-downsized.gif)

```js
const friend = {
    "first_name": "Meg",
    "last_name": "Ducharme",
    "cohort": 15
}
```

That object works fine because the keys are simple strings. What if you wanted the key to be an array? Or another object?

```js
const friend = {
    { "first_name": "Meg", "last_name": "Ducharme" } : "Meg"
}
// Uncaught SyntaxError: Unexpected token {
```

```js
const groups = {
    ["Brenda", "Jisie"] : "Coworkers"
}
// Uncaught SyntaxError: Unexpected token ,
```

You can do this with a Map.

```js
const coworkers = ["Brenda", "Jisie"]
groups.set(coworkers, "Fellow instructors")

console.log(groups.get(coworkers))  // Fellow instructors
```

You can think of it as adding meta-data to the original array of strings, and it's done without modifying the original data structure.

```js
const rainfall = {
    "inches": [3,5,12,6,3,5,10]
}

const rainfallMetaData = new Map()
const totalRainfall = rainfall.inches.reduce(
    (curr, next) => curr + next
)

rainfallMetaData.set(rainfall, {totalRainfall})
rainfallMetaData.get(rainfall)  // { totalRainfall: 44 }
```

Now you can store as much meta-data about the raw data that you want. This is what the `rainfallMetaData` Map ends up looking like.

![](./images/map-visualization.png)

By storing this metadata about the data when it's first retrieved, we avoid having to perform costly calculations every time someone wants to view the metadata. In a small application with limited data, you won't see many savings, but consider an application that retrieves hundreds, thousands, or tens of thousands of data points. Performing the calculations needed to get the sum, the average, and the standard deviation **every time** the user chooses to view it, then you run into memory issues, and performance degradation.

It would be much more efficient to perform those calculations once, when the data is initially loaded, and store them.

## Practical Use

Consider, for a moment, your personal site. Specifically, your blog entries. Imagine that you want your blog view to show the title of each article, and a short synopsis of each article when it is rendered, instead of the entirety of the article content. You also want to show what order each article is in the timeline of all articles.

```html
My First Week at NSS
Post 1 of 22

It's been a whirlwind of getting to know how computers work and the basics ...
```

To make this work, whenever you render your blog, you need to perform certain calculations.

```js
const totalArticles = BlogFactory.articles.length

BlogFactory.articles.forEach((currentArticle, index) => {
    const articleHTMLRepresentation = `
        <h1>${currentArticle.title}</h1>
        <div>
            Post ${index + 1} of ${totalArticles}
        </div>
        <div>
            ${currentArticle.content.substring(0,77)}
        </div>
    `
    document.querySelector(".articles").innerHTML += articleHTMLRepresentation
})
```

Again, these aren't major calculations, but we can optimize this process with a Map.

1. Calculation of total articles.
1. Substring of each article.
1. Building HTML representation of each article.

> **File:** scripts/articles/factory.js

```js
{
    const ArticleMap = new WeakMap()

    const Articles = Object.create(null, {
        "init": {
            value: function () {
                ArticleMap.set(this, {})
            }
        },
        "condensed": {
            get: function () {
                return ArticleMap.get(this).condensed
            }
        },
        "articles": {
            get: function () {
                return ArticleMap.get(this).articles
            }
        },
        "all": {
            value: function () {
                return fetch("http://localhost:8088/articles")
                    .then(r => r.json())
                    .then(articles => {
                        // Add raw data to WeakMap
                        ArticleMap.get(this).articles = articles

                        // Create a new array of condensed articles
                        const articleArray = articles.map((article, i) => ({
                            id: i + 1, // Because otherwise it would start at 0
                            blurb: `
                                <article class="article" id="article!${i + 1}">
                                    <header class="article__header">
                                        <h1>${article.title}</h1>
                                    </header>
                                    <section class="article__content">
                                        ${article.content.substring(0,77)}${article.content.length > 76 ? "..." : ""}
                                    </section>
                                    <footer class="article__footer">
                                        Post ${i + 1} of ${articles.length}
                                    </footer>
                                </article>
                            `
                        }))

                        // Add condensed articles to WeakMap
                        ArticleMap.get(this).condensed = articleArray

                        /*
                            Dispatch an event at the document level alerting any
                            subscribers that the articles have been loaded
                        */
                        document.dispatchEvent(new Event("articles.loaded"))
                })
            }
        }
    })

    document.addEventListener("articles.loaded", (evt) => {
        const finalHTML = Articles.condensed
                                  .reduce((acc, curr) => `${acc}${curr.blurb}`, "")
        document.querySelector(".articleList").innerHTML = finalHTML
    })

    Articles.init()
    Articles.all().then(() => console.log(Articles.articles))
}
```

> **File:** scripts/articles/controller.js

```js
import factory from "./articles/factory"

document.addEventListener("articles.loaded", () => {
    const finalHTML = factory.condensed
                             .reduce((acc, curr) => `${acc}${curr.blurb}`, "")
    document.querySelector(".articleList").innerHTML = finalHTML
})

factory.init()
factory.all()
```
