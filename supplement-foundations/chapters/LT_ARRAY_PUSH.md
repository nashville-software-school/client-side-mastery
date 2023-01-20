# Adding New Objects to Arrays

In this chapter you will learn about the `push()` method that is available on every array which allows you to add things to the array.

## Add a New Phone

Ok, so far, your phone business is pretty limited. You're only selling the iPhone and the Samsung Galaxy. You want to add the Google Pixel to your catalog. The first step is to define the new phone.

Make sure that each object you create has an `id` property value that is 1 greater than the last one.

```js
// Existing phone catalog
const phones = [
    {
        id: 1,
        name: "iPhone",
        maker: "Apple, Inc.",
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

// Define a new phone
const pixel = {
    id: 3,
    name: "Pixel",
    maker: "Google",
    operatingSystem: "Android",
    price: 750,
    weight: 1.3
}
```

Now that you have a new phone object assgined as the value of the `pixel` variable, you can add that new object to the end of your array with `push()`.

```js
phones.push(pixel)
```

Now, when your `for..of` loop runs, you will see three prices listed instead of two.

![](./images/three-phones-after-push.gif)

## Practice: New Toys

Your turn now.

1. Create 2 new toy objects after the initial array is created. Give each one a unique `id` property value.
2. Use the `push()` array method twice to add each object to the initial array.
3. Run your code with `node leonids-toys.js` in the terminal.
4. You should now see two new values being displayed in the terminal.

![](./images/display-two-new-phones.gif)
