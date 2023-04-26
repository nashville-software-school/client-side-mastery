# Seed Producing Modules

## Seed Instructions

1. Create a module for each type of possible plant in the `seeds` directory. For example, one of the types of food you grow is corn. Create a `scripts/seeds/corn.js` module. Make sure that each file uses all lowercase letters for the file name.
1. In each module define and export a function for creating a seed. Define the functions with the following syntax. If the plant is Asparagus, the function should be named `createAsparagus`. Same thing for all the others. Use arrow functions. Do not use the `function` keyword.
1. Each of these functions should return an object with the following properties. Look at the table below the instructions to see what the values for each object are.
    1. `type`
    1. `height`
    1. `output`
1. The one exception is corn. The `createCorn` function should return an array with two identical objects in it. Each with the proper keys and values.

### Plant Properties Table

| Type | Height | Output |
|--|--|--|
| Soybean | 20 | 4 |
| Corn | 180 | 6 |
| Sunflower | 380 | 3 |
| Asparagus | 24 | 4 |
| Wheat | 230 | 6 |
| Potato | 32 | 2 |

#### Checking Your Logic

Write some temporary, test code in the main module to invoke some of your seed creation functions that you defined in your modules. Use `console.log()` to ensure that you get the right value back.

The following code should display an object with three properties - type, height, output - in the developer console.

> ##### `/scripts/main.js`

```js
import { createAsparagus } from "./seeds/asparagus.js"

const asparagusSeed = createAsparagus()
console.log(asparagusSeed)
```
