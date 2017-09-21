# Scope in JavaScript

When we use the word scope in programming, we are talking about some code's accessibility to **other** code. In JavaScript, this is driven by the curly braces. The curly braces build a virtual wall around the code which prevents any code that is outside the wall from seeing it.

Yet the code inside the walls has a special power. It can see outside the walls and access, or modify, that code - as long as that code, itself, is not contained in an equal, or lower scope. More on that in a bit.

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
        This code can look out into the "higher" scope
        and modify a variable defined out there.
    */
    const monthlyFoodCost += 23.00

}  // End of `if` scope
```

## Function Scope

```js
const userWord = document.getElementById("word").innerHTML

function containsVowels (wordParameter)
{  // Beginning of `function` scope

    /*
        Remember that JavaScript evaluates from right to left.
        If a, e, i, o, or u are in the word that was passed
        in as a parameter, the `match()` method would evaluate
        as `true`, and then `true` would be returned.
    */
    return wordParameter.match("/aeiou/gi")

}  // End of `function` scope

const itContainedVowels = containsVowels(userWord)
```

## Introducing Block Scope

You can isolate any code you want to make inaccessible simply by surrounding it in curly braces. It doesn't matter what scope you are currently in - global, if, for, function - any code surrounded by the braces is inaccessible.

```js
// In global scope
const product = "Mirror"

{
    const order = []
    order.push(product) // This is fine. Product in higher scope
}

/*
    Nope... 
    Undefined exception thrown. Can't look into lower scopes.
*/
order.clear() 
```

# Videos to Watch

1. [Keeping Track of "This" in JavaScript](https://www.youtube.com/watch?v=JduQUNn7L4w)
1. []()
1. []()
1. []()
1. []()



# Lexskopistan Exercises
