# Event Delegation with JavaScript

Let's imagine the following scenario:
1. You're building a to-do list application
1. When the page loads, you only need to show a text input and a submit button for users to enter their first task.
1. When the user clicks the submit button, they see their to-do item on a list. Beside the to-do item, you might see a button that says "details".
1. When the user clicks on the "details" button, they see more information about the task they added.

Sounds fairly doable, right? We might represent a to-do item in our code like this:
##### JavaScript
```js
const todoObject = {
    id: 1
    name: "Take out the trash",
    details: "Make sure that you latch the bin lid so the raccoons don't get into the trash can"
}
```
Let's imagine that our to-do item components are built dynamically with JavaScript. The function that builds each to-do item's HTML component might look something like this:
##### JavaScript
```js
const buildTodoItem = (todoItemParam) => 
`<div id="todo-${todoItemParam.id}">
   <h5>${todoItemParam.name}</h5>
   <button id="show-details-${todoItemParam.id}">Show Details</button>
</div>`
```
If we entered a new task in the text input and clicked the submit button, our event listener could call the `buildTodoItem` function and we could end up with an HTML component that looks like this:
##### HTML
```html
<div id="todo-1">
   <h5>Take out the trash</h5>
   <button id="show-details-1">Show Details</button>
</div>
```

### What happens if we want to add an event listener to the "Show Details" button?

Normally, we would add an event listner like this:
```js
// This code will throw an error!
document.querySelector("#show-details-1").addEventListener("click", () => {
    // add logic here to print out the details of that particualr todo item
})
```
If we try to add this into our code, we get an error message! Nooooooooo! JavaScript is confused because we're trying to target the id of `"#show-details-1"`, which doesn't exist right when the page loads. It only exists in the DOM _after_ we enter a task and click the submit button. When the page loads, JavaScript tries to find an element with that id and comes up short. It throws an error because the element doesn't exist in the DOM _yet_.

### Adding the event listener on a parent element
To get around this error message, we have to add an event listener to something that _does_ exist in the DOM when the page loads. We can choose the closest hard-code parent element, or we can target the `body` tag itself. As long as we pick an element that's hard-coded in the HTML, we should be able to add an event listener without errors.

```js
// This code won't throw errors
document.querySelector('body').addEventListener("click", function(){
    // add logic here
})
```
This event listener will listen for a click _anywhere_ inside the body element. Since we only want to run logic _if_ the user clicks on a certain element (in this case, the `"#show-details"` button), we can add a conditional into our event listener to check what the user clicked on. 
> Remember that `event.target` gives us access to whatever element the user clicked on.
```js
// Listen for a click anywhere on the body
document.querySelector('body').addEventListener("click", function(){
    // Only run code IF the user clicks on a particular button
    if(event.target.id === "show-details-1"){
        // Add the details to the todo object
       document.querySelector("#todo-1").innerHTML += `<p>${todoObject.details}</p>` 
    }
})
```

### What are single page applications?
Another common scenario where we might need event delegation is in the case of **Single Page Applications**, or SPAs. Hence the name, SPAs only have one `index.html` file. Compare this to your Celebrity Tribute group project, which had multiple HTML documents linked through `<a>` tags in the nav bar. In a SPA, content is swapped in and out to a single container in your HTML document. When a user clicks on an elemnt in the nav bar,the container is cleared and new material is printed with JavaScript. SPAs are generally faster than multi-page applications because only one HTML document needs to be loaded into the browser. Because the entire web page is generated dynamically with JavaScript, any click events would need to be handled with event delegation. 


# Practice

### Practice: SPA Navigation Bar

#### Setup
Use the `basicProj` command to create a new project with an `index.html` file, a script file, and a CSS sheet.

#### Requirements
1. In your `index.html` file, create a navigation bar with four links: 
    - "Home"
    - "Contact Me"
    - "About Me"
    - "Projects"
1. When the user clicks on any given link, they should see an `h1` element with an appropriate heading and some lorem ipsum text. For example, when the user clicks on the "Home" link, they should see a heading that says "Home" and some dummy text.
    - All content should be rendered and removed dynamically with JavaScript
    - You should only have one HTML document.
1. In the "Contact Me" section, the user should see a form with two inputs: one for the user's name and one for their message. They should also see a button that says "Send".
1. When the user clicks the "Send" button, the message inputs should clear and they should see a confirmation message below the form that says "Your message has been sent"

### Challenge: Dynamic Cards

> The learning objective for this challenge is to practice event listeners for click events. You will also practice adding elements to the DOM, and removing elements from the DOM with the `removeChild()` method. You will even need to use the `split()` method on a string.

#### Setup

Use the `basicProj` command to create a new project with an `index.html` file, a script file, and a CSS sheet.

#### Requirements

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