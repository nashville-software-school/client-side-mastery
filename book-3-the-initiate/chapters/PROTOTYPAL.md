# Prototypal Inheritance

## The Big Object of JavaScript

Unless you're dealing with a primitive type...

1. string
1. number
1. null
1. undefined
1. boolean
1. symbol

Then you are working with an object. JavaScript engines will implement what's called prototypal inheritance for you in almost all cases. When you create an object in your code, when the JavaScript engine gets to that line of code, it immediately attaches all the methods from the Big Object to it.

![object prototype](./images/YfkqqMnbov.gif)

> **Pro tip:** The prototypal inheritance mechanism is also called _Objects Linking to Other Objects (OLOO)_ by some modern JavaScript developers. This is because it more precisely describes what is going on behind the scenes.

You can immediately use those methods on your object. In the animation below, you will see that the `toString()` method is used immediately after creating an object. I didn't have to define that method myself.

I inherited it from the Big Object.

![using inherited methods](./images/nW9YQz0VTC.gif)

This mechanism of one object attached to another is called the [Prototype Chain](http://yehudakatz.com/2011/08/12/understanding-prototypes-in-javascript/). Here's a quick example of how you can create a prototype chain. Then I'll discuss the benefits.

```js
/*
    This object defines a generic Car. On this
    object, we define properties and methods that
    are common to ALL cars.
*/
const Car = Object.create({}, {
    drive: {
        value: () => console.log("On the road again...")
    },
    turnRight: {
        value: () => console.log("Moving right along...")
    },
    turnLeft: {
        value: () => console.log("I left you in the dust...")
    }
})
```

That's it. I won't put anything on this object that is specific to any individual car, make, or model. I will make more specific objects for those, and then link the two objects together.

```js
// My wife's favorite car
const Prissy = Object.create(Car, {
    color: {
        value: "Red"
    },
    make: {
        value: "Honda"
    },
    model: {
        value: "Del Sol"
    }
})

// My favorite car
const Rock = Object.create(Car, {
    color: {
        value: "Blue"
    },
    make: {
        value: "Nissan"
    },
    model: {
        value: "Xterra"
    }
})
```

Since I specified _Car_ as the prototype for both _Prissy_ and _Rock_, the `drive`, `turnLeft`, and `turnRight` methods can be invoked on them.

```js
> Rock.turnLeft()
"I left you in the dust..."

> Prissy.drive()
"On the road again..."
```

## Benefits of Prototypal Inheritance

By linking object together through prototypal inheritance, you save memory. In the example above, three objects exist in memory when you run the code - _Car_, _Rock_, and _Prissy_.

_Rock_ and _Car_ are linked.

_Prissy_ and _Car_ are linked.

If I had defined `turnLeft`, `turnRight`, and `drive` on both _Prissy_ and _Rock_, then each of those objects would take up more memory when they are created.

To see a more visual explanation of what's going on, you can watch the [OLOO presentation](https://stevebrownlee.keybase.pub/OLOO/index.html)

When you are writing JavaScript applications, and make liberal use of `Object.create()`, once you notice that many of your objects are sharing common methods that are more generic in nature, and would apply to all of them no matter the context, take the opportunity to define a more general object and use OLOO to link them all together.
