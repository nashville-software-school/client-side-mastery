# Teacher Guide

Points to cover:
- Anatomy of a function
- Invoking a function
- Arguments
- Return keyword 
- Functions invoking functions
- scope
- Other logic in functions

As an example, you may continue with our baking a cake functions that was started in the basic content section or create a new example.  Here's some helper code for baking a cake.

Let's look at scope with an example:

```js
// global scoped variable
const cake = {progress: 'not started'} 

const mixCakeBatter = () => {
    // the object cake is accessible here and can be updated.
  cake.progress = 'mixed'
}

console.log(ingredients) // this is not defined and will give an error
console.log(cake.progress) // this results in "not started" because we have not invoked the function yet


console.log(cake.progress) // this results in "mixed" because we invoked the function.


const bakeCake = () => {
  cake.progress = 'in oven'
}

const frostCake = () => {
  cake.progress = 'frosting'
}

const cakeComplete = () => {
  cake.progress = 'complete'
}

Console.log(cake.progress)
mixCakeBatter()
Console.log(cake.progress)
bakeCake()
Console.log(cake.progress)
frostCake()
Console.log(cake.progress)
cakeComplete()
Console.log(cake.progress)

// later refactor to add logic
const mixCakeBatter = (ingredients) => {
  // ingredientsNeeded is undefined outside of the function 
  const ingredientsNeeded = ['flour', 'sugar', 'eggs', 'baking soda', 'baking powder', 'salt', 'milk']

  //loop through ingredients and check if everything exists

  // add conditional for if all ingredients are present
  cake.progress = 'mixed'
}


const bakeCake = () => {
  if(cake.progress === 'mixed') {
    console.log("putting the cake in the oven")
    cake.progress = 'in oven'
  } else {
    cake.progress = 'not started'
    mixCakeBatter()
  }
}

const createCake = () => {
  mixCakeBatter()
  bakeCake()
  frostCake()
  cakeComplete()
}
```