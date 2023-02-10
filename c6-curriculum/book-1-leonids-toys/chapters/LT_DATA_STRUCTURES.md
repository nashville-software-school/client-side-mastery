# Data Structures

Data structures are also types in a software language, and therefore can be referred to as _structural types_, that are more complex than their more primitive cousins that you learned about in the previous chapter. There are two common data structures that you will be using in the course.

## Learning Objectives

* You should be able to remember the two data structures you will be working with in JavaScipt.
* You should be able to explain the purpose of each data structure.
* You should be able to understand that each individual resource in a data system requires a unique identifier.
* You should be able to identify which property on an object is the unique idenifier.

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
    id: 1,
    age: 31,
    firstName: "Megan",
    lastName: "Debity"
}

const jack = {
    id: 2,
    age: 28,
    firstName: "Jack",
    lastName: "Parsons"
}
```

You could also be selling phones and want to represent each phone as an object.

```js
const iPhone = {
    id: 1,
    name: "iPhone",
    maker: "Apple",
    operatingSystem: "iOS",
    price: 900,
    weight: 1.2
}

const galaxy = {
    id: 2,
    name: "Galaxy",
    maker: "Samsung",
    operatingSystem: "Android",
    price: 600,
    weight: 1.4
}
```

All of the keys and values are contained within the opening and closing curly braces `{}`. Each key/value pair is separated by a comma _(except after the last one)_.

## Unique Identifier

You may be wondering why all of the objects above have that weird `id` property on them. The reason is that nearly all data storage systems that you will use as a professional will have the requirement that every single time you create a new thing to be stored, it must have a unique, integer identifier.

Therefore, the first thing you create will have an `id` value of 1. The second thing you create will have an `id` value of 2. The unique identifier continues to get incremented by one every time you create something.

Because of this, you are going to add an `id` property to every single object you create from now one.

Eventually, you won't even need to do it. It will be handled for you. You just need to get used to the fact that everything will have that property.

