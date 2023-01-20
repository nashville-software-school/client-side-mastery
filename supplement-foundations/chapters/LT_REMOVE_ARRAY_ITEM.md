# Remove Item Function

## Learning Ojectives

* You should be able to understand that each item in an array has a numeric index that specifies its location in the array.
* You should be able to identify a function parameter.
* You should be able to identify where a function is invoked.
* You should be able to identify where arguments are provided for a function when it is invoked.
* You should be able to understand that if a function needs input to perform its task, it needs parameters.
* You should be able to explain that, if a function has 1 or more parameters defined, when the function is invoked, values need to be provided as arguments.
* You should be able to explain the purpose of the `splice()` array method.

## Discontinued Toys

Sometimes Leonid gets news from his suppliers that a toy has been discontinued, which means that he needs to remove it from his inventory.

Your job is to write another function that will perform this task, when needed.

1. Write a function and assign it to a variable named `removeProduct`.
1. When the function is invoked, the numeric `id` property of a particular toy will be specified as an argument, so define a single parameter for the function to store that number.
1. The function should find the index of the toy whose `id` equals the value of the parameter.
1. Use that index, along with the [splice() method](https://javascript.info/array-methods#splice) on the toy array to remove that item.
1. To verify that the item was removed, use `console.log()` to display the array.
