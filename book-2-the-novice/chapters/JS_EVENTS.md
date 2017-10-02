# Handling Browser Events with JavaScript

## Event based programming

Modern web application are becoming more and more event based rather than procedural. When a user performs any kind of gesture (click, key press, mouse over, etc.), the JavaScript layer will listen for that event and then perform some appropriate logic.

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
var outputEl = document.getElementById("output-target")

/*
    You can get a reference to DOM elements and
    directly attach an event handler. In this
    example, we get every element with a class of
    "article-section" and listen for when the
    user clicks on the element. When that event
    fires, the attached "handleSectionClick"
    function gets executed.
 */
var articleEl = document.getElementsByClassName("article-section")

/*
    JavaScript, in the browser, automatically send the source
    event to the handler function for the event.
*/
function handleSectionClick (event) {
    console.log(event)
}

for (var i = 0; i < articleEl.length; i++) {
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
var fieldEl = document.getElementById("keypress-input")

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
var guineaPig = document.getElementById("guinea-pig")

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

## Practice - Dynamic Cards

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
1. When the user enters in text into the text area and then clicks the create button, create a new card element in the DOM that includes it's own delete button. You decide the height/width of the card.
1. When the user clicks the *Delete* button, the containing card, and no other cards, should then be removed from the DOM. Not just made invisible, actually [removed](https://developer.mozilla.org/en-US/docs/Web/API/Node/removeChild) from the DOM.

### Notes

1. In order to know which delete button the user clicked on, each one **must** have a unique value in its `id` attribute.
1. Remember your factory and generator functions. Generator should yield a unique identifier. Factory should generate DOM string.
1. 
