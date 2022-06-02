# Filtering Criminals by Crime

In the last chapter, you build a dropdown menu of crimes. Right now the dropdown menu doesn't work, but that's about to change!

<<<<<<< HEAD:book-2-glassdale-pd/chapters/GLASSDALE_EVENT_HUB.md

## Let's talk about Event Delegation

When we've built event listeners before, we targed elements that were hard coded into the HTML. But what if we want to put an event listener on an element that is build dynamically with JavaScript?

If we use the example code above and try to select our convictions dropdown, we'll get an error message.

> **`glassdale/scripts/convictions/ConvictionSelect.js`**
```js
// This code won't work!!
document.querySelector("#crimeSelect").addEventListener("change", (eventObject) => {
    console.log("You selected something from the convictions dropdown")
})

```
We run into trouble when JavaScript tries to place an event listener on an element that doesn't exist yet when the page initially loads. To get around this, we can put the event listener on a parent element that _definitely_ exists when the page loads. Let's use the `<body>` element that we hard coded into our HTML in Chapter One.

> **`glassdale/scripts/convictions/ConvictionSelect.js`**
```js
// This won't throw an error, but it will fire any time there's a change event anywhere in the main container
const eventHub = document.querySelector("body")
eventHub.addEventListener("change", (eventObject) => {
    console.log("You clicked somewhere in the body element")

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


## Let's Talk About Filtering
=======
## Before this chapter...

- Arrays
- Iteration
- Events

## Let's Talk About Filter
>>>>>>> upstream/master:projects/tier-3/glassdale/chapters/GLASSDALE_EVENT_HUB.md

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


## Filtering Criminals Based on Which Crime was Chosen

Here's where we left the event listener in our conviction select component:

> **`glassdale/scripts/convictions/ConvictionSelect.js`**

```js

const eventHub = document.querySelector("body")

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
    
      criminals = criminals.filter(singleCriminalInLoop => {
      // write the condition here to filter for criminals whose crime matches the convictionFilter value
      })

    }

    // at this point, the value criminals will either be all of the criminals (if no convictionFilter was selected) or the criminals that match the crime selected 
    // either way, we want to print them!
    criminals.forEach((singleCriminal) => {
      criminalListContainer.innerHTML += Criminal(singleCriminal);
    });
  });
};
```

## Videos to Watch

1. NewForce Learning Team video [Basic JavaScript Event Listeners](https://www.youtube.com/watch?v=4XvM096cQF4&list=PLX0ucpUE_qIOUsxGNEPpP9yonb4zerVIC&index=3)
1. NewForce Learning Team video [JavaScript Event Listener Types](https://www.youtube.com/watch?v=5zlueGaybjc&index=4&list=PLX0ucpUE_qIOUsxGNEPpP9yonb4zerVIC)
