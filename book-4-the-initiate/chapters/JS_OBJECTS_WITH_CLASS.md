# Using Class Syntax to Create Objects

Often we need to represent an idea or concept in our programs — an employee, or a car, or a concert or restaurant. Representing these concepts directly in code comes in two parts: data to represent the state, and functions to represent the behavior. ES6 classes give us a convenient syntax for defining the state and behavior of objects that will represent our concepts.

So far you've represented concepts like these as key-value pairs in simple JavaScript objects.

```js
const restaurant = {
    name: "Nicky's Pizza",
    address: "123 Sesame St",
    hasStromboli: true,
    hourOpen: "11:00 am",
    hourClosed: "10:00 pm",
    placeOrder: (size, toppingsArr) => {
        console.log(`You ordered a ${size} pizza covered in ${toppingsArr.join(", ")})
    }
}
```
Now look at how you would create this object using the `class` keyword.

```js
class Restaurant {
    /*
        The constructor method is invoked automatically
        by JavaScript when you use the `new` keyword to
        create an instance of a restaurant. You don't
        need to invoke it in your code.
    */
    constructor () {
        this.name = "Nicky's Pizza"
        this.address = "123 Sesame St"
        this.hasStromboli = true
        this.hourOpen = "11:00 am"
        this.hourClosed = "10:00 pm"
    }

