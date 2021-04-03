# Tilling the Field

## Setup

Have a terminal window open and change directory to `~/workspace/modern-farm`.

Run `npm run test` to start the automated testing task.

## Tilling Instructions

1. Create a `scripts/field.js` module.
1. Define a variable in this module whose initial value is an empty array. This array will store all of the plants that are growing in the field. Do not export the array.
1. In the module, define and export a function named `addPlant`.
1. The `addPlant` function must accept a seed object as input. The function will add the seed to the field (_How do you add something to an array? Do you remember the method for it?_).
1. Define and export a function named `usePlants` that returns a copy of the array of plants.
1. Be aware that when planting corn, an array of objects will be provided instead of a single object like all the other type of seeds. Investigate the [Array.isArray](https://www.geeksforgeeks.org/javascript-array-isarray-function/) method to check if corn got passed in, or one of the others.

#### Checking Your Logic

Write some temporary test code in the main module to check if your functions do their job correctly.

1. Create a seed object.
1. Invoke `addPlant()` and specify the seed object as the parameter.
1. Invoke `usePlants()` and store its return value in a variable.
1. Use `console.log()` to make sure your seed object got added to the array of plants in the field.
