# Who Likely Done It?

## Before this chapter...

- `fetch()`
- Arrays
- Iteration
- HTML SELECT tag


## Introduction

> A few days have passed since you got your initial list of criminals showing up and Maggie seemed very pleased with that start. You have been reviewing the case file and taking some notes, but this morning, Maggie wants to talk about how to move forward.
>
> "You've been doing this a while, and you know as well as I do that people who commit crimes are, more often than not, the ones who commit it again in the future." Maggie flips through some pages in a file she has sitting on her desk, and then looks at you.
>
> "Take Gerald McReiny here," and she turns the file around so you can see him. "I nabbed him for theft back is 2001. He did two years in the state pen, and then 8 months after that, we had a rash of stolen property in a section of town that wasn't far from where he was staying."
>
> Maggie leans back and says, "It took us a whole week to review all of the files for past offenders to filter it down to a list of likely suspects." She raises her eyebrows at you, and pauses.
>
> "Ah, gotcha. If I could provide a way to look at only those criminals who committed a particular type of crime in the past, we could cut that work down to just a couple minutes instead of a week," you say happily.
>
> "Exactly!" Maggie exclaims.
>
> "See if you can get that working and then show me what you've got when it's done".
>
> You head on back to your desk to get to work.

## Goal

In this chapter, you are going to be implementing a `<select>` element so that you have a drop-down element on the screen that lists all of the crimes that have been committed by criminals in the past.

In a future chapter, you are going to implement code that detects when the user selects a crime, and have the criminal list render only those criminals that were convicted of that crime.

![filter criminals by crime animation](./images/filter-criminals-by-crime.gif)

The Glassdale PD API has a resource that gives you a collection of all possible crimes that have been committed.

https://criminals.glassdale.us/crimes

You need to create two, new components in your application

1. The **`ConvictionProvider`** component will `fetch` those crimes and export a `useConvictions()` method for other components to import.
1. The **`ConvictionSelect`** component, which will invoke `useConvictions()` and then iterate that collection to fill out the dropdown in the browser.

## Using the map() Array Method

Before you get started on your code, here is a look at how to use the `.map()` array method to iterate a collection, and convert every item in that collection into something else.

Assume that you have a list of people objects in an array.

```js
const people = [
    { id: 1, name: "Caitlin Stein" },
    { id: 2, name: "Ryan Tanay" },
    { id: 3, name: "Leah Hoefling" },
    { id: 4, name: "Emily Lemmon" },
    { id: 5, name: "Bryan Nilson" },
    { id: 6, name: "Jenna Solis" },
    { id: 7, name: "Meg Ducharme" },
    { id: 8, name: "Madi Peper" },
    { id: 9, name: "Kristen Norris" }
]
```

That's the raw data that should _**always remain unchanged**_. If you want to display only a list of names in a dropdown list in your user interface, you would need to build a brand new array containing those values. You can use `.map()` for that.

```js
const fullNames = people.map(
    personObject => {
        const valueToBeInNewArray = personObject.name
        return valueToBeInNewArray
    }
)

console.log(fullNames)
// ['Caitlin Stein', 'Ryan Tanay', 'Leah Hoefling', 'Emily Lemmon', 'Bryan Nilson', 'Jenna Solis', 'Meg Ducharme', 'Madi Peper', 'Kristen Norris']
```

Now imagine you want to fill a dropdown box in your UI with last names. First, you would get a reference to an existing element, like a `section` or a `div`, and update its `.innerHTML` property like in the example below.

```js
const contentTarget = document.querySelector(".names")

contentTarget.innerHTML = `
    <select>
        ${
            people.map(personObject => {
                const fullName = personObject.name
                return `<option>${fullName}</option>`
            })
        }
    </select>
`
```

What's confusing, and also powerful, about the above code snippet is that you have string template **inside another string template**. That's the true power of the interpolation capability of `${}`. You can put any JavaScript expression inside those curly braces. The only limitation is that it is a single expression. You can't put multiple lines of code inside them. 😢

## Conviction Data Provider

The **`ConvictionProvider`** component will follow the same structure as your **`CriminalProvider`** component.

> **`glassdale/scripts/convictions/ConvictionProvider.js`**

```js
let convictions = []

export const useConvictions = () => convictions.slice()

export const getConvictions = () => {
    /*
        Load database state into application state with a fetch().
        Make sure the last `then()` sets the local `convictions`
        variable to what is in the response from the API.
    */
}
```

## Conviction Select Component

This component will render a `<select>` element with child `<option>` elements for each crime committed in the API.

#### Starter Code

> **`glassdale/scripts/convictions/ConvictionSelect.js`**

```js
/*
 *   ConvictionSelect component that renders a select HTML element
 *   which lists all convictions in the Glassdale PD API
 */
import { useConvictions } from "./ConvictionProvider.js"

// Get a reference to the DOM element where the <select> will be rendered
const contentTarget = document.querySelector(".filters__crime")

export const ConvictionSelect = () => {
    // Trigger fetching the API data and loading it into application state
    getConvictions()
    .then( () => {
      // Get all convictions from application state
      const convictions = useConvictions()
      render(convictions)
    })
}

const render = convictionsCollection => {
    /*
        Use interpolation here to invoke the map() method on
        the convictionsCollection to generate the option elements.
        Look back at the example provided above.
    */
    contentTarget.innerHTML = `
        <select class="dropdown" id="crimeSelect">
            <option value="0">Please select a crime...</option>
            ${
                something.map()
            }
        </select>
    `
}
```

## Optional Advanced Challenge: Map the Aquarium

If you want to practice using the `map()` array method a handful of times to build up the mental muscle, you can go back to your Martin's Aquarium application and replace all of the `for..of` loops in the list components to use `map()` instead.

For example...

```js
let locationListHTML = ""

for (const location of locations){
    locationListHTML += LocationAsHTML(location)
}

contentElement.innerHTML += `
    <article class="locations">
        ${locationListHTML}
    </article>
`
```

Would become...

```js
contentElement.innerHTML += `
    <article class="locations">
        ${locations.map(location => LocationAsHTML(location)).join("")}
    </article>
`
```

## Optional Advanced Challenge: Map the Farm

Likewise, the Modern Farm application code has many `for..of` loops in it to plant the seeds and harvest the seeds. Here's the modules you can refactor to use `map()`.

* catalog.js
* harvester.js

## Optional Advanced Challenge: Map the Journal

Open your `JournalEntryList.js` module and see if you can rewrite the `for..of` loop that iterates your entries

```js
for (const entry of entries) {

}
```

To work correctly with `entries.map()`.
