# :pushpin: Exercises

1. [Guinea Pig](../exercises/SW_JS_EVENT_LISTENERS_GUINEA_PIG.md)
1. [Dynamic Cards](../exercises/SW_JS_EVENT_LISTENERS_DYNAMIC_CARDS.md)
1. [WYSIWYG](../exercises/SW_JS_EVENT_LISTENERS_WYSIWYG.md)
1. [TSA](../exercises/SW_JS_EVENT_LISTENERS_TSA.md)

# Javascript: Event Based Programming

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
var outputEl = document.getElementById("output-target");

/*
  You can get a reference to DOM elements and
  directly attach an event handler. In this
  example, we get every element with a class of
  "article-section" and listen for when the
  user clicks on the element. When that event
  fires, the attached "handleSectionClick"
  function gets executed.
 */
var articleEl = document.getElementsByClassName("article-section");

// JavaScript, in the browser, automatically send the source
// event to the handler function for the event
function handleSectionClick (event) {
  console.log(event);
}

for (var i = 0; i < articleEl.length; i++) {
  articleEl.item(i).addEventListener("click", handleSectionClick);
}

/*
  Get a reference to the DOM element with an id of
  "page-header", and attach an event handler for the
  mouseover, and mouseout, events.
 */
header.addEventListener("mouseover", handleHeaderMouseOver);
header.addEventListener("mouseout", handleHeaderMouseOut);



/*
  We can also write an anonymous function (lamba expression)
  in the addEventListener declaration instead of using a
  function reference
 */
var fieldEl = document.getElementById("keypress-input");


/*
  Now we can start making a truly interactive experience
  combining HTML, JavaScript and CSS. When a user clicks
  on a button in the DOM, we can listen for that event in
  JavaScript, and then add, or remove, CSS classes.

  In this example, I simply use the `toggle()` method on
  the `classList` property of a DOM element to automatically
  add and remove a class.
 */
var guineaPig = document.getElementById("guinea-pig");


/*
  EVENT BUBBLING:

  You can add an event handler on the body tag, and since all
  browser events bubble up to the body, you can then put in
  conditional logic to handle the click event on many different
  elements in one function.
 */
document.querySelector("body").addEventListener("click", function(event) {

});
```
