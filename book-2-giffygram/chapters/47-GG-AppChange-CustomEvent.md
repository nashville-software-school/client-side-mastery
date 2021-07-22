# Custom Events

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

The following video will review the entire process from the previous chapters and use the Chrome debugger to show the flow of logic as the user interacts with your application.

[![](./images/giffygram-footer-video.png)](https://vimeo.com/515018310)



