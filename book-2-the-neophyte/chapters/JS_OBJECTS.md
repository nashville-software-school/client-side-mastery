# Objects

## What is an Object

You can think of object as containers for data. It can have multiple kinds of data - strings, integers, booleans, functions, arrays, etc. One of the powerful features of an object - that you can't do with an array - is to label the data inside the container.

For example, the number 1 has no meaning in an application by itself. You have no idea what that integer represents until assign it a name. On objects, those are called keys.

```js
/*
    Basic object representing a dog.
    - The object itself is labeled with the variable of `dog`
    - The integer of 1 is labeled with the key of `age`
*/
const dog = {
    age: 1
}
```

Now the number 1 has meaning, or context.

## What does an Object Look Like?

Until you get to more advanced JavaScript, you can recognize an object because it follows this pattern.

* Open and closing curly braces
* Contains keys and values separated by a colon
* Key/value pairs are separated by a comma

This is an object. It represents a single food.

```js
const food = {
    type: "Hamburger",
    size: "Small",
    temperature: "Medium rare"
}
```

This is not an object. It doesn't represent a singular thing. It also has no curly braces, or key/values pairs.

```js
const foods = ["Ice cream", "Asparagus", "Bologna", "Peach"]
```

This is an object. It represents a desk and itemizes the properties of it.

```js
const desk = {
    height: 42,
    width: 63,
    depth: 30
}
```

## How are Objects Different from Arrays?

Arrays are collections of similiar things. Objects are ways to define details of a single thing. Both an array and an object can be assigned to a variable.

Here you define two separate objects. One represents a cat, and the other represents a dog. Each has their own properties _(key/value pairs)_ separated by commas.

```js
const cat = {
    species: "Cat",
    name: "Jingles",
    age: 4,
    color: "Black"
}

const dog = {
    species: "Dog",
    name: "Denver",
    age: 7,
    color: "Brown"
}
```

Developers never describe two things with a single object.

```js
// Don't do this
const theAnimals = {
    catName: "Jingles",
    catAge: 4,
    catColor: "Black",
    dogName: "Denver",
    dogAge: 7,
    dogColor: "Brown"
}
```

If you want to store both animals inside of a single data structure, this is what arrays are used for. In this case, if you want to store both of those animals in a single thing, you would put them both in an array.

```js
// This array is a collection of animals
const animals = [cat, dog]
```

Take a few minutes to watch a video about [Variables vs. Arrays vs. Objects](https://www.youtube.com/watch?v=FjSCdXd04Cs).

## Lightning Exercises

> **Lightning Exercise 1:** Given two options of data structures - array or object - which should you use? You need to represent a red 2015 Ford Mustang in your code.

> **Lightning Exercise 2:** Given two options of data structures - array or object - which should you use? You need to store list of animal names in a shelter. The names are "Kippers", "Jack", "Gypsy", "Angus", "Seymour Bouts", and "Sharky".

> **Lightning Exercise 3:** Define an object for four family members, and put each one in an array named `familyMembers`. Define each famly member with the same key/value pairs.

## Accessing Values on Objects

There are two ways to access the values stored inside of an array. One is called dot notation, and the other is square bracket notation.

### Dot Notation

To obtain the value inside an object, and you know the name of the key, you can use dot notation. Here's the pattern.

```js
variableContainingTheObject.keyName
```

Given the following object...

```js
const lassie = {
    age: 7,
    breed: "Collie",
    color: "White and Brown"
}
```

To output the string "Collie" to the console, you would use the following code.

```js
console.log(`Lassie's breed is ${lassie.breed}`)
```

To output the integer 7 to the console, you would use the following code.

```js
console.log(`Lassie's age is ${lassie.age}`)
```

> **Lightning Exercise:** Given the object below, output each of the values to the console using dot notation.

```js
const wardrobe = {
    height: 80,
    manufacturer: "Killibrew & Sons",
    contents: ["Dress shirt", "Jeans", "Suit", "Skirt", "Tennis shoes"],
    depth: 38,
    width: 50
}
```

### Square Bracket Notation

Square bracket notation is most often used when the key name is stored in a variable. The basic mechanics of it are similar to dot notation, you just use square brackets with the key name inside.

Above you saw how to access the `breed` key on the object below with dot notation.

```js
const lassie = {
    age: 7,
    breed: "Collie",
    color: "White and Brown"
}
```

Using square bracket notation, here's the syntax.

```js
// Square bracket notation for key access
lassie["breed"]
> "Collie"

// Dot notation for key access
lassie.breed
> "Collie"
```

That's the basics, but you need to see how square is actually used in an application. Here's what it looks like when using a variable to look up a key on an object.

```js
// Breed is the key you want to get the value of in the object below
const keyToLookup = "breed"

// First, make JavaScript evaluate the variable and give us its value
console.log(keyToLookup)
> "breed"
```

Now that you know that `keyToLookup` evaluates to `"breed"`, you can use the variable to lookup the value with square bracket notation.

```js
const lassie = {
    age: 7,
    breed: "Collie",
    color: "White and Brown"
}

// Use the value of `keyToLookup` to get the value you want
const lassiesBreed = lassie[keyToLookup]
> "Collie"
```

> **Instructor Note:** Talk about how expressions get evaluated from right to left, instead of the other way.

### Lightning Exercises

Time to practice dot and square-bracket notation. Use the following object to complete the lightning exercises below.

```js
const empireStateBuilding = {
    stories: 103,
    height: 1453,
    address: "350 Fifth Avenue, Manhattan, New York 10118",
    squareFeet: 2768591,
    constructionDate: 1931,
    cost: 40948900,
    owner: "Empire State Realty Trust",
    eastWestLength: 424,
    northSouthLength: 187,
    architect: "Shreve, Lamb & Harmon"
}
```

> **Lightning Exercises 1:** Use dot notation to output all of the dimensions of the Empire State Building to the console.

> **Lightning Exercises 2:** Use square bracket notation to output the remaining 5 properties to the console.

## Arrays as Values

So far, you've been largely accessing string and integer values in an object. However, values can be anything in the JavaScript language - including arrays. Consider this example.

```js
const kennel = {
    name: "Nashville North Kennels",
    address: "100 Demonbreun Road",
    manager: "Harper Frankstone",
    capacity: 50,
    currentAnimals: ["Jet", "Snickers", "Blue", "Jacks", "Flap", "Barnum"]
}
```

If you want to display all of the animals that are currently being boarded, you first have to access the array. You can use dot notation to get that value.

```js
const boardedAnimals = kennel.currentAnimals

for (let i = 0; i < boardedAnimals.length: i++) {
    console.log(boardedAnimals[i])
}

> "Jet"
> "Snickers"
> "Blue"
> "Jacks"
> "Flap"
> "Barnum"
```

If you wanted to pull a single animal form the array, and display it, you can use the index value. To show the fourth animals in that array, you would use the following code.

```js
console.log(kennel.currentAnimals[3])

> "Jacks"
```

> Lightning exercise to do that

## Finding Keys on a Complex Object

1. Show them my Github history object
1. Put object in gist
1. Have them copy pasta into their code
1. They have to console.log a specific commit message and the data of a specific push

## Practice: Accessing Property Values

Given the following object...

```js
const beatles = {
    albums: ["Abbey Road", "Sgt Peppers Lonely Heart's Club Band", "Revolver", "Magical Mystery Tour", "Something New"],
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

Output the following value to the console.

```text
Paul McCartney was in the Beatles from 1960 to 1970. He was born in 1942. He contributed heavily to the Magical Myster Tour Album.
```

## Practice

## Challenge