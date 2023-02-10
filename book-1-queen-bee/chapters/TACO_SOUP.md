# 7. Taco Soup

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



### Harry Potter Titles
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

### Student Grades
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

### Student Grades: Part 2
Utilizing the array from the student grades exercise above, each entry in the array represents a different student's percentage grade for the entire course:

Use JavaScript to answer the following questions:
  1. How many students got A's?
  1. How many students got B's?
  1. Which was the most common letter grade?
  1. What was the average percentage grade in the class?

### Two, Four, Six, Eight  - Who do we appreciate?! CHEER
1. Write a loop that counts by 2's and creates the following output.

##### Output

2
4
6
8
Who do we appreciate?!

### Interrupting Cow
1. Copy and paste the following array into your JavaScript file:
```js
var sentenceArray = ["the", "cow", "danced", "through", "the", "trees", "in", "the", "light", "of", "the", "moon"];
```

2. Write a loop that builds `sentenceArray` into a real sentence, except every fourth word should be "MOOOOOO". Hint: look up the [modulus operator](https://www.w3schools.com/js/js_arithmetic.asp).
3. Run your sentence to the terminal.

#### Output:
```
the cow danced MOOOOOOOO through the trees MOOOOOOOO in the light MOOOOOOOO of the moon
```

### The Beatles
Given the following object...

```js
const beatles = {
    albums: ["Abbey Road", "Sgt Peppers Lonely Heart's Club Band", "Revolver", "Magical Mystery Tour"],
    history: {
        formed: 1960,
        disbanded: 1970
    },
    members: [
        {
            name: "George Harrison",
            birth: 1943,
            death: 2001
        },
        {
            name: "Paul McCartney",
            birth: 1942,
            death: null
        },
        {
            name: "John Lennon",
            birth: 1940,
            death: 1980
        },
        {
            name: "Ringo Starr",
            birth: 1940,
            death: null
        }
    ]
}
```

Output the following values to the terminal.

```text
${name} was in the Beatles from ${year} to ${year}. He was born in ${year}. He contributed heavily to the ${albumName} Album.

Please note that these values are not correct. They're just placeholders that you will need to correctly fill out. 
```

## Push (and Shove) it to Github

Once finished with the exercises, please push them up to GitHub like we have in the last two chapters.