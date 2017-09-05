# Javascript: Functions

### Simple function

Go over the basics of functions and live code some examples.

```js
function sayHello() {
  document.write("Hello, world");
}

// Only when you write the name of the function with parenthesis, does it get executed.
sayHello();
```

### Function with arguments

```
function saySomething(message) {
  document.write(message);
}

saySomething("Hello");
saySomething("World");
```


### Functions with/without return values

```js
function reverseIt(originalString) {

  // Convert string to array, reverse the elements, and join back together
  var reversedString = originalString.split("").reverse().join("");

  // Return the new string
  return reversedString;
}

var result = reverseIt("flambajamba");
console.log(result);
```

### Functions are first-order objects

Can be passed as arguments to other functions.

```js
function performOperationOnString(originalString, functionToExecute) {
  var finalValue = functionToExecute(originalString);

  return finalValue;
}

function alphabetical(originalString) {
  var alphabeticalOrder = originalString.split("").sort().join("");

  return alphabeticalOrder;
}

var result = performOperationOnString("The lazy brown dog", alphabetical);
console.log(result);
```
