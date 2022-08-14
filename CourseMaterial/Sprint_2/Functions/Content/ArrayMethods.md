# Array Methods

JavaScript has many built-in methods, a property that contains a function definition to perform a specific task.  These are things that developers need to do so much, that creating a function for each of them is extensive.

In this section, we'll focus on array methods, one of the most useful classes of methods.

Array methods provide lots of options for making things easier.  

Here's a few examples:

```js
const arr = ['apples', 'oranges', 'bananas', 'grapes', 'strawberries']

console.log(arr)
arr.push('lemon') // adds an element to the end of the array
console.log(arr)
arr.pop()  //removes an element from the end of the array
console.log(arr)
arr.unshift('lime') // adds an item to the beginning of the array
console.log(arr)
arr.shift()
console.log(arr) // removes and item from the beginning of the array


const arr1 = ['a', 'b', 'c', 'd']
const arr2 = [1, 2, 3, 4]
console.log(arr1.concat(arr2)) // Add the two arrays arr2 at the end
console.log(arr1.join(''))  // creates a string from the elements
console.log(arr1.reverse())  // reverses the order of the array

// let arr3 = [5, 3, 'c', 'b', 'a', 4, 1, 2]
let arr3 = [5, 3, 4, 1, 2]
console.log(arr3.sort())  // puts the elements in order 

let arr4 =  ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']
console.log(arr4.slice(1,5)) // Makes a new array that starts at the first index and ends BEFORE the second index

let arr5 = [1, 2, 3, 4, 5, 'a', 'b', 'c']
arr5.splice(4, 1, 'monkey') // replaces 5 with 'monkey'
console.log(arr5)

let cities = ['Nashville', 'Atlanta', 'New York', 'Seatle', 'Minneapolis', 'Chicgo']
console.log(cities.length)  // gives the number of elements in the array
cities.forEach(city => console.log(city))

// the .map method creates a new array
const helloCities = cities.map(city =>  {
  return `Hello  ${city}` 
})

console.log(helloCities)
console.log(cities)

```

### Extra Resources

https://javascript.info/array-methods

https://livecodestream.dev/post/15-must-know-javascript-array-methods/

https://dev.to/ayeolakenny/10-most-used-array-methods-in-javascript-1l41

https://www.w3schools.com/js/js_array_methods.asp

https://www.geeksforgeeks.org/difference-between-methods-and-functions-in-javascript/#:~:text=JavaScript%20Methods%3A%20A%20JavaScript%20method,Content%20%7D%20%7D%3B%20object.methodName()

https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference

https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array


