# Maps

A `Map` in JavaScript is very similar to an `Object`, but it has some very powerful differences.

Like an object, a map is a collection of keys and values. The syntax is quite different, and more verbose. Here's how to define the keys and values for a toy using an object versus a map.

## Creating

##### Object Toy

```js
// Object representation of toy
const iPhone = {
    id: 1,
    name: "iPhone",
    maker: "Apple",
    operatingSystem: "iOS",
    price: 900,
    weight: 1.2
}
```

##### Map Toy

```js
// Map representaiton of toy
const iPhone2 = new Map()
iPhone2.set("id", 1)
iPhone2.set("name", "iPhone2")
iPhone2.set("maker", "Apple")
iPhone2.set("operatingSystem", "iOS")
iPhone2.set("price", 900)
iPhone2.set("weight", 1.2)
```

## Reading Values

##### Object

```js
console.log(iPhone.price)
```

##### Map

```js
iPhone2.get(price)
```

## Adding New Key Value Pairs

##### Object

```js
iPhone.color = "yellow"
```

##### Map

```js
iPhone2.set("color", "yellow")
```

## Key or No Key

One of the main differences between these two data structures is what values are allowed to be keys. For an Object, the following values can be used.

1. String
1. Symbol

Now, you will not be using the `Symbol` data type during your time at NSS, and likely never as a professional either, so in essence, keys can only be strings.

For a Map, a key can be anything.

```js
/*
    Store which aisle a toy is in, but you don't want
    it to be a direct property on the kite object.
*/
const kite = { id: 1, name: "Dragon Kite" }
const monopoly = { id: 2, name: "Monopoly" }

const inventoryLocations = new Map()
inventoryLocations.set(kite, "Aisle 4")
inventoryLocations.set(monopoly, "Aisle 2")

inventoryLocations.get(kite)       // "Aisle 4"
inventoryLocations.get(monopoly)   // "Aisle 2"
```

## Challenge

Modify Leonid's Toys code to remove the price property of each toy, since that will change over time, but other properties like the toy's name, color, and size will never change.

Create a Map to store the prices for each toy. The key in the Map should be the toy object, and the value for each entry should be the price.

Then see if you can output, using `console.log()` the name and price of each toy. You will need to read the [documentation for iterating the key/value pairs](http://xahlee.info/js/js_iterate_map.html) in the Map.

> **Hint**: Modify the function that adds a new toy to your inventory to accept a second parameter... the price. Then, after adding the toy to your inventory, also add the appropriate key/value pair to your Map.
>

##### Example
```js
const addPhoneToInventory = (phoneObject, price) => {

}

// Add the first phone in the array to the Map and set its price
addPhoneToInventory(phone[0], 499.99)
```

### Steps

1. Delete the price property on the objects in your array
2. Create a `new Map()`
3. Complete the `addPhoneToInventory` function that will use the `.set()` method on the Map to store prices for toys.
4. Invoke `addPhoneToInventory` as many times as you have toys in your array using square bracket notation to access each toy _(see above example)_.

> Hint: You will need to use [JSON.stringify()](https://www.educba.com/json-stringify-javascript/) for each object when you set is as a key in the Map.