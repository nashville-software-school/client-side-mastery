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

## Challenge

Modify the **TransientState** module in Indiana Jeans to store transient state as a **Map** data structure. Also update the setter functions to update the value of the key instead of updating the value of an object key.

You will also need to update your code where you use `JSON.stringify()` to turn your state into a string before sending to your local API. You will need to convert the **Map** into an **Object** before stringifying it. `JSON.stringify()` does not work with a **Map**.

Hint: `Object.fromEntries`
