# Reacting to the User Actions - Events

## Learning Objectives
You should be able to:
* identify in your code where you are capturing user generated events in the browser
* explain the 2 arguments of `addEventListener`
* discuss the target of an event
* differentiate between the `id` property of an event target and the `value` property
* explain that event listeners are added to HTML elements
* understand _Event Bubbling_
* describe how you are using event bubbling to capture an event on a different element than the true source of the event

## Learning Resources

* [Event listeners in javascript](https://www.youtube.com/watch?v=QedZL8kXX6Y)
* [JavaScript DOM Tutorial #10 - Event Bubbling](https://www.youtube.com/watch?v=SqQZ8SttQsI)

## Browser Generated Events

In this chapter, you are going to write code that reacts to several things that a user can do to interact with Giffygram.

* Click on the logout button ("click")
* Click on the direct message image ("click")
* Type into the search field ("keyup")
* Select a year in a drop down menu _(i.e. a `<select>` element)_ ("change")


## Event Bubbling

Event bubbling is a web browser means that an event generated on a child is seen by the parent.

```html
<div id="container">
    <p id="fancyWords">A person will exhaust every possible measure to avoid the actual work of thinking.</p>
</div>
```

When you click on the `<p>` element in the code above, you can capture that click event on the `<p>` **or** on the parent `<div>`.

Watch the resource video above for a longer explanation.

## Listening on the Only Known HTML Element

When working in with the Giffygram application, there is only one HTML element that is **guaranteed** to be available all the time. It is the one that is defined in the `index.html` document.

```html
<body>
    <main class="giffygram"></main>

    <script type="module" src="./scripts/main.js"></script>
</body>
```

The `<main>` element will always be there. Because it is guaranteed to always be available, you will use the power of event bubbling to capture ALL events, no matter where they originate, on that element.

Open your **`NavBar`** module and add the following line of code at the top of the file. This gets a reference to the `<main>` element that is defined in your `index.html` document.

```js
const applicationElement = document.querySelector(".giffygram")
```

## Reacting to a Click

Now it is time to listen for your first browser generated event. When the user clicks on the logout button in the top-right corner, you are going to display a message that it was clicked.

<img src="./images/giffygram-logout-click.gif" width="700px" />

Add the following code, refresh your browser, and click the logout button.

```js
applicationElement.addEventListener("click", event => {
    if (event.target.id === "logout") {
        console.log("The logout button was clicked")
    }
})
```

#### EventListeners are methods that accept 2 arguments. The first one is the type of event. The second one is a function - what to do when the event is heard.


## Reacting to a Key Being Pressed

The next event listener will react to the user typing in characters into the search input field.

Note that the code is accessing the `.value` property of the event target - the input field - and then placing those characters into the message being displayed in the alert.

```js
applicationElement.addEventListener("keyup", event => {
    if (event.target.id === "postSearch") {
        const userInput = event.target.value
        console.log(`${userInput} has been typed into the search field`)
    }
})
```

## Selecting a Year

Now it's time to add an event listener that will react to a user selecting a year from the select element in the footer component.

You will need to create a `Footer` component and include it in your `GiffyGram` component.

> #### `src/scripts/nav/Footer.js`

```js
const applicationElement = document.querySelector(".giffygram")

applicationElement.addEventListener("change", event => {
    if (event.target.id === "yearSelection") {
        const yearAsNumber = parseInt(event.target.value)

        console.log(`User wants to see posts since ${yearAsNumber}`)
    }
})

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


## Practice: Direct Message and Home

1. Display an alert message of your choosing when the direct message icon _(i.e. the fountain pen in the navbar)_ is clicked. Remember that you are using event bubbling and that the event should be captured on the `<main>` element. That means you need to check what the `id` property of the event target is.
1. The peanut butter jar icon in the nav bar is how the user will, eventually, be able to go back to the default state of the application. Think of it as "going home". When that icon is clicked, display an alert message of your choosing. Currently there is not an `id` attribute on that image, so you will need to add one.