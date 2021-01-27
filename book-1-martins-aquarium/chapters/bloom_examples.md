# Bloom's Taxonomy Examples

This document outlines some examples of how one might verify that a student has reached a particular level in Bloom's Taxonomy.

Many of the examples refer to this JavaScript code:

```js
const makePerson = (firstName, lastName, age, email) => { 
  const fullName = `${firstName} ${lastName}`;

  const person = {
    fullName: fullName,
    age: age,
    email: email
  };

  if (age < 18) {
    person.canVote = false;
  } else {
    person.canVote = true;
  }

  return person;
}
```

## Remember

A student should be able to answer the following questions:

* What is `makePerson`?
* What are `firstName`, `lastName`, `age` and `email`?
* What is the data type of `fullName`?
* What is the data type of `person`?

## Understand

A student should be able to answer the following questions:

* What is a variable?
* What is a function?
* What is a parameter?
* What is an object?
* In the code above give an example of a variable.
* In the code above give an example of a function.
* In the code above give an example of an object.

## Apply

A student should be able to create a `makeHouse` function that accepts `street`, `city`, `state`, `zip`, `squareFootage` and `salePrice` parameters and returns an object with the following properties.

* `address`
* `squareFootage`
* `salePrice`
* `isRidiculouslyExpensive`

The `address` property should be the combination of `street`, `city`, `state` and `zip`.

The `isRidiculouslyExpensive`` property should be true if the `salePrice` is over 1 million dollars.

## Analyze

The student should be able to: 

* Read and explain the `makePerson` function in their own words
* Describe how one might use the `makePerson` function in other code

## Evaluate

The student should be able to:

* Describe alternative ways to create `person` objects
* Justify the need for the `makePerson` function as opposed to alternative approaches of doing this same thing

## Create

The student should be able to write the following functions:

* A function accepts a `boolean` value and returns "It's true!" if the value is `true` and "It's false !" if the value is `false`
* A function that accepts three arguments and joins them into a single string separated by a ', '
* A function the behaves as the above function, but accepts a fourth argument that is the separator
* A function that accepts no arguments a `person` object with "reasonable" default values for each property