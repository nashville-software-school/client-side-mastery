## Learning Objectives

* You should be able to define an array that contains multiple objects.
* You should be able to explain that objects defined directly in an array do not need to be assigned to variables.
* You should be able to demonstrate that you can create an array of objects using the correct syntax.

## Objects in Arrays

In the previous chapters, you created multiple objects and assigned each one to its own variable to be used later.

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

Now you are going to put both of those objects into an array, rather than being discrete variables. Here's how you would put those phone objects into an array as one, large data structure.

```js
const phones = [
    {
        id: 1,
        name: "iPhone",
        maker: "Apple",
        operatingSystem: "iOS",
        price: 900,
        weight: 1.2
    },
    {
        id: 2,
        name: "Galaxy",
        maker: "Samsung",
        operatingSystem: "Android",
        price: 600,
        weight: 1.4
    }
]
```

Notice that the individual variables for each phone are gone. Now the **entire array of phones** is assigned to a single variable named, shockingly, `phones`. Naming the variable whose value is an array should always be plural. If you have an array of farm animals, call the variable `animals`, or even more descriptively, `farmAnimals`.

You get the point.

One thing you might do as a beginner is forget to put a comma between the two objects. Look at the array above again and notice that there is a comma after the first closing curly brace, and before the second opening one.

```js
[
    {

    },  <-- Don't forget this comma
    {

    },  <-- Or this one
    {

    }   <-- Don't need one at the end
]
```