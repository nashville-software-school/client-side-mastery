# Objects

## What is an Object

Higfhest level, it's a container for data. It can have multiple kinds of data. The data is named with keys. Naming your raw data. For example, the number 1 has no meaning in an application by itself. You have no idea what that represents until assign it a name. On objects, those are called keys.

```js
const dog = {
    age: 1
}
```

Now the number 1 has meaning, or context.

## What does an Object Look Like

Go over structure and punctuation. Each combination of a key and a value is called a `Key Value Pair` or a `Property`.

## How are Objects Different from Arrays

Arrays are collections of similiar things. Objects are ways to define details of a single thing.

Link to Meg's video. Show it in class.

> Lightning Exercise: Data structures. Given two types of data, which should you use? You need to define a red Ford Mustang in your code. You also need to store list of animal names in a shelter.

> Lightning Exercise: Define an object for four family members, and put them in an array named `familyMembers`.


## Accessing Values

### Dot Notation

> Lightning Exercises: Give an object with 5 value pairs. Student must use dot notation to access 5 of them for a console.log

### Square Bracket Notation

```js
const keyToLookup = "breed"

// Now we make JavaScript evaluate the variable and give us its value
console.log(keyToLookup)

const Lassie = {
    age: 7,
    breed: "Collie",
    color: "White and Brown"
}

// Now we can use the value of `keyToLookup` to get the breed out of the object
const lassiesBreed = Lassie[keyToLookup]
```

> Lightning Exercises: Give an object with 10 value pairs. Student must use square bracket notation to access 5 of them.

> Lightning Exercises: For for other 5 use dot notation

> Lightning Exercises: Another object with 8 keys. 4 with square bracket and 4 with dot


## Arrays as Values

Use dot notation to get to array and iterate over.

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