# Note Collection


In this chapter, you will build an array filled with objects that represent notes about your daily learning.

## Setup

These commands will create a directory for this project, and a JavaScript file in which you can write your code. Lastly, it will open up the directory is Visual Studio Code.

```sh
cd ~/workspace
mkdir daily-notes
cd daily-notes
touch notes.js

code .
```

## Objects in Arrays

Just like with your phones and toys from the previous project, start with a variable whose value is an array. Define 2 objects in that array. Each object should have the following properties on it.

1. `id` _(Unique identifier, or primary key)_
1. `subject` _(What you learned about)_
1. `date` _(The date you learned it)_
1. `feeling` _(How you felt when learning it)_
1. `timeSpent` _(Roughly how long you learned about it, minutes)_

> **Vocabulary check:** What is the data type of each property? Which ones should be a string type, and which should be an integer?


Here's some starter code. You add the rest of the properties to each object. You decide what the values of each property should be. Think back on the last few days of what you have worked on at NSS.

> #### `~/workspace/daily-notes/notes.js`

```js
const notes = [
    {
        id: 1,
    },
    {
    }
]
```

When you are done, use `console.log()` to display the data structure to the terminal. Then run the following command in the terminal to see if it works correctly and displays the array, or if you have a syntax error. If you do have an error, make sure you have all the commas that you need after you properties.

```js
node notes.js
```

Did you remember to add an `id` property to the second object?

