# Automating Martin's Website

Now that you have a module whose responsibility is to maintain the state of your application, now you need to convert that raw data into HTML representations and render them in the browser. In this chapter you will automate the creation of the HTML list of fish from the objects in your fish collection, so that you never have to copy/paste the HTML directly when a fish dies, or a fish is added.

## Remove Hard-Coded HTML

Open `index.html` and delete the `<section class="fishList">` element and all of the children fish elements.

## Defining the List Component

Next, create a module, place the following code in it and update the code to make the correct import from the database module.

This module exports a function as well. This one returns a newly constructed string that is filled with HTML syntax. The HTML will be a visual representation of the fish object for a person to see in the web browser.

> **`workspace/martins-aquarium/scripts/FishList.js`**

```js
// Import the function that returns a copy of the fish array
import {} from ''

export const FishList = () => {
    // Invoke the function that you imported from the database module
    const fishes = invokeTheRightFunctionHere()

    // Start building a string filled with HTML syntax
    const htmlString = '<article class="fishList">'

    // Create HTNL representations of each fish here
    for (const fish of fishes) {

        // Why is there a backtick used for this string?
        htmlString += `<section class="fish card">
            <div><img  class="fish__image image--card" src="${fish.image}" /></div>
            <div class="fish__name">${fish.name}</div>
            <div class="fish__species">${fish.species}</div>
            <div class="fish__length">${fish.length}</div>
            <div class="fish__location">${fish.location}</div>
            <div class="fish__diet">${fish.food}</div>
        </section>
`
    }
    htmlString += `</article>`

    return htmlString
}
```

## Rendering the List in Main Module

Since we want the fish to be immediately rendered when the page loads, then that falls within the responsibility of the `main.js` module. Import the list component into main and invoke the component function.

> **`workspace/martins-aquarium/scripts/main.js`**

```js
// Import the FishList function from the correct module
import {} from ''

/*
    What is the CSS selector for the element where you
    want to display the fish?

    Use . for elements with a "class" attribute
    Use # for elements with an "id" attribute
 */
const parentHTMLElement = document.querySelector("insert selector here")


parentHTMLElement.innerHTML = FishList()
```

## Your First Dynamic Content

Now refresh your browser again and all of your fish should be back in the browser.

![dynamically rendered fish components](./images/fish-list-with-for-loop.png)

## CONGRATULATIONS!!

You just took your first step towards being a web application developer. You took data in a raw format of arrays and objects, converted the data into HTML representations, and then displayed those in the browser for people to enjoy.
