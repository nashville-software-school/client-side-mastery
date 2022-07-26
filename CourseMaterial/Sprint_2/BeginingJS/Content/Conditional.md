# Finding an Item in an Array

> Now that you have a basic catalog that Leonid can see in the terminal, he has a request. He wants to be able to find a single product by providing the unique `id` property. Your code should then display the details of the phone which has the specified `id` value.

## If Inside For Loop

Your phone shop is getting popular these days. You have expanded your offerings and now you need the ability to have customers use a terminal in your store to find the information about a particular phone.

They come into your store after looking at your catalog, and should be able to enter in the unique `id` of a phone and then be shown all the details.

You are going to simulate this by specifying the `id` that you want to find at the very top of your code.

```js
const phoneToFind = 2
```

Next, you need to modify the `for..of` loop to only display the product details if a condition is true. In your code, that condition is if the current phone's `id` value matches the value of the `phoneToFind` variable's value.

```js
for (const phone of phones) {
    // Only one phone will cause the condition below to evaluate to true
    if (phone.id === phoneToFind) {
        phone.weight = phone.weight + 0.4
        console.log(`The ${phone.maker} ${phone.name} costs ${phone.price} dollars. It weighs ${phone.weight} grams.`)
    }
}
```

With that condition in place, only one phone will be displayed instead of all phones.

![](./images/finding-single-phone.gif)

This is a very basic implementation of tools that you use on the Web when you search for, or filter, products on a company's product page.
