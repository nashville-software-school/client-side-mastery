# :pushpin: Exercises

1. [Chaining Arrays](../exercises/SP_JS_ARRAYS_CHAINING.md)
1. [String Manipulation](../exercises/SP_JS_ARRAYS_STRING_MANIPULATION.md)
1. [Solar System](../exercises/SP_JS_ARRAYS_SOLAR_SYSTEM.md)

# Javascript: Array Methods

## Variable names

> **Reminder:** You can name variables whatever you like and it has **no impact** on what is actually stored in that variable. Naming a variable that will hold an array of widgets `x` makes it seem much more like a variable, but naming it `widgetArray` is more helpful. But it doesn't mean that it can only hold arrays. It is just a label.

## Basic array methods

### join

This combines all elements in an array into a single string, delimited by the character that you specify.

```js
var fruit = ["cherries", "apples", "bananas"];
var fruitString = fruit.join(","); // "cherries,apples,bananas"
fruitString = fruit.join(" "); // "cherries apples bananas"
fruitString = fruit.join("><");
```

### String.split()

This is the reverse of the `join()` method. It take a string and converts it into an array. You pass in the character that is the delimiter of each item in the string.

```js
var fruits = "watermelon|lemon|orange";
var fruitArray = fruits.split("|");
```

### reverse

Pretty simple, it reverse the items in an array

```js
var fruit = ["cherries", "apples", "bananas"];
fruit.reverse(); // ["bananas", "apples", "cherries"]
```

### sort

Pretty simple, it sorts the items in an array

```js
var fruit = ["cherries", "apples", "bananas"];
fruit.sort(); // ["apples", "bananas", "cherries"]
```

The tricky thing about sort is that it doesn't work very well with numbers. To sort numbers, you have to pass a custom function to the sort method. The default sort logic simply looks at the first character of each item and compares the ASCII value of that character.

```js
var numbers = [8, 1, 42, 13, 22, 7, 4, 53];
numbers.sort(); // [1, 13, 22, 4, 42, 53, 7, 8]
numbers.sort(function(first, second) { return first - second; }) // [1, 4, 7, 8, 13, 22, 42, 53]
```

### slice

The slice() method returns a shallow copy of a portion of an array into a new array object.

```js
var fruits = ["Banana", "Orange", "Lemon", "Apple", "Mango"];
var citrus = fruits.slice(1, 3); // ["Orange", "Lemon"]
```

### splice

The splice() method, unlike slice(), does not create a new array, but rather modifies the existing array. You can use it to remove items, or add new ones at any location.

```js
// Remove the item at position 2
var fruits = ["Banana", "Orange", "Lemon", "Apple", "Mango"];
fruits.splice(2, 1);

// Replace Orange with Tangerine
var fruits = ["Banana", "Orange", "Lemon", "Apple", "Mango"];
fruits.splice(1, 1, "Tangerine");

// Add new item at index 3
var fruits = ["Banana", "Orange", "Lemon", "Apple", "Mango"];
fruits.splice(3, 0, "Date");
```

### indexOf

This method find the index of the specified value in an array. If it's not found, it returns -1.

```js
var fruits = ["Banana", "Orange", "Lemon", "Apple", "Mango"];
fruits.indexOf('Lemon'); // 2
```

## Chaining methods

If you want to perform multiple operations on an array, you can execute several statements. For example, if you want sort the fruits in descending alphabetical order, and then insert a new item, you could write this code.

```js
var fruits = ["Banana", "Orange", "Lemon", "Apple", "Mango"];
fruits.sort();                  // Sort array items
fruits.reverse();               // Reverse the items
fruits.splice(4, 0, "Apricot"); // Add item
```

You can also chain all three operations together into one JavaScript statement.

```js
var fruits = ["Banana", "Orange", "Lemon", "Apple", "Mango"];
fruits.sort().reverse().splice(4, 0, "Apricot");
```

## Advanced array methods
The methods below are all iterators that perform a specific task on every item in an array. Remember of our old friend the `for` loop? When we write a for loop, we create a block of code inside the loop that applies a certain task to every item in the array. Sound familiar? That's right. These methods are like a for loop with its task to perform on the array item already baked into it. Below each example of the array method you'll see an example of how a for loop would achive the same result.

The `forEach` method on an array executed a callback function for each element in the array.

```js
function outputFruit(element, index, array) {
  console.log('array[' + index + '] = ' + element);
}

var fruits = ["apple", "banana", "cherry"];
fruits.forEach(outputFruit);
```
The above is the same as this `for` loop:

```js
for( var i = 0; i < fruits.length; i++ ) {
  console.log('fruits[' + i + ']  = ' + fruits[i]);
}
```

The `map()` method *creates a new array* with the results of calling a provided function on every element in this array.

```js
function reverseIt(element, index, array) {
  return element.split("").reverse().join("");
}

var fruits = ["apple", "banana", "cherry"];
var backwardFruits = fruits.map(reverseIt);
console.log(backwardFruits); // ["elppa", "ananab", "yrrehc"]
```
The above is the same as this `for` loop:

```js
var backwardFruits = [];
for( var i = 0; i < fruits.length; i++ ) {
  backwardFruits.push(fruits[i].split("").reverse().join(""));
}
console.log(backwardFruits); // ["elppa", "ananab", "yrrehc"]
```

The `filter()` method creates a new array with all elements that pass the test implemented by the provided function.

```js
function filterIt(element, index, array) {
  if (element.length === 5) {
    return element;
  }
}

var fruits = ["apple", "banana", "cherry"];
var filteredFruits = fruits.filter(filterIt);
console.log(filteredFruits); // ["apple"]
```
The above is the same as this `for` loop:

```js
var filteredFruits = [];
for( var i = 0; i < fruits.length; i++ ) {
  if (fruits[i].length === 5) {
    filteredFruits.push(fruits[i]);
  }
}
console.log(filteredFruits); // // ["apple"]
```

The `reduce()` method applies a function against an accumulator and each value of the array (from left-to-right) to reduce it to a single value.

```js
var sum = [0, 1, 2, 3, 4].reduce(function(previousValue, currentValue, index, array) {
  console.log("curent index: " + index);
  return previousValue + currentValue;
});
console.log(sum);
```
The above is the same as this `for` loop:

```js
var sum = 0;
var numbers = [0, 1, 2, 3, 4];
for( var i = 0; i < numbers.length; i++ ) {
  sum = sum + numbers[i];
}
console.log(sum);
```
