# 6. Conditionals
Conditionals decide whether or not pieces of code should run.
```js
if(2+2 === 4){
  console.log("Math works!");
} else {
  console.log("Math is broken.")
}

// Expected output: "Math works!"
```

In the example above, the first thing JavaScript does is evaluate the code inside the parentheses to see if it's `true` or `false`. In this case, it checks to see if `2+2` equals `4`. It does! That statement evaluates to `true`, so the code inside the `if` block runs. If that statement had evaluated to `false`, the code inside the `else` block would have run instead.

You can add as many conditions as you want with `else if`. In the following example, JavaScript will try each condition in order. As soon as one of them evaluates to `true`, it will run that code block and skip the rest. 

```js
var time ="afternoon";

if (time === "morning"){
  console.log("Good morning!");
} else if (time === "afternoon"){
  console.log("Good afternoon!");
} else if (time === "evening"){
  console.log("Good evening!");
} else {
  console.log("Hello!");
}

// Expected output: "Good afternoon!"
```


## Comparison Operators
Did you notice the weird looking triple equals sign up there?  That wasn't a typo; that's how we compare two values in JavaScript to see if they're equal. Comparison operators always evaluate to `true` or `false`. 

```js
// Triple equals will check to see if the type and the value are equal
"Hello" === "Hello"; //true
24 === "24"; // false

// Double equals will compare values as if they're the same type, even if they're not. This can get messy, so you should default to triple equals 
24 == "24" // true


3 > 23 // false, 3 is not greater than 23
22 < 100 // true, 22 is less than 100
24 <= 25 // true, 24 is less than or equal to 25
62 >= 4 // true, 62 is greater than or equal to 4
```
We can also check to see if things are NOT equal.
```js
var name = "Jordan";
if(name !== "Dwayne"){
  console.log("Too bad for you!");
}
// Expected output: "Too bad for you!"
```

## Logical Operators
We can also check to see if more than one condition is true.

```js
var fullMoon = true;
var isWolf = false;

// This block of code will only run if the moon is full AND you're a wolf. Right now, this code won't run because the value of isWolf is false.

if(fullMoon && isWolf){
  console.log("AWOOOOOOOOOOO");
}

// What if we want non-wolves to be able to howl at the full moon too? This block will run if you're a wolf OR if the moon is full. However, if both conditions are false (you're not a wolf and the moon is not full), the code will not run.

if(fullMoon || isWolf){
  console.log("AWOOOOOOOOOOO");
}

```



## Practice

### Setup

```sh
cd
cd workspace
mkdir conditionals-intro
cd conditionals-intro
touch main.js
code .
```


### 1. Check Your Math
1. Use JavaScript to check and see if the following comparisons are true. For each of the following, log `"True fact!"` to the console if the condition evaluates to true and `"LIES!"` to the console if it doesn't.
    - Is the sum of 1 and 1 greater than 5?  
    - Is the product of 4 and 5 less than or equal to 20?
    - Is the difference between 6 and 2 greater than or equal to 0?
    - Is the quotient of 100 divided by 4 greater than 20? 

### 2. Dog People vs. Cat People
1. In your JavaScript file, declare a new variable called `likesDogs` and set it equal to `true` or `false`.
1. If `likesDogs` is true, log "You're a dog person!" to the console. If not, log "You're a cat person!" to the console.


### 3. Greetings
- In your JavaScript file, create a new object representing a person. Your object should have at least two properties: one for the person's name and one for their preferred language.

- Write a conditional that checks for the following:
    - If the person's preferred language is English, print "Hello, [name]!" to the console.
    - If the person's preferred language is Spanish print "Hola, [name]!" to the console.
    - If their preferred language is French, print "Bonjour, [name]!" to the console.


### 4. Student Grades
- In your JavaScript file, declare a new variable called `grade` and give it a number value between 0 and 100.
- Write a conditional that converts the number grade to a letter grade:
    - If the value of `grade` is greater than or equal to 0 and less than or equal to 69, log "You got an F" to the console.
    - If it's between 70 and 76, log "You got a D" to the console.
    - If it's between 77 and 84, log "You got a C" to the console.
    - If it's between 84 and 92, log "You got a B" to the console.
    - If it's between 93 and 100, log "You got an A" to the console.

## (Just) Push (Play) to Github
---

Once you've completed the exercises, it is time to push your code to GitHub.
Make sure you have saved your work in VS code and then push your code up. You can reference last chapter or our handy dandy [Git Solo Workflow ](./GITHUB_FLOW.md) bookmark that you have FOR SURE bookmarked because giving Sarah anxiety this early in the Cohort is against the Geneva Convention. 
