# Footer Component

You may have implemented a **`Footer`** component in a previous chapter as a personal challenge. If you did, it was fairly simplistic and you will make it more complex in this chapter. If you didn't make that component then this is all brand new to you!

| | |
|:---:|:---|
| <h1>&#x270e;</h1> |  _A footer element is the name for a component that is at the bottom of a web page_ |

## More Data

Visit the [morePosts.js](./data/morePosts.js) file and copy pasta the array of users and posts into your `giffygram/src/store/index.js` file so that you have a bit more data to work with.

## Footer Component

Here is the code you need for the **`Footer`** component. After you have the

> #### `giffygram/src/scripts/nav/Footer.js`

```js
export const Footer = () => {

    // HTML to be returned to GiffyGram component
    return `
        <footer class="footer">
            <div class="footer__item">
                Posts since <select id="yearSelection">
                    <option>2020</option>
                    <option>2019</option>
                    <option>2018</option>
                    <option>2017</option>
                </select>
                <span id="postCount">0</span>
            </div>
        </footer>
    `
}
```

Next, import this new component function into the GiffyGram module and invoke it last in the order of components.

> #### `giffygram/src/scripts/GiffyGram.js`

```js
import { PostList } from "./feed/PostList.js"
import { Footer } from "./nav/Footer.js"
import { NavBar } from "./nav/NavBar.js"

export const GiffyGram = () => {
    const giffyGramHTML = `
        ${ NavBar() }
        ${ PostList() }
        ${ Footer() }
    `

    return giffyGramHTML
}
```

Upon refresh, your should see the footer element at the bottom of Giffygram.

![](./images/giffygram-with-footer.png)

In the following chapters, you are going to implement the code that will show how many posts have been created since a specific year. The user will select a year from the select element, and the number next to the element will show the number of posts.
