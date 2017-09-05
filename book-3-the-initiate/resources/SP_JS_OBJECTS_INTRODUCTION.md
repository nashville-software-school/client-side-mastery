# Javascript: Introduction to Objects

The most basic object is a collection of key:value pairs surrounded by curly braces.

```js
var myCar = {
  make: "Nissan",
  model: "Xterra",
  year: 2006,
  color: blue
}
```

You can add new key:value pairs after the initial definition.

```js
myCar.doors = 4;
myCar.sunroof = false;
```

You can then access the value of any of those keys.

```js
console.log("My car has " + myCar.doors + " doors.");
```
