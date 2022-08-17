## Strings into Arrays into Strings

Now that you have worked with arrays and strings in various contexts, this chapter will cover how to convert strings into arrays, and vice versa.

## Split String into an Array

Take a look at the following string. It represents a person's full name, but in a very particular format. The first name, middle name, and last name are separated by commas. Juan is the first name. Carlos is the middle name. Rodriguez is the surname. You want to have each of those names stored in their own variable.

```js
const fullName = 'Juan,Carlos,Rodriguez'
```

### Split Into Multiple Variables

You can use `.split()` method on any string to pull out sub-strings that are separated by a common character - also called the delimiter. The following code both declares each variable, and assigns each a value all in one line of code.

Note that within the parenthesis after `.split`, there is a comma character.

```js
const fullName = 'Juan,Carlos,Rodriguez'
const [firstName, middleName, surName] = fullName.split(',')

console.log(firstName) // Juan
console.log(middleName) // Carlos
console.log(surName) // Rodriguez
```

If the sub-strings were separated by a colon instead, you would use that character inside the parenthesis.

```js
const fullName = 'Juan:Carlos:Rodriguez'
const [firstName, middleName, surName] = fullName.split(':')

console.log(firstName) // Juan
console.log(middleName) // Carlos
console.log(surName) // Rodriguez
```

What if the names are separated by two colons, though?? Send two colons to the split method.

```js
const fullName = 'Juan::Carlos::Rodriguez'
const [firstName, middleName, surName] = fullName.split('::')

console.log(firstName) // Juan
console.log(middleName) // Carlos
console.log(surName) // Rodriguez
```

### Split Into Array

## Join Array into a String

You can do the complete opposite as well. If you have an existing array that contains string values, you can combine them into a single string with the `.join()` method.

Here is an example. A poem is currently stored in an array. Each line of the poem is one string value in the array. You want to combine all of them into one, single string to be displayed.

```js
const sentences = [
  'Praise the spells and bless the charms,',
  'I found April in my arms.',
  'April golden, April cloudy,',
  'Gracious, cruel, tender, rowdy;',
]

const wholePoem = sentences.join('')

console.log(wholePoem)
```

That output would be the following single string.

```html
Praise the spells and bless the charms, I found April in my arms. April golden,
April cloudy, Gracious, cruel, tender, rowdy;
```

Much like the `.split()` method on a string, you can specify a character by which all the individual strings in the array will be joined. Another example below.

```js
const surprises = ['lions', 'tigers', 'bears']
const exclamation = surprises.join(' and ')

console.log(`${exclamation}, oh my`)
```

The output would be the following string.

```html
lions and tigers and bears, oh my
```

You could also wrap the strings in HTML elements.

```js
const employees = [
  'Mary Bulshear',
  'Kelley Avignon',
  'Brian Wellington',
  'Cherie Midreaux',
]
const listItems = employees.join('</li><li>')

console.log(`<li>${listItems}</li>`)
```

That would generate the following HTML string.

```html
<li>Mary Bulshear</li>
<li>Kelley Avignon</li>
<li>Brian Wellington</li>
<li>Cherie Midreaux</li>
```

## Exercise: Split Personalities

The Luminous Association of Personality Disorders (LAPD) has a yearly conference in Las Vegas where professional psychologists and cognitive scientists gather to discuss the latest research into aberrant mental disorders that affect people around the world. The software developer that maintain the entire list of known personality disorders have sent the you the list so that you can display them on the LAPD conference website. The format for the data is somewhat bizarre.

They sent them all in one large string, with each disorder separated by the following characters: `|$|`.

### Original Disorders String

```js
'Depression|$|Bipolar|$|Manic|$|Anxiety|$|Anorexia|$|Posttraumtic Stress|$|Seasonal Affective|$|Bulimia'
```

### Setup

```sh
cd
cd workspace
mkdir split-personalities
cd split-personalities
touch main.js
code .
```

Once VS Code starts, open the `main.js` file copy the following code into the file.

```js
const originalDisorderFormat =
  'Depression|$|Bipolar|$|Manic|$|Anxiety|$|Anorexia|$|Posttraumtic Stress|$|Seasonal Affective|$|Bulimia'
```

### Instructions

> For this exercise, you are going to practice build HTML elements, but without the browser being involved. Your output will still appear in the terminal.

What you want to display on the web page is a series of `<div>` elements that contain the disorder names. That means you will first need to `split()` the string on the correct delimiter to generate an array of strings. Then you must `.join()` the array back into a single string, making sure each disorder name is surrounded by a `<div>` HTML tag.

### Run Your Code

In your terminal, run your code with the following command.

```sh
node main.js
```

When you run the code, it should display the following. Your's will be on one line and that's ok. If you want it to be formatted, you can use \n which adds a new line.

```html
<div>Depression</div>
<div>Bipolar</div>
<div>Manic</div>
<div>Anxiety</div>
<div>Anorexia</div>
<div>Posttraumtic Stress</div>
<div>Seasonal Affective</div>
<div>Bulimia</div>
```
