# Data Structures

Data structures are also types in a software language, and therefore can be referred to as _structural types_, that are more complex than their more primitive cousins that you learned about in the previous chapter. There are two common data structures that you will be using in the course.

## Arrays

Arrays are used to store a list, or collection, of things. Just like when you go to the grocery store and you write down a list of things you need to buy. You could represent your list of grocery items in an array.

Insted of curly braces, an array of items is surrounded by square brackets `[]`.

```js
const groceryList = [ "Milk", "Tomato Sauce", "Bananas", "Taco Shells", "Jalapeno", "Sour cream"]
```

## Object

An object is a collection of values that have keys assigned to them. Much the way you define variables to store values...

```js
const age = 31
```

A key is used on an object to refer to values about the object. For example, you want to store all of the properties of a patient visiting a doctor's office. You would create an object to store all of those properties in a single data structure instead of in separate variables.

```js
const megan = {
    age: 31,
    firstName: "Megan",
    lastName: "Debity"
}

const jack = {
    age: 28,
    firstName: "Jack",
    lastName: "Parsons"
}
```

You could also be selling phones and want to represent each phone as an object.

```js
const iPhone = {
    maker: "Apple",
    operatingSystem: "iOS",
    price: 900,
    weight: 1.2
}

const galaxy = {
    maker: "Samsung",
    operatingSystem: "Android",
    price: 600,
    weight: 1.4
}
```

All of the keys and values are contained within the opening and closing curly braces `{}`. Each key/value pair is separated by a comma _(except after the last one)_.

