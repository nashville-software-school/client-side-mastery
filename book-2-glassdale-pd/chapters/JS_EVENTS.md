# Handling Browser Events with JavaScript

## Event based programming

Modern web application are becoming more and more event based rather than procedural. When a user performs any kind of gesture (click, key press, mouse over, etc.), the JavaScript layer will listen for that event and then perform some appropriate logic.

##### events.css

```css
.blue {
  color: blue;
}

.large {
  font-size: 2em;
}

.bordered {
  border: 2px dotted purple;
}

.rounded {
  border-radius: 10px;
}

.hide {
  display: none;
}

#guinea-pig {
  margin: 50px 0 20px 0;
  font-family: Helvetica;
  padding: 5px;
}

.card {
  border: 1px dashed darkgoldenrod;
  padding: 5px;
  margin: 5px;
}
```

##### index.html

```html
<header id="page-header">
  <h1>Page title</h1>
</header>

<ul>
  <li>Unordered list item 1</li>
  <li>Unordered list item 2</li>
  <li>Unordered list item 3</li>
</ul>

<article>
  <section class="article-section">Introduction</section>
  <section class="article-section">Body</section>
  <section class="article-section">Conclusion</section>
</article>

<input type="text" id="keypress-input">

<div id="output-target"></div>

<div id="guinea-pig">Leave me alone</div>
<button id="add-color">Add color</button>
<button id="make-large">Hulkify</button>
<button id="add-border">Capture it</button>
<button id="add-rounding">Rounded</button>
```

##### eventHandlers.js

```js
let outputEl = document.getElementById("output-target")

/*
    You can get a reference to DOM elements and
    directly attach an event handler. In this
    example, we get every element with a class of
    "article-section" and listen for when the
    user clicks on the element. When that event
    fires, the attached "handleSectionClick"
    function gets executed.
 */
let articleEl = document.getElementsByClassName("article-section")
let header = document.querySelector("#page-header")

/*
    JavaScript, in the browser, automatically send the source
    event to the handler function for the event.
*/
function handleSectionClick (event) {
    console.log(event)
}

for (let i = 0; i < articleEl.length; i++) {
    articleEl.item(i).addEventListener("click", handleSectionClick)
}

/*
    Define functions that hold logic to be performed when mouse
    events are triggered by the browser.
*/
function handleHeaderMouseOver (event) {
    outputEl.innerHTML = "You moved your mouse over me"
}

function handleHeaderMouseOut(event) {
    outputEl.innerHTML = "Why u leave me?"
}

/*
    Get a reference to the DOM element with an id of
    "page-header", and attach an event handler for the
    mouseover, and mouseout, events.
 */
header.addEventListener("mouseover", handleHeaderMouseOver)
header.addEventListener("mouseout", handleHeaderMouseOut)



/*
    We can also write an anonymous function (lamba expression)
    in the addEventListener declaration instead of using a
    function reference.
 */
let fieldEl = document.getElementById("keypress-input")

fieldEl.addEventListener("keyup", function (event) {
    outputEl.innerHTML = event.target.value
})


/*
  Now we can start making a truly interactive experience
  combining HTML, JavaScript and CSS. When a user clicks
  on a button in the DOM, we can listen for that event in
  JavaScript, and then add, or remove, CSS classes.

  In this example, I simply use the `toggle()` method on
  the `classList` property of a DOM element to automatically
  add and remove a class.
 */
let guineaPig = document.getElementById("guinea-pig")

function toggleClass (newClass) {
  guineaPig.classList.toggle(newClass)
  console.log("guineaPig.classList", guineaPig.classList)
}

document.getElementById("add-color").addEventListener("click", function() {
    toggleClass("blue")
})

document.getElementById("make-large").addEventListener("click", function() {
    toggleClass("large")
})

document.getElementById("add-border").addEventListener("click", function() {
    toggleClass("bordered")
})

document.getElementById("add-rounding").addEventListener("click", function() {
    toggleClass("rounded")
})


/*
  EVENT BUBBLING:

  You can add an event handler on the body tag, and since all
  browser events bubble up to the body, you can then put in
  conditional logic to handle the click event on many different
  elements in one function.
 */
document.querySelector("body").addEventListener("click", function(event) {
    console.log("You clicked on the body of the DOM")
})
```

