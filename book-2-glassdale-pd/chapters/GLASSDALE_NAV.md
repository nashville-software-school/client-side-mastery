# Dynamic Navigation Bar



## Single Page Applications
Up until now, when you've built web pages with multiple pages, you've made multiple HTML files and linked them together using `a` tags. This works just fine, but there's another more efficient way to get the same result: a Single Page Application or SPA. That means that you only have _one_ HTML file that is essentially empty, and you use JavaScript to swap out content on the page.

For example, consider your Hello, World group project. You built an webpage with a nav bar at the top of the page. When a user clicked on a country in the nav bar, information from _that_ country appeared. You could accomplish the same thing with JavaScript by:

1. Putting an event listener on each link in the nav bar
1. When a user clicks on the link in the nav bar that says 'Thailand', execute the function that prints all the data for Thailand to the DOM
1. When a user then clicks on the link that says 'Turkey', clear the DOM and call the function that prints Turkey's data to the DOM
1. And so on, for each country in the nav bar


## What are event listeners?
Event listeners do exactly what it sounds like-- they listen for events and then run some code when the event occurs. Events in JavaScript can be anything-- a click, a scroll, a keypress, you name it. We're going to start out with click events.

> Note: The code we're about to write won't run immediately. It will wait patiently until it detects a click, and _then_ it will run.

Let's add a dark mode button to our Glassdale site. When the user clicks on a button, the background color of our page should turn from white to dark gray and the text should change to white. Copy and paste the following button at the top of your HTML file:

##### index.html
```html
<button id="dark-mode">Dark Mode</button>
```
Next, we need to grab a reference to that button in our JavaScript so we can manipulate it. For now, let's do this in `main.js` because it will affect the whole page:
#### main.js
```js
const darkModeButton = document.querySelector("#dark-mode")
```
So far, so good. Now let's add an event listener to the button so that JavaScript will know when a user clicks on it.
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
  bodyElement.classList.toggle("dark-background")
})
```
Right now, this code will add a class of `"dark-background"` to the entire body tag. To change how our website actually looks, we have to add some CSS.

##### main.css
```css
.dark-background{
  background-color: #2b362e;
  color: #fafcfb;
}
```

## Practice

### Nav Link for Criminals
Your job is to make a clickable navigation bar on your Glassdale site. Let's start with some boilerplate code.

#### index.html
```html
<!--Nav Bar Component -->
    <nav>
      <ul>
        <li>
          <a id="criminals-nav-link" href="#">Criminals</a>
        </li>
        <li>
          <a id="officers-nav-link" href="#">Officers</a>
        </li>
        <li>
          <a id="facilitiesnav-link" href="#">Facilities</a>
        </li>
        <li>
          <a id="notes-nav-link" href="#">Notes</a>
        </li>
      </ul>
    </nav>
```

Now, in your `CriminalList` component, add an event listener that will listen for a click on the appropriate navigation link. When the link is clicked, the event listener should execute the function that prints all the criminals to the DOM.

#### CriminalList.js
```js
document.querySelector("your selector goes here").addEventListener("click", () => {
    // invoke the function that prints the criminals
})
```
To test your code, _remove_ the line of code in `main.js` that invokes the `CriminalList` function. Now it should only run when you click the correct link in the nav bar.

### Officers and Locations
Add working nav links for Officers and Locations. Ignore the Notes link for now, we'll get to those later.






