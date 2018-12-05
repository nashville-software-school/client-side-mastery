# Scope in JavaScript

When we use the word scope in programming, we are talking about some code's accessibility to **other** code. In JavaScript, this is driven by the curly braces. The curly braces build a virtual wall around the code which prevents any code that is outside the wall from seeing it.

Yet the code inside the walls has a special power. It can see outside the walls and access, or modify, that code - as long as that code, itself, is not contained in an equal, or lower scope. More on that in a bit.

To use the true power of [block scopes in JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/block), you need to use the `let` and `const` keywords for declaring variables. If you use `var`, block scope no longer applies, because those variables declared with `var` get [hoisted and initialized](https://www.sitepoint.com/demystifying-javascript-variable-scope-hoisting/). Always use `let` and `const` for variable declarations to avoid unintended side-effects of hoisting and initialization.

## Scopes You Know

You've already encountered several type of scope definitions in the course so far.

### For Loop Scope

`for` loops define a scope because they use curly braces to define what code will be executed on each iteration.

```js
for (let i = 0; i <=10; i++)
{ // Beginning of `for` scope

    /*
        Code outside of this scope has no idea that
        the `tenPlus` variable even exists.
        Only the code inside the block can access it.
    */
    const tenPlus = i + 10

    // Still inside the `for` block, so `tenPlus` is accessible
    if (tenPlus > 100) {
        console.log("Your number was too high")
    }

} // End of `for` scope

/*
    This will throw an exception stating that `tenPlus`
    is not defined. This is external code to the `for`
    loop's scope, and is therefore not capable of accessing
    anything inside it
*/
console.log(tenPlus)
```

## If Scope

```js
let dog = "Great Dane"
let monthlyFoodCost = 0

if (dog === "Great Dane")
{  // Beginning of `if` scope

    /*
        This code can look out into the "outer" scope
        and modify a variable defined out there.
    */
    const monthlyFoodCost += 23.00

}  // End of `if` scope
```

## Function Scope

JavaScript functions also have a block scope, but they also have something called *lexical scope*, also known as *static scope*. We will cover lexical scope later, so for now, we just look at it's block scope.

```js
const userWord = document.getElementById("word").innerHTML

function containsVowels (wordParameter)
{  // Beginning of `function` scope

    /*
        The `doesItHaveOne` variable can only be accessed
        within the curly braces of this function. The match()
        method on a string will return `null` if there
        are no matches, otherwise, an array will be returned.
    */
    const doesItHaveOne = wordParameter.match(/[aeiou]/gi)

    return doesItHaveOne !== null

}  // End of `function` scope

const itContainedVowels = containsVowels(userWord)

console.log(itContainedVowels) // true or false
console.log(doesItHaveOne) // doesItHaveOne is undefined
```

## Introducing Block Scope

You can isolate any code you want to make inaccessible simply by surrounding it in curly braces. It doesn't matter what scope you are currently in - global, if, for, function - any code surrounded by the braces is inaccessible.

```js
// In global scope
const product = "Mirror"

{
    const order = []
    order.push(product) // This is fine. `product` variable in outer scope
}

/*
    Nope...
    Undefined exception thrown. Can't look into inner scopes.
*/
order.clear()
```

## Videos to Watch

1. [JavaScript The Scope Chain](https://www.youtube.com/watch?v=FCAOcYazy9c)
1. [Javascript Tutorial | Scope & Closures | Ep20](https://www.youtube.com/watch?v=S3cBIww_6os)
1. [Environment, Scope and Closures in JS / Intro to JavaScript ES6 programming, lesson 16](https://www.youtube.com/watch?v=LhSCEWHazAU)
1. [Keeping Track of "This" in JavaScript](https://www.youtube.com/watch?v=JduQUNn7L4w)

## Scope Exercises

Some software developers were contracted to build some code, but there weren't quite clear yet on how scope works. Your job is to fix their code to stop all the errors from being thrown.

### C is for Cookie

```js
const cookies = ["Oatmeal Raisin", "Chocolate Chip", "Sugar", "Peanut Butter", "Snickerdoodle", "Ginger"]
let y = 1

for (let x = 1; y < cookies.length; x++) {
    const currentCookie = cookies[y]
    console.log(`Mmmmmmm... that's a good ${currentCookie} cookie`)
}
```

### Conjunction Function

```js
const conjunction = function (firstWord, secondWord) {
    const conjoinedWord = `${firstWord} ${secondWord}`
}

conjunction("Master", "Card")
console.log(conjoinedWord)
```

### Mod Squad

```js
{
    const ModSquad = {
        "members": ["Pete Cochran", "Linc Hayes", "Julie Barnes", "Capt. Adam Greer", "Chief Barney Metcalf"]
        "series": {
            "start": "1968",
            "end": "1973"
        }
    }

    const HTMLRepresentation = `<h1>The Mod Squad</h1>`

    ModSquad.members.forEach(member => {
        const HTMLRepresentation += `<div>${member}</div>`
    })
}

document.querySelector(".show-info").innerHTML = HTMLRepresentation
```

### Simon Says

There are two separate scoping issues in this code. Remember, `for` and `if` are their own block scopes and if something is declared with `let` or `const` then that variable only exists in that scope.

```js
const locations = [[1,1], [1,2], [1,3], [2,1], [2,2], [2,3]]

for (let k = 0; k < locations.length; k++) {
    const currentLocation = locations[k]

    if (currentLocation[0] > 2) {
        const invalidLocation = true
    }

    if (invalidLocation) {
        console.log("This location is invalid")
    }
}

/*
    Since k is used as the loop counter, it will be the
    total number of locations, not the invalid ones. You
    need to fix this somehow.
*/
console.log(`There were ${k} invalid locations`)
```

## Advanced Challenge: Lambda Llama

Not only can functions take other functions as arguments, but functions can also return functions! This is marked as an advanced challenge because you haven't been introduced to this concept yet.

The `llamaNamer` function defines an **_internal function_** and your job is to rewrite this code so that the internal function gets returned.

Remember, come to the staff and ask questions if you decide to take this one on and get stuck.

```js
const llamaNamer = function () {
    const possibleNames = ["Larry", "Leon", "Leona", "Les", "Laura", "Lemony", "Lars", "Lekisha"]
    const randomizer = Math.floor(Math.random() * 7)

    const namer = function () {
        const suffix = " the Llama"
        const name = possibleNames[randomizer]
    }

    return name + suffix
}

nameMaker = llamaNamer()
console.log(nameMaker())
```