## Videos to Watch

1. NSS Learning Team video [Basic JavaScript Event Listeners](https://www.youtube.com/watch?v=4XvM096cQF4&list=PLX0ucpUE_qIOUsxGNEPpP9yonb4zerVIC&index=3)
1. NSS Learning Team video [JavaScript Event Listener Types](https://www.youtube.com/watch?v=5zlueGaybjc&index=4&list=PLX0ucpUE_qIOUsxGNEPpP9yonb4zerVIC)

## Practice: Mirror, Mirror in the Code

> The learning objective for this exercise is to listen for the `keyup` event, and update the DOM when it is broadcast.

1. Create an input field in your DOM. Give it an id of `message`.
1. Create two article elements with unique id values. Use Flexbox to display them in a row, each taking 50% of the width of the browser.
1. Give each article a different border color.
1. Write an event listener that listens for the `keyup` event on the input field.
1. The event handler function should update the `textContent` property of both sections.

![event listener for keyup](./images/oJCxpJ0EeU.gif)

## Practice: Scrolling and Scaling

> The learning objective for this exercise is to practice listening for the `scroll` event broadcast by the browser, and updating DOM elements in response.

Create the following three files, and copy pasta the code provided.

> index.html

Put the following code into the `<body>` element.

```html
<article id="container">
  <section id="audrey">Feed me, Seymour</section>
</article>
```

> box.css

```css
#container {
  display: flex;
  min-height: 1500px;
}

#audrey {
  background-color: purple;
  color: snow;
  min-height: 100px;
  width: 50px;
  position: fixed;
}
```

> audrey.js

```js
const audrey = document.getElementById("audrey")

/*
    Add an event listener to the `document` object to listen
    for the "scroll" event.
*/
.addEventListener("", function () {
    /*
        Adjust the width of audrey to be 1/3 the value of
        `window.scrollY`. No lower than 50px, though.
    */



    /*
        Adjust the height of audrey to be 1/4 the value of
        `window.scrollY`. No lower than 100px, though.
    */
})
```

![example of how scroll event should look](./images/eBh72rsnv3.gif)

## Practice: Wonder Powers Activate!

> The learning objective of this exercise is writing event listeners to handle button clicks, and modifying the `classList` of DOM elements when those events are broadcast by the browser.

Setup the following files.

> powers.css

```css
.disabled {
    background-color: gray;
}

.enabled {
    background-color: fuchsia;
    color: goldenrod;
}
```

> index.html

```html
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Nashville Software School</title>
  <link rel="stylesheet" href="./styles/styles.css">
</head>

<body>

  <article id="powerList">
    <section id="flight" class="power disabled">
        Flight
    </section>
    <section id="mindreading" class="power disabled">
        Mind Reading
    </section>
    <section id="xray" class="power disabled">
        X-ray Vision
    </section>
  </article>

  <button id="activate-flight">Activate Flight</button>
  <button id="activate-mindreading">Activate Mind Reading</button>
  <button id="activate-xray">Active X-ray Vision</button>

  <button id="activate-all">Active All Powers</button>
  <button id="deactivate-all">Deactive All Powers</button>


  <script src="powers.js"></script>
</body>
</html>
```

> powers.js

```js
document.querySelector("#activate-flight").addEventListener()
```

1. Add the correct string as the first argument to `addEventListener()`
1. Write a function named `flightHandlerFunction` that will remove the `disabled` class on the corresponding `<section id="flight">` (section, not button) and replace it with a class of `enabled`.
1. Have your developer tools open. When you click the button, the following element...

```html
<section id="flight" class="power disabled">
```

Should then look like this.

```html
<section id="flight" class="power enabled">
```

Once you have that working, write two more JavaScript functions, and two more `querySelector().addEventListener()` statements for handling the click event on the other two buttons. Those event handlers should perform the same step of removing `disabled`, and adding `enabled` on the corresponding `<section>` elements

```js
document.querySelector("#activate-mindreading").addEventListener()
document.querySelector("#activate-xray").addEventListener()
```

Once that is complete, add two more buttons

1. Enable All Powers
1. Disable All Powers

Write two more event handlers for activating and deactivating **_all_** powers when the corresponding buttons are clicked. You will need to use the `document.querySelectorAll()` method for these.

> **Googling Tip:** [Adding classes to DOM components](http://lmgtfy.com/?q=javascript+add+class+to+DOM+element)

> **Googling Tip:** [Iterating over DOM components identified with querySelectorAll](http://lmgtfy.com/?q=iterating+over+elements+querySelectorAll)

---

> Challenges are optional exercises that you should only attempt if you have completed the practice exercises, and fully understand the concepts used in them.

## Challenge: One Function to Rule Them All

> The learning objective of this challenge to write a function handler to be used for multiple events, and uses information in the event argument to perform common logic.

You may notice that your code to enable individual powers (not all at once) is very similar. To keep your code DRY, make one function that will handle activating a power depending on which button is clicked. (Hint: one way to get started is to use `event.target.id.split("-")` in your function)


## Challenge: Dynamic Cards

> The learning objective for this challenge is to practice event listeners for click events. You will also practice adding elements to the DOM, and removing elements from the DOM with the `removeChild()` method. You will even need to use the `split()` method on a string.

### Setup

These commands are a helpful quick start. You may choose to ignore them completely and create your own directory structure. If you choose to use this recommendation, just copy the commands below and paste. It doesn't matter what directory you are currently in.

```bash
mkdir -p ~/workspace/exercises/javascript/cards && cd $_
touch index.html
touch cards.js
touch cards.css
```

### Requirements

1. Create an HTML page that contains a text area and a button labeled *Create*.
1. When the user enters in text into the text area and then clicks the create button, use a factory function that creates a new DOM component that has a border, and includes it's own delete button.
1. Insert that new component into the DOM.
1. When the user clicks the *Delete* button, the containing card, and no other cards, should then be removed from the DOM. Not just made invisible, actually [removed](https://developer.mozilla.org/en-US/docs/Web/API/Node/removeChild) from the DOM.

> **Pro tip:** The card's `id` attribute, and the button's `id` attribute should share some common value. Then, when the button is clicked, find the corresponding parent DOM component. Remember the `split()` method on a string? That will be helpful.

```html
<article class="card" id="card--1">
    <div>Hey, I entered some text</div>
    <div>
        <button id="delete--1">Delete This Card</button>
    </div>
</article>
<article class="card" id="card--2">
    <div>Hey, I entered some text</div>
    <div>
        <button id="delete--2">Delete This Card</button>
    </div>
</article>
```


## Challenge: Drag & Drop

> The learning objective of this challenge is to examine existing code that allows users to drag & drop elements around the screen, and use an `if` condition to prevent the drop from happening when a condition is true. Challenges will require you to practice your Googling skills. There are a couple technical keywords in the requirements below that you can use to find some information on the Web.

Open this [simple drag & drop JSFiddle project](https://jsfiddle.net/chortlehoort/1oo127p1/) and copy all of the code into a local project in your `workspace` directory.

The user should be able to drag one of the middle cards into either the top box, or the bottom box. However, there's a problem with the way the code currently works. There's also a couple changes you need to make.

1. If you drag one of the cards into the top/bottom box, and then drag another card into the first one, you get a nested card. You need to prevent this from happening.
1. The user should only be able to drag one card into either box. Use the `childNodes` property to ensure that, if a card is already in the box, another can't be added.
1. The user should be able to move a card from the top/bottom box back to the middle.
