# Powerful Object Creation in JavaScript

## Key Concept

* Objects represent things, or actors, in our application
* Properties describe the objects
* Methods define their behavior
* Applications are composed of actors

## Actor

What do I mean by actor? To understand that, let's look at the definition of one of the core principles that professional software developers use to build flexible, scalable, maintainable systems - the Single Responsiblity Principle. It's part of the collection of  SOLID principles.

You need to read the [SOLID: Part 1](https://code.tutsplus.com/tutorials/solid-part-1-the-single-responsibility-principle--net-36074) article which covers the SRP and the term *Actor*.

## Using the Power of Object.create()

Up to this point, we've been using the simplistic method for creating objects, which gives us no power, or control, on how it gets manipulated.

```js
const boringObject = {}
```

Now you're going to learn about `Object.create()`, and once you see how much power it gives you, you will start to understand how it can help you comply with the SRP.

![realize the power](images/object-create-realize.gif)