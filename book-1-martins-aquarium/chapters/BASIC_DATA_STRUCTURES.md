# Data Structures and Fish

> You wake up on a lazy Sunday morning, rub your eyes, and reach for your phone to read the morning news and check the weather forecast. After you enter in your passcode, a list of notifications is waiting for you - including one from Martin.
>
> You decide to read that later.
>
> After a shower, a cup of coffee and some fruit, you open your laptop and decide to read Martin's email.
>
> "GOOD NEWS!" the email starts. You raise your eyebrows involuntarily and continue to read.
>
> "Bob Valentine, another fish harvester here in town has decided to hang it up. He's got arthritis and hurt his knee pretty bad last year, so diving isn't really an option for him any more. He has decided to give his entire inventory of fish to me! It's very exciting.
>
> I need you to add all of the fish in the attached Microsoft Excel spreadsheet to the site. I need to visit my equipment dealer today - 'A Little Bit Flounder Now' - and decide on a new tank.
>
> Email me back as soon as you're done, and I'll send payment."
>
> You click on the attached spreadsheet and are shocked at the number of fish that Martin is inheriting. There's over 150 fish in here. Honestly, you don't know how Martin manages to house and feed the number of fish he currently has, let alone these new ones. He must have help, you imagine.
>
> After a couple minutes of satisfying your curiosity about his new fish stock, it suddenly hits you that you now have to add 158 new fish HTML elements to the site.
>
> "There's got to be a way to automate this," you mumble to yourself. "What if he adds another 100 fish in a month... I'll be writing fish HTML for the rest of my life!"

Luckily, there is a way to automate this entire process, so that software developers don't have to manually write the same HTML, and the same JavaScript over, and over, and over again when new data is created.

## Vocabulary To Learn
* Object
* Object key and value
* Property
* Declaring variables: `let` and `const`
* Data Types: Array, String, Boolean, Object, Number

## Object Representation of Things

The first step in the process is defining an object in code that represent each fish. That's the main purpose of an object - representing real-world things in code.

Before you figure out how to represent a fish, let's look at how you might represent a menu item in a restaurant as an object in code. How about a menu item at a fast food restaurant. What are some common properties of the menu items?

* Name of food
* Type of food (sandwich, fries, dessert, etc..)
* Size
* Temperature (is it hot or cold food)
* Availability (sold out?)
* Pieces per order

Ok, given those common properties, how would you represent a hamburger as an object?

```js
const hamburger = {
    name: "Whopper",
    type: "Sandwich",
    size: "Large",
    temperature: "Hot",
    available: true,
    piecesPerOrder: 1
}
```

In this object, `name`, `type`, `size`, `temperature`, `available`, and `piecesPerOrder` are the keys. `"Whopper"`, `"Sandwich"`, `"Large"`,`"Hot"`, `true`, and `1` are the values of those keys. Together, those values make up the **state of the hamburger object**.

How about some hot wings?

```js
const hotwings = {
    name: "Hot Wings",
    type: "Appetizer",
    size: "Medium",
    temperature: "Hot",
    available: false,
    piecesPerOrder: 6
}
```

 `"Hot Wings"`, `"Appetizer"`, `"Medium"`, `"Hot"`, `false` and `6` are the values of the keys. Together, those values make up the **state of the hotwings object**.

## Representing the Fish

Your job is to define what a JavaScript object for a fish would look like. What keys should you define? Each fish will have the same keys, but the state of each will be different - meaning the keys will have different values.

Create a new JavaScript module in your application named `FishData.js`. In that module create objects to represent the state of Martin's fish that you had previously hard-coded in the HTML. You are going to place all of the objects in an array - a collection of fish.

> **`martins-aquarium/scripts/FishData.js`**

```js
/*
 *  To get you started, here's some properties of Bart.
 *  You need to add more properties to complete this
 *  representation as an object. Then add all the other
 *  fish to the collection.
 */
const fishCollection = [
    {
        name: "Bart",
        food: "crustaceans"
    }
]
```

> **Tip:** Confusion and bugs at this point are natural. You will likely forget some punctuation like commas and curly braces. If you want to discuss your ideas or bugs with the instruction team, you should visit one of them.

