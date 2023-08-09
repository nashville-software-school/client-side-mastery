# Sowing the Field With Your Tractor

## Sowing Instructions

1. Create a `scripts/tractor.js` module.
1. In this module, define and export a `plantSeeds` function.
1. The function must accept the year's planting plan as input _(i.e. it must define a parameter)_.
1. The plan is an array. It contains 3 arrays representing the rows in the field to be plants. Figure out how to iterate both the parent array and the child arrays.
    ```js
    // Example growing plan. Actual plan is bigger.
    [
        ["Potato", "Soybean", "Soybean", "Corn"],
        ["Wheat", "Corn", "Wheat", "Asparagus"],
        ["Asparagus", "Wheat", "Soybean", "Corn"],
        ["Asparagus", "Soybean", "Potato", "Wheat"]
    ]
    ```
1. As you iterate the row of food types to be planted, invoke the corresponding factory function _(e.g. if the food type is "Asparagus", invoke the `createAsparagus` function to get an asparagus seed)_.
1. Take that seed and add it to the array of plants in the field module.

#### Checking Your Logic

In the `main.js` module, invoke the function that plants all of the seeds, and then get the plants array from the `fields.js` module. Then use `console.log()` to see if the plants array has been populated correctly.
