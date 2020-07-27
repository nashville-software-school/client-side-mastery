# Filtering Criminals by Crime

In this chapter, you are going to implement the idea of the Event Hub from the last chapter and get your components talking to each other with messages.

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

Time for your to implement the Event Hub, get components sending and listening to messages, and then filtering the list of criminals with the `filter()` array method.

> **`glassdale/scripts/convictions/ConvictionSelect.js`**

```js
/*
    Which element in your HTML contains all components?
    That's your Event Hub. Get a reference to it here.
*/
const eventHub = document.querySelector(you_fill_this_in)
const contentTarget = document.querySelector(".filters__crime")

// On the event hub, listen for a "change" event.
eventHub.addEventListener("change", event => {

    // Only do this if the `crimeSelect` element was changed
    if (event.target.id === "crimeSelect") {
        // Create custom event. Provide an appropriate name.
        const customEvent = new CustomEvent("crimeChosen", {
            detail: {
                crimeThatWasChosen: event.target.value
            }
        })

        // Dispatch to event hub
        eventHub.dispatchEvent(customEvent)
    }
})


const render = convictionsCollection => {
    contentTarget.innerHTML = `
        <select class="dropdown" id="crimeSelect">
            <option value="0">Please select a crime...</option>
            ... you wrote awesome code here ...
        </select>
    `
}


const ConvictionSelect = () => {
    getConvictions()
        .then(() => {
            const convictions = useConvictions()
            render(convictions)
        })
}
```

> **`glassdale/scripts/criminal/CriminalList.js`**

```js
const eventHub = document.querySelector(".container")

// Listen for the custom event you dispatched in ConvictionSelect
eventHub.addEventListener('what custom event did you dispatch in ConvictionSelect?', event => {
    // You remembered to add the id of the crime to the event detail, right?
    if ("crimeId" in event.detail) {
        /*
            Filter the criminals application state down to the people that committed the crime
        */
        const matchingCriminals = appStateCriminals.filter()

        /*
            Then invoke render() and pass the filtered collection as
            an argument
        */
    }
})

const render = criminalCollection => {
    contentTarget.innerHTML = you_fill_this_in
}


// Render ALL criminals initally
const CriminalList = () => {
    getCriminals()
        .then(() => {
            const appStateCriminals = useCriminals()
            render(appStateCriminals)
        })
}
```