# 5. Loops

We've dealt with a few situations where we wanted to do something to every item in an array (log it to the console, etc). We purposefully kept our arrays short, but we won't always have that luxury.

What if you were given an array with 200 movies in it and told to log each one the console? You'd probably want to throw your computer out the window after a few seconds of this:
```js
console.log(movieArray[0])
console.log(movieArray[1])
console.log(movieArray[2])
.
.
.
console.log(movieArray[200])
```
Fortunately, computers are really good at doing repetitve tasks quickly. Whenever we want to repeat an action multiple times, we use a loop to do the grunt work for us.

## While Loops
Here's a bare-bones while loop. This code will log `"Hello, world"` to the console 20 times and then stop.
```js
let i = 1;

while(i < 20){
  console.log("Hello, world");
  i++;
}
```
Let's break it down:
- `let i = 1` declares `i` as our counter variable and sets it equal to 1. You can name your counter variable whatever you want, but we usually use `i` because it stands for iterator. Every time a loop runs, it's called an _iteration_. We'll use this word to refer to how may times the loop has already run (first iteraiton, second iteration, etc).
- The code inside the curly braces will run *while* the expression in the parentehses evaluates to true.
- On the first iteration, `i` is `1`. Is `1` less than `20`? Yep, that's true! The code between the parentheses can run. It does two things:
    - Log `"Hello, world"` to the console
    - `i++` is the same thing as writing `i = i + 1`. We're reassigning it to be one more than itself.
- The second iteration, `i` will be 2. Is `2` less than `20`? Yep! The code block runs again.
- This process keeps going until `i` is no longer less than `20`. As soon as that expression evaluates to `false`, the loop stops.

Let's look at a more practical example.
```js
var moviesArray = ["Casablanca", "Star Wars", "Singing in the Rain", "The Wizard of Oz", "Die Hard"];

var i = 0;

while(i < moviesArray.length){
  console.log(moviesArray[i]);
  i++;
}
```
What's going on here?

- Remember that `moviesArray.length` evaluates to a number. In this example, `moviesArray.length` is 5 because there are 5 items in the array.
- The first time the loop runs, it checks to see if `i < moviesArray.length` evaluates to true. We just set `i` equal to `0` and we know that `moviesArray.length` is `5`. Is `0` less than `5`? Yep! It evaluates to `true`, so the code inside the curly braces runs.
    - We log `moviesArray[i]` to the console. Right now, `i` is `0`, so that's the same thing as writing `moviesArray[0]`. We should see `"Casablanca"` logged to the console.
    - `i` increments by 1.
- Now, on the second iteration, `i` is `1`. We do the whole process again. Is `1` less than `5`? Yep, true! The code inside the curly braces runs again, except this time it prints `moviesArray[1]` to the console, so we see `"Star Wars"`.
- This process continues and `i` keeps incrementing until it's no longer less than 5. (At that point, we've gotten to the end of the array.)


## For Loop
While loops are great for learning how loops work, but we won't actually use them very much. The for loop is much more common. It works in a similiar way, but the syntax is different.

```js
for(var i = 0; i < moviesArray.length; i++){
  console.log(moviesArray[i]);
}
```
This does the exact same thing as the while loop we wrote in the first example.
In a for loop, we have three expressions inside the parentheses that tell the loop how to behave:
1. The first expression (`var i = 0`) declares our counter variable. Our loop will start counting at 0.
1. The second expression (`i < moviesArray.length`) is the condition that must be `true` for the code block to run. In this case, the loop will keep going as long as `i` is less than `moviesArray.length`.
1. The third expression (`i++`) tells the counter varaible how to increment. Each time the loop runs, `i` will increase by 1.

## New Vocab
These are some important new words we've learned so far. If you don't remember what any of these mean, re-read the chapter so far or ask an instructor.
1. Loop
1. Iteration
1. Increment



## Exercises

### Setup

```sh
cd
cd workspace
mkdir loops-intro
cd loops-intro
touch main.js
git init
code .
```


### 1. Student Names
- In your JavaScript file, copy and paste the following array:
```js
var cohortOneStudents = ["Sable", "David", "Joey", "Nick", "Tommy", "Connor", "Charles", "Russ", "Bobby", "Josh", "Nikki", "Matt", "Dale", "Sydney"]
```
- Use a for loop to print each student's name to the console.

### 2. Interests
- In your JavaScript file, create an array of 5 of your interests.
- Loop through the interests and console log the phrase "One of my interests is: [your interest]." for each of the interests in your array.

#### Output:
```
One of my interests is: reading.
One of my interests is: coding.
One of my interests is: crying at videos of soldiers reuniting with dogs.
One of my interests is: The Marvelous Mrs. Maisel.
One of my interests is: cryptids.
```

### 3. Favorite Interest
- Refactor your loop from the previous exercise. Pick one of your interests as your absolute favorite interest. Add a conditional to your loop to check if each interest in the array is your favorite. When the loop gets to your favorite interest, it should print `"My absolute favorite interest is:"` followed by the name of your interest. Any other interests can be printed the same way that they were in the previous exercise.
##### Output:
```
One of my interests is: reading.
My absolute favorite interest is: coding.
One of my interests is: crying at videos of soldiers reuniting with dogs.
One of my interests is: The Marvelous Mrs. Maisel.
One of my interests is: cryptids.
```
## Push it (Real Good) to Github
---

Once you've completed the exercises, it is time to push your code to GitHub.
Make sure you have saved your work in VS code and then hop over to your terminal.

### First things first: 
```sh
git status
```
It should show changes waiting to be committed. 

### Next things next:

```sh
git add .
```
This will tell git we are keep track of our changes.

```sh
git commit -m "Loop exercises completed because I am a rockstar"
```

This commits your changes and will give you a means to go back to any version after this.

### Then things then:

Head over to your GitHub page. Up in the top right corner you will see a `+` sign. Click that and then click `New repository`.

1. Name your repository "Loops Intro" or whatever you fancy
- Make sure public is selected and nothing else is. 
2. Click `create repository`
3. Copy the second block of text that starts with `git remote add origin`

### Last things last:

Hop back to your terminal and `shift` + `insert` or right click and select paste. Hit enter and then go back to your GitHub repo and refresh it. You should see your code there. Good job, you're on your way to being a git pro.







