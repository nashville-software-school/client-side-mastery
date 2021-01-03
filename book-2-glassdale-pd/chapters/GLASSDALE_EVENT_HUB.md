# Filtering Criminals by Crime

In the last chapter, you build a dropdown menu of crimes. Right now the dropdown menu doesn't work, but that's about to change!

## Let's Talk About Event Listeners

When a user performs any kind of gesture (click, key press, mouse over, etc.), the JavaScript layer will listen for that event and then perform some appropriate logic.

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
    console.log("You clicked the dark mode button")
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
Right now, this code will add a class of `"dark-background"` to the entire body tag. To change how our website actually looks, we'd have to add some CSS.

##### events.css
```css
.dark-background{
  background-color: #2b362e;
  color: #fafcfb;
}
```

## Event Delegation

The event listener example we just saw works great as long as the dark mode button is hard coded into our HTML. But what if we want to put an event listener on an element that is build dynamically with JavaScript?

If we use the example code above and try to select our convictions dropdown, we'll get an error message.

> **`glassdale/scripts/convictions/ConvictionSelect.js`**
```js
// This code won't work!!
document.querySelector("#crimeSelect").addEventListener("change", (eventObject) => {
    console.log("You selected something from the convictions dropdown")
})

```
We run into trouble when JavaScript tries to place an event listener on an element that doesn't exist yet when the page initially loads. To get around this, we can put the event listener on a parent element that _definitely_ exists when the page loads. Let's use the `<main>` element that we hard coded into our HTML in Chapter One.

> **`glassdale/scripts/convictions/ConvictionSelect.js`**
```js
// This won't throw an error, but it will fire any time there's a change event anywhere in the main container
const eventHub = document.querySelector("main")
eventHub.addEventListener("change", (eventObject) => {
    console.log("You clicked somewhere in the main container")

    // To be more specific, we need to know specifically what we clicked on
    console.log("Here is the element you clicked on: ", eventObject.target)

    if(event.target.id === "crimeSelect"){
        console.log("You selected something from the crime dropdown")
        console.log("This is the crime that was selected: ", eventObject.target.value)
        // Your code goes here!
    }
})
```
Okay, we've gotten our event listener to work. What next?


## Let's Talk About Filter

The `filter()` method on an array creates a brand new array with a subset of items that exist in the original array. Only items in the original array that pass the test can make it into the new, happy, much better array. Here's an example.

Imagine that you have an array of people objects. Each object has the person's name and age. You're the bouncer at a bar, and you want to filter out everyone who isn't of legal drinking age. Here's how you would do that in JavaScript - 'cause, y'know, all bouncers are expert JavaScript developers.

```js
const hopefulPatrons = [
    { name: "Sally Fisher", age: 30 },
    { name: "Dylan Thomas", age: 19 },
    { name: "Callan Morrison", age: 26 },
    { name: "Juan Rodriguez", age: 20 }
]

const legalPatrons = hopefulPatrons.filter(currentPatron => {
    return currentPatron.age >= 21
})

// or

const legalPatrons = hopefulPatrons.filter(currentPatron => {
    if (currentPatron.age >= 21) {
        return true
    } else {
        return false
    }
})

// or

const legalPatrons = hopefulPatrons.filter(currentPatron => {
    const canEnterBar = false

    if (currentPatron.age >= 21) {
        canEnterBar = true
    }

    return canEnterBar
})
```

Three possible ways to write this logic. Everyone thinks differently, so you may think of yet another way to write that code. The point is that the test is written inside the function argument that is passed to `filter`. If that function returns true, then the current item being evaluated is allowed to be added to the new array.

```js
console.log(hopefulPatrons)

// Original array remains unchanged
[
    { name: "Sally Fisher", age: 30 },
    { name: "Dylan Thomas", age: 19 },
    { name: "Callan Morrison", age: 26 },
    { name: "Juan Rodriguez", age: 20 }
]

console.log(legalPatrons)

// Brand new array created that contains items that passed the test
[
    { name: "Sally Fisher", age: 30 },
    { name: "Callan Morrison", age: 26 }
]

```


## Implement Event Hub and Get Your Components Talking and Listening

Here's where we left the event listener in our conviction select component:

> **`glassdale/scripts/convictions/ConvictionSelect.js`**

```js

const eventHub = document.querySelector("main")

eventHub.addEventListener("change", (eventObject) => {

    if(event.target.id === "crimeSelect"){
        console.log("You selected something from the crime dropdown")
        console.log("This is the crime that was selected: ", eventObject.target.value)
        // ---------- Your code goes here ----------- //
        /*
        - When we select a crime, we need to filter the criminals in CriminalList.
        - Start by importing the CriminalList component at the top of this file.
        - Then call CriminalList, and pass in information about the crime that was chosen
        */

    }
})
```

This also means that we need to refactor our CriminalList component to accept an optional argument of a crime. If no crime is passed in, we should render all of the criminals. If a crime is passed in, we should filter our list of criminals and only render criminals who committed that crime.

> **`glassdale/scripts/criminal/CriminalList.js`**

```js
export const CriminalList = (convictionFilter) => {
  let criminalListContainer = document.querySelector(".criminal-list");

  criminalListContainer.innerHTML = ""

  getCriminals().then(() => {
    let criminals = useCriminals();

    // If we get input from the convictions filter, filter our criminals so that we only see ones with that conviction
    if(convictionFilter){

      criminals = // write your filter here

    }

    criminals.forEach((singleCriminal) => {
      criminalListContainer.innerHTML += Criminal(singleCriminal);
    });
  });
};
```

## Videos to Watch

1. NewForce Learning Team video [Basic JavaScript Event Listeners](https://www.youtube.com/watch?v=4XvM096cQF4&list=PLX0ucpUE_qIOUsxGNEPpP9yonb4zerVIC&index=3)
1. NewForce Learning Team video [JavaScript Event Listener Types](https://www.youtube.com/watch?v=5zlueGaybjc&index=4&list=PLX0ucpUE_qIOUsxGNEPpP9yonb4zerVIC)
