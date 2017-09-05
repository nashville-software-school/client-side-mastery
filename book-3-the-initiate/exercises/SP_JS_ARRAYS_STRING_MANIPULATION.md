# String Manipulation

## Setup

These commands are a helpful quick start. You may choose to ignore them completely and create your own directory structure. If you choose to use this recommendation, just copy the commands below and paste. It doesn't matter what directory you are currently in.

```bash
mkdir -p ~/workspace/exercises/spa/strings && cd $_
touch index.html
touch strings.js
```

## Requirements

1. Copy the code below into the JavaScript file
1. In your HTML, create an text input and a button.
1. The text input should only [accept letters](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#attr-pattern). No numbers.
1. Implement the logic in the `reversal` function that reverses the order of the characters in the string, and outputs the result in the DOM, below the text input.
1. Implement the logic in the `alphabits` function that return the characters in alphabetical order, and outputs the result in the DOM, below the text input.
1. Implement the logic in the `palindrome` function that determine whether the string is a palindrome. If it is, display the text "Your string is a palidrome" in the DOM, below the text input.
1. When the user presses the enter key in the text input, or clicks the button, set the value of the `testString` variable (see below) to the value of the input.
1. The output of each of the functions should immediately appear as well.

```js
function reversal() {

}

function alphabits() {

}

function palindrome() {

}

var testString = "";
reversal(testString);
alphabits(testString);
palindrome(testString);
```