# Handling Browser Events with JavaScript

## Event based programming

Modern web application are becoming more and more event based rather than procedural. When a user performs any kind of gesture (click, key press, mouse over, etc.), the JavaScript layer will listen for that event and then perform some appropriate logic.

Let's imagine we want to add a "dark mode" to our website. When the user clicks on a button, the background color of our page should turn from white to dark gray and the text should change to white. For this example, we're assuming that the button we want to click on is already hard-coded into our HTML document, like this:
##### index.html
```html
<button id="dark-mode">Dark Mode</button>
```
Next, we need to grab a reference to that button in our JavaScript so we can manipulate it:
#### event.js
```js
const darkModeButton = document.querySelector("#dark-mode")
```
So far, so good. Now let's add an _event listener_ to the button so that JavaScript will know when a user clicks on it.
```js
darkModeButton.addEventListener("click", function(){
  // our logic for activating dark mode goes here-- this code only runs AFTER the button is clicked
})
```
See where we had a string of "click" up there? That's because we're specifically looking for a click event. We could also change that to `dblclick` if we wanted to listen for a double click, `keyup` if we wanted to listen for a keypress (in an input field), etc. But for now we can just stick with our click.

Let's write the logic that we want to happen after the button is clicked:

```js
darkModeButton.addEventListener("click", function(){
  // Select the entire body tag
  const bodyElement = document.querySelector("body)
  
  // Add a class
  bodyElement.classList.add("dark-background")
})
```
Right now, this code will add a class of `"dark-background"` to the entire body tag. To change how our website actually looks, we have to add some CSS.

##### events.css
```css
.dark-background{
  background-color: #2b362e;
  color: #fafcfb;
}
```

## Defining logic outside event listeners
In the example above, we wrote all the logic for what happens inside the event listner inside the event listner itself, in the form of an anonymous function. (An anonymous function is just one that doesn't have a name, like the ones in the event listeners above.) That works great unless you need to reuse your logic. 

For example, let's imagine that you have a form on your website and, any time the user types into a form field, you want to add a blue border around the field they're currently typing into. 

Your form might look like this:
##### index.html
```html
<h3>Contact Us</h3>
<form>
  <input type="text" id="first-name-input" placeholder="First Name" class="contact-form-input">
  <input type="text" id="last-name-input" placeholder="Last Name" class="contact-form-input">
  <textarea id="message-input" class="contact-form-input" cols="30" rows="10"></textarea>
</form>
```
You _could_ write an event listener for each element separately, like this: 
```js
document.querySelector("#first-name-input").addEventListener("keyup", function(){
// add logic here 
})

document.querySelector("#last-name-input").addEventListener("keyup", function(){
// add logic here
})

document.querySelector("#message-input").addEventListener("keyup", function(){
// add logic here
})
```
Since each event listener is going to do the same thing, we'd be writing the same (or very similar) logic three times. We want our code to be as [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself) as possible, so if we find ourselves writing the same thing three times it might be time to think about a better option.

Instead of defining an anonymous function _inside_ the event listener, let's define what we want to happen when we type into an input _outside_ the event listener so we can reference it three times.

##### script.js

```js
// Because this function is going to be used as an event listener, it gets a magical parameter by default called the event. 
function highlightCurrentField(eventObject){

  // The eventObject tells us which element fired the event-- in this case, which field we're typing into
  const currentField = eventObject.target
  
  // add a class of highlighted border 
  currentField.classList.add("highlighted-border")

}

```

Now we can reference our `highlightCurrentField` function in our event listeners!

```js
document.querySelector("#first-name-input").addEventListener("keyup", highlightCurrentField)

document.querySelector("#last-name-input").addEventListener("keyup", highlightCurrentField)

document.querySelector("#message-input").addEventListener("keyup", highlightCurrentField)
```

Our code still isn't as DRY as it could be. All of the inputs have the same class. Rather than selecting each element by its id, let's select them by their class so we only have to query the DOM once.

```js
const contactFormInputs = document.querySelectorAll(".contact-form-input")

// Loop over each input
for(var i = 0; i < contactFormInputs.length; i++){
  // Add an event listener to each input
  contactFormInputs[i].addEventListener("keyup", highlightCurrentField)
}
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
1. When the user enters in text into the text area and then clicks the create button, create a new DOM component that has a border, and includes it's own delete button.
1. Insert that new component into the DOM.
1. When the user clicks the *Delete* button, the containing card, and no other cards, should then be removed from the DOM. Not just made invisible, actually [removed](https://developer.mozilla.org/en-US/docs/Web/API/ChildNode/remove) from the DOM.

> **Pro tip:** The card's `id` attribute, and the button's `id` attribute should share some common value. Then, when the button is clicked, find the corresponding parent DOM component. Remember the `split()` method on a string? That will be helpful.

This is an example how one of your card components might look once it's in the DOM:
```html
<article class="card" id="card--1">
    <div>Hey, I entered some text</div>
    <div>
        <button id="delete--1">Delete This Card</button>
    </div>
</article>
```


## Challenge: Drag & Drop

> The learning objective of this challenge is to examine existing code that allows users to drag & drop elements around the screen, and use an `if` condition to prevent the drop from happening when a condition is true. Challenges will require you to practice your Googling skills. There are a couple technical keywords in the requirements below that you can use to find some information on the Web.

Open this [drag & drop JSFiddle project](https://jsfiddle.net/chortlehoort/1oo127p1/) and copy all of the code into a local project in your `workspace` directory. You won't know what all this code is doing. That's okay! Part of this exercise is about practicing finding your way around code that's over your head-- something you'll have to do a lot on the job.

The user should be able to drag one of the middle cards into either the top box, or the bottom box. However, there's a problem with the way the code currently works. There's also a couple changes you need to make.

1. If you drag one of the cards into the top/bottom box, and then drag another card into the first one, you get a nested card. You need to prevent this from happening.
1. The user should only be able to drag one card into either box. Use the `childNodes` property to ensure that, if a card is already in the box, another can't be added.
1. The user should be able to move a card from the top/bottom box back to the middle.
