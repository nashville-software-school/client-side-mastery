## The Fishing Boat

Time to set up the fishing boat. First, you need to think about your data structures.

1. The boat will have many fish.
1. Each fish will be represented by an object.
1. Here are the properties of each fish.
    1. Species
    1. Weight
    1. Price _(prices range from $3.00 to $10.00 per fish)_
    1. Amount _(how many of this species were caught today)_

Open your `fishingBoat.js` module and write some comments describing the data structures that need to be created.

Next, the fishing boat must have a function that the other modules can invoke in order to see today's catch.

* This function must be named `boatInventory`.
* The array of fish objects will be the return value when the function is invoked _(see data below)_.

Use this data.

```js
[
    { id: 1, species: "Halibut", weight: 6, price: 3.55, amount: 30 },
    { id: 2, species: "Mackerel", weight: 3, price: 4.10, amount: 48 },
    { id: 3, species: "Salmon", weight: 5, price: 3.05, amount: 25 },
    { id: 4, species: "Walleye", weight: 2, price: 9.45, amount: 19 },
    { id: 5, species: "Sunfish", weight: 25, price: 5.18, amount: 1 },
    { id: 6, species: "Orange Roughy", weight: 4, price: 6.95, amount: 37 },
    { id: 7, species: "Tuna", weight: 18, price: 8.66, amount: 5 },
    { id: 8, species: "Puffer", weight: 2, price: 9.84, amount: 52 }
]
```

## Algorithm Considerations

1. Does the function need any input to do its job, or does it have access to all the information it needs without a parameter?
1. Make sure you export the function _(example syntax below)_ so that other modules can import the function and invoke it.
    ```js
    // Example... do not copy pasta this. Write your own.
    const functionVariable = (goodParameterName) => {

    }

    module.exports = { functionVariable }
    ```
1. When should the function be invoked, and the fish array passed as an argument?

Now implement the algorithm as best you can. You won't know if you have the right algorithm until you build out other modules, but that's ok. Professional software developers know to start small with the knowledge that the algorithm is a living thing and will likely have to be adjusted as the project grows.

Perfectionists struggle with this, so if that's you, start adjusting the way you think about your work.