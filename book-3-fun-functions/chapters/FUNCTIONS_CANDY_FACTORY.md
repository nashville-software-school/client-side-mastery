## Cooking Up Some Candy

In this exercise, you will be given ZERO starter code.

GASP!!

You will be defining some functions that perform the individual tasks involved in producing candy. Sweet little minions that will do all the tasks involved with making sugary treats.

Time to deconstruct the process of making candy.

1.  Buy some milk chocolate
2.  Add some mint flavoring
3.  Combine the chocolate and mint
4.  Bake the mixture
5.  Break the hardened sheet into 6 pieces
6.  🍫 🍫 🍫 🍫 🍫 🍫 Enjoy!

## Requirements for Your Minions

### Buy Chocolate

This first function is slightly different that the first one in the last exercise. Instead of returning an object with no properties on it...

```js
const example = {}
```

...you are gong to return an object with one property on it.

```js
const example = {
   property: "value"
}
```

Define a function named buyChocolate. The function needs no parameters. It should return an object with a type property whose value is "Milk chocolate".

### Add Flavoring

Define a function named addFlavoring. The function needs one parameter to accept an object as input. It should add a new flavor property to the object with a value of "Mint".

### Create Mixture

Define a function named makeBarkMixture. It should have one parameter for an incoming object to be stored for use in the function.

Time for another if block. This time, you will also need a corresponding else block.

The function must verify that the right flavor is being used to make the mixture. If the flavor property on the object is equal to "Mint", then you should add a new mixed property to the object with a value of true. If the flavor is not "Mint" then the property value should be false.

### Bake the Mixture

Define a function named bakeCandy. It should have one parameter for an incoming object to be stored for use in the function.

Time for another if block. This time, you will also need a corresponding else block.

The function should check if the mixed property on the incoming object has a value of true. If it does, then add a baked property to the object with a value of true.

If the mixed property is not true, then add a baked property with a value of false.

### Break the Bark

Define a function named breakBark. It should have one parameter for an incoming object to be stored for use in the function.

Time for another if block. No else block needed this time.

If the incoming object's baked property is true, the function should return a new array with 6 strings in it. Each string should be "Mint Chocolate Bark Piece".

If the baked property value is false, the function should not return anything. This means that the return statement should be inside the if block instead of outside of it.

```js
// Example code for only returning a value if a condition is true
if (variable === true) {
	return []
}
```

Recall:  To create a new array, you just need two square brackets. For example, here is how you can create an array with three rose strings in it.
