# Taco Soup

## Time to add everything together and practice!

Now that you've gone through and reminded your brain about our main ingredients in programming, it's time to stir them all together into a lovely soup. These basics are something that transcends most languages and almost every problem can be solved with a loop and a conditional. 

If you are unsure about any of this, please reach out to an instructor. (Our job is to help you get through this thing called life (programming) and succeed so please, bother us)

## Setup

```sh
cd
cd ~/workspace
mkdir taco-soup
cd taco-soup
touch main.js
git init
code .
```

## Starter Code

```js
// You fill in some sample weekly miles traveled in this array
const weeklyMiles = [  ]

// Declare a variable to store the total. Initial value is 0.

/*
	Iterate the array of miles with a for..of loop.
	Add each mileage to the total mileage variable.
*/
for () {

}

// Declare a new variable to store the average miles over time

// Output the average miles and the total miles to the console
console.log()
```

## Run Your Code

In your terminal, run your code with the following command.

```sh
node main.js
```

When you run the code, it should display the following, but with actual numbers instead of the `xxx`.

```sh
I average xxx miles each week.
I have driven a total of xxx miles.
```




### 5. Harry Potter Titles
- Copy and paste the following array into your JavaScript file:
```js
var harryPotterTitles = ["and the Sorcerer's Stone", "and the Chamber of Secrets", "and the Prisoner of Azkaban", "and the Goblet of Fire", "and the Order of the Phoenix", "and the Half-Blood Prince", "and the Deathly Hallows"];
```
- Use a for loop to output the complete titles to the console.
##### Output:
```
"Harry Potter and the Sorcerer's Stone"
"Harry Potter and the Chamber of Secrets"
.
.
.
"Harry Potter and the Deathly Hallows"
```

### 6. Student Grades
- Copy and paste the folowing array of grades into your JavaScript file:
```js
var grades = [92, 91, 75, 66, 52, 90, 83, 85, 64, 90, 72, 88, 77, 98, 100, 73, 92]
```
- Loop through the grades with a for loop
    - If the current grade is greater than or equal to 0 and less than or equal to 69, log "You got an F" to the console.
    - If it's between 70 and 76, log "You got a D" to the console.
    - If it's between 77 and 84, log "You got a C" to the console.
    - If it's between 84 and 92, log "You got a B" to the console.
    - If it's between 93 and 100, log "You got an A" to the console.

### 7. Two, Four, Six, Eight  - Who do we appreciate?! CHEER
1. Write a loop that counts by 2's and creates the following output.

##### Output

2
4
6
8
Who do we appreciate?!

### 8. Student Grades Take Two

- Copy and paste the folowing array of grades into your JavaScript file:
```js
var grades = [92, 91, 75, 66, 52, 90, 83, 85, 64, 90, 72, 88, 77, 98, 100, 73, 92]
```
Loop through the grades with a for loop.  Use an if statement to find the highest and lowest grades and then write them to the console.


### 9. Interrupting Cow
1. Copy and paste the following array into your JavaScript file:
```js
var sentenceArray = ["the", "cow", "danced", "through", "the", "trees", "in", "the", "light", "of", "the", "moon"];
```

3. Write a loop that builds `sentenceArray` into a real sentence, except every fourth word should be "MOOOOOO". Hint: look up the [modulus operator](https://www.w3schools.com/js/js_arithmetic.asp).
4. Print your sentence ot the console.

#### Output:
```
the cow danced MOOOOOOOO through the trees MOOOOOOOO in the light MOOOOOOOO of the moon
```

### 10. Student Grades
Take the following array from the student grades exercise above. Each entry in the array represents a different student's percentage grade for the entire course:
```js
var grades = [92, 91, 75, 66, 52, 90, 83, 85, 64, 90, 72, 88, 77, 98, 100, 73, 92]
```
Use JavaScript to answer the following questions:
  1. How many students got A's?
  1. How many students got B's?
  1. Which was the most common letter grade?
  1. What was the average percentage grade in the class?


