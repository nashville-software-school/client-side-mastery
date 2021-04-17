# Filtering Posts

## Learning Objectives

* You should be able to identify where a function is defined.
* You should be able to identify where a function is invoked.
* You should be able to identify where a function parameter is defined.
* You should be able to identify where a value is passed as an argument when a function is invoked.
* You should be able to identify where application state is retrieved for use by the component.
* You should be able to explain the execution steps of a `for..of` loop.

## Filtering Posts

Now for the final part of showing how many posts have been created since the year chosen from the select element in the footer.

First, you need access to the posts state, so import the function that provides a copy of that application state. Make this the first line of code in your component module.

> #### `giffygram/src/scripts/nav/Footer.js`

```js
import { getPosts } from "../store/index.js"
```

Now you can write a function in this component module that will do the work of filtering all posts. Since you need to check the `timestamp` property of each posts, then you need to iterate that array with a `for..of` loop.

In the loop, you will check if the `timestamp` property value of each post is greater than, or equal to, January 1st of the chosen year.

```js
/*
    Calculate the number of posts since a given year
*/
const postsSince = (year) => {
    const posts = getPosts()
    const epoch = Date.parse(`01/01/${year}`)
    const postsSinceYear = []

    for (const post of posts) {
        if (post.timestamp >= epoch) {
            postsSinceYear.push(post)
        }
    }

    return postsSinceYear.length
}

/*
    Initial state of post count
*/
let yearChosenByUser = 2020
let postSinceYearChosen = postsSince(yearChosenByUser)
```

The next step is to make sure that the function is invoked every time a year is chosen. Remove the `window.alert()` method call and

```js
applicationElement.addEventListener("change", changeEvent => {
    if (changeEvent.target.id === "yearSelection") {
        const yearAsNumber = parseInt(changeEvent.target.value)

        // Update the two component state variables
        yearChosenByUser = yearAsNumber
        postSinceYearChosen = postsSince(yearAsNumber)
    }
})
```

Now refresh your browser and choose a year. You will still notice that the HTML did not change. Even though you updated the value of the state variables, you still need to invoke the component function to re-generate the HTML.

How does the **`Footer`** component function currently get invoked? You import it into the **`Giffygram`** component module and invoke it there.

How does the **`Giffygram`** component function currently get invoked? You import it into the `main.js` module and invoke it in the `renderApp()` function.

```js
import { GiffyGram } from "./GiffyGram.js"

const applicationElement = document.querySelector(".giffygram")

const renderApp = () => {
    applicationElement.innerHTML = GiffyGram()
}

renderApp()
```

Since `renderApp()` is the only way to force all of your HTML to be regenerated, you somehow have to invoke it when state changes.

## Custom Events

A custom event is an event that you, the developer, broadcasts. You get to choose when it is broadcast.

When the user clicks something, the browser broadcasts a "click" event.

When the user presses a key, the browser broadcasts a "keyup" event.

You have no control over any of that. You just get to choose if you want something to happen when the event is broadcast.

With a custom event, **you** get to choose exactly when it is broadcast, and **you** get to choose what should happen when it is.

Update the change event listener in the footer with this code.

```js
applicationElement.addEventListener("change", changeEvent => {
    if (changeEvent.target.id === "yearSelection") {
        const yearAsNumber = parseInt(changeEvent.target.value)

        // Update the two component state variables
        yearChosenByUser = yearAsNumber
        postSinceYearChosen = postsSince(yearAsNumber)

        // Broadcast your own, custom event stating that some state changed
        applicationElement.dispatchEvent(new CustomEvent("stateChanged"))
    }
})
```

The `main.js` module is that only other module that really cares that state changed. Therefore, it will listen for that event and invoke `renderApp()`. This will cause **all** of the HTML for your application to be rebuilt from the ground up using the current state.

> #### `giffygram/src/scripts/main.js`

```js
import { GiffyGram } from "./GiffyGram.js"

const applicationElement = document.querySelector(".giffygram")

/*
    Listen to all the other components. When any of them
    say that state has changed, render the application again.
*/
applicationElement.addEventListener("stateChanged", () => {
    renderApp()
})

/*
    Generate all of the application HTML and update the
    content of the <main> element in the DOM
*/
const renderApp = () => {
    applicationElement.innerHTML = GiffyGram()
}

renderApp()
```

## Video Walkthrough

The following video will review the entire process from the last three chapters, and use the Chrome debugger to show the flow of logic as the user interacts with your application.

[![](./images/giffygram-footer-video.png)](https://vimeo.com/515018310)