    placeOrder (size, toppingsArr) {
        console.log(`You ordered a ${size} pizza covered in ${toppingsArr.join(", ")})
    }
}
```

This allows us to create an object with the following code.

```js
/*
    Constructor method is immediately invoked, and all
    of the properties are automatically added to the
    object stored in `pizzaJoint`.
*/
const pizzaJoint = new Restaurant()
```

Of course, this is fairly limiting as it is. Every time you make an object with `new Restaurant()`, they all have the same property values. That is not very useful.

In software applications, you usually need to make a lot of different restaurants. Each one has the same properties, but the values need to be different on each one. Every restuarant we make shouldn't have the same address.

## Multiple Restaurants Based on the Same Class

Here's a refactor, with the ability to pass in those unique values to each new retaurant we create. That's a lot of properties to write out as parameters for the constructor method, so let's set it up to take an object as an agument, called `props`.

```js
class Restaurant {

  constructor (props) {
    this.name = props.name
    this.address = props.address
    this.hasStromboli = props.hasStromboli
    this.hourOpen = props.hourOpen
    this.hourClosed = props.hourClosed
  }

  placeOrder (size, toppingsArr) {
    console.log(`You ordered a ${size} pizza covered in ${toppingsArr.join(", ")}. Please pick up before ${this.hourClosed}!`)
  }

}
```

With the initial properties configured to be passed in as arguments when we create the object, that allows you to create multiple objects with the `Restaurant` class as the blueprint, but each with their own, distinct property values.

In this next example, you are creating two JavaScript objects to represent the businesses of Joey's House of Pizza and Nelly's Pizza.

```js
// Properties of Joey's House of Pizza
const joeysProperties = {
    name: "Joey's House of Pizza",
    address: "1213 Federal Ave",
    hasStromboli: true,
    hourOpen: "10:00 am",
    hourClosed: "2:00 pm"
}

/*
    Create a new restaurant and send it the properties
    object. In the constructor, the properties object is
    stored in the locally-scoped `props` variable (see above).
*/
const joeys = new Restaurant(joeysProperties)

const nellysProperties = {
    name: "Nelly's Pizza",
    address: "8001 Main Street",
    hasStromboli: true,
    hourOpen: "10:30 am",
    hourClosed: "9:30 pm"
}

const nellys = new Restaurant(nellysProperties)
```

## Adding a Menu to the Restaurant

Now you can refactor again and add a new `menu` property and some methods for interacting with it.

```js
class Restaurant {

    constructor (props) {
        this.name = props.name
        this.address = props.address
        this.hasStromboli = props.hasStromboli
        this.hourOpen = props.hourOpen
        this.hourClosed = props.hourClosed
        this.menu = {
            small_pizza: null,
            large_pizza: null,
            soda: null,
            salad: null,
            breadsticks: null
        }
    }

    placeOrder (size, toppingsArr) {
        console.log(`You ordered a ${size} pizza covered in ${toppingsArr.join(", ")}. Please pick up before ${this.hourClosed}!`)
    }

    /*
        Method to set the menu items after the object has
        been created.
    */
    setMenu (menuItems) {
        for (const item in menuItems) {
            this.menu[item] = Number(menuItems[item])
        }
    }

    /*
        Get a special, combined price for a combo of a
        small pizza, soda, and a salad.
    */
    comboPrice () {
        let discount = .85
        let comboPrice =
            this.menu.small_pizza +
            this.menu.soda +
            this.menu.salad

        return `$${(comboPrice * discount).toFixed(2)}`
    }

}
```

Again, you can make many instances of `Restaurant` and each one will be unique, but based on a common definition, or blueprint, of which properties and methods should be on a restaurant.

```js
// Create a pizza restaurant
const pizzaPerfect = new Restaurant({
    name: "Pizza Perfect",
    address: "456 That Road",
    hasStromboli: false,
    hourOpen: "11:30 am",
    hourClosed: "9:30 pm"
})

// Now set the menu prices
pizzaPerfect.setMenu({
    small_pizza: 9.99,
    large_pizza: 15.99,
    soda: 2.99,
    salad: 4.99,
    breadsticks: 3.49
})

const pizzaChain = new Restaurant({
    name: "Pizza Hut",
    address: "8907 This Road",
    hasStromboli: false,
    hourOpen: "10:30 am",
    hourClosed: "11:00 pm"
})

const italianPlace = new Restaurant({
    name: "Geno's Joint",
    address: "4567 Other Road Suite #45",
    hasStromboli: true,
    hourOpen: "11:30 am",
    hourClosed: "8:30 pm"
})
```

You can look at the `pizzaPerfect` object to see its properties, and display the menu.

![pizza joint object](./images/IdhyIsCf74.gif)

## Inheritance Chain

Your instruction team will provide you with a presentation on prototypal inheritance and the prototype chain in JavaScript. The `class` syntax automatically sets up an object for use in the prototype chain.

If you take a closer look at each restaurant in the Developer Tools console, each will show that it's an object, with both the `Restaurant` and `Object` objects in its prototype chain.

![prototype chain in developer tools console](./images/A5X9vRdkSh.gif)

## Rules for Using the Class Keyword

* Classes can only contain method definitions, not data properties. Properties must be established in the `constructor` method.
* When defining methods, you use shorthand method definitions (i.e. you can't use the `function` keyword)
* Unlike when creating objects, you do not separate method definitions in class bodies with commas.

## Practice: Big Scary Birds

> The learning objective for this practice exercise is to use the `class` syntax to establish a reusable definition (i.e. blueprint) of the properties and methods that objects will have in an application.

Your job is to create a large, flightless bird class that defines the properties of a feathered terror. It should have the following properties:

* height
* flightless (should always be true)
* isExtinct
* name
* running speed
* toString -- This will be a method that outputs a description of the bird based on some of its properties. Example output: "The Cassowary is a big, scary bird that stands up to 6 ft and can run up to 30 mph!"

Create at least 3 instances of the class. Visit the [Wikipedia list](https://en.wikipedia.org/wiki/List_of_largest_birds) of the largest birds in the world for inspiration.

## Practice: Calculated Properties

> The learning objective for this challenge is to write a getter for the `comboPrice` property of a pizza restaurant. This lets you explore the concept of calculated properties.

Up to this point, we have used methods (i.e. functions on objects) to perform logic and calculations needed for those objects. Properties are simple, primitive values like "John", `100`, and `true`. With the power of getters and setters in your classes, you can still have properties, but their value is calculated via a function rather than being simple assignment and retrieval.

Take a look at the `Restaurant` class example from earlier. Note how it uses methods to set some values ( the menu prices ) and calculate others ( the combo meal price ). Those work fine, but we can also use special functions called `getters` and `setters` to allow us to get or set values as properties.

Consider the `comboPrice()` method we added to the Restaurant object. `comboPrice` itself is not a behavior, or a process, of the Restaurant, but you had to write it as a method because you needed to add together prices from the menu and return the calculated value.

By putting the keyword of `get` in front of the method name (see below) you can make a method behave as if it was a property.

```js
class Restaurant {
  constructor (props) {
      this.comboDiscount = props.discount
      this.menu = props.menu
  }

  get comboPrice () {
    // Add logic here to calc and return combo price
  }
}
```

Now you can access `comboPrice` without parenthesis, just like a property. Also, since you only used `get` without its partner `set`, you have made `comboPrice` a read-only property - meaning there is no way to set its value. This is exactly what you want with methods that are used as calculated properties.

```js
const bobsBurgers = new Restaurant({
    discount: 0.85,
    menu: {
        fries: 1.29,
        burger: 3.69
    }
})

/*
    Note the lack of parenthesis after comboPrice.
    It's a property. As an example, let's assume that
    it returns 4.99.
*/
console.log(sunnyChina.comboPrice)
> 4.99

/*
    It is also a read-only property since you did not define
    a setter. So while the following code will not throw an error, it won't change the output.
*/
sunnyChina.comboPrice = 29.99

console.log(sunnyChina.comboPrice)
> 4.99
```

### References

* [getter](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/get)
* [setter](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/set)

### Strech Goal

> Allow a restaurant to define the items in its combo meal, based on items from the menu (i.e. `this.menu.breadsticks`), using a setter. Then have your `comboPrice` getter use the `combo` property created by the setter instead of the hard-coded menu items to calculate the cost.

Like the getter, the setter allows us to use a function to calculate a value using what looks like a regular property assignment.

```js
class Restaurant {
  // constructor, etc...

  set combo (items) {
    //set items as the property 'combo' on the Restaurant instance
  }

  get comboPrice () {
    //logic to calc and return combo price
  }

}
```

Then the syntax to add the new value is simply

```js
myRestaurant.combo = [myRestaurant.menu.small_pizza, myRestaurant.menu.soda]
```

### Extra Stretch Goal

Make sure that the value of the `combo` property is an array before setting it. Can't do _that_ with an old-fashioned value assignment, can ya?
