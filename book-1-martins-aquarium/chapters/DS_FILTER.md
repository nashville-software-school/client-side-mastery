## Filtering Data to Smaller Sets

Now you have code to show the businesses that have active accounts. You call Doris over and show her the results, and she's very excited.

> Doris leans forward in her seat, eyes bright, and exclaims, "Yes! This is exactly what I need!" She starts to scroll through all of the businesses, clearly enjoying her new toy.
>
> After several minutes of this, she abruptly stops and turns her head quickly in your direction, eyes wide. "You know, my regional manager, Barry has been asking me for something for months now. He has a new sales rep in New York and wants to check how many sales are being made in that state. So out of all these businesses, I need to see only the ones in New York."
>
> She turns her head towards the computer, narrows her eyes slightly and asks in a low voice, "Can you do that?"
>
> Unsure why she needed to ask in such a dubious manner, you confidently respond that you can. She smirks, takes out her cell phone, and walks back to her office while dialing a number...

For a task like this, the array `filter()` method is perfect, because you need to look at each object in the businesses array, check to see if it meets Doris' condition, and if it does, place that object in a new array that only contains the businesses she wants.

The filter function creates a new array from the existing one, so you can invoke it and assign it to a new variable such as in the code below. The function that you pass to `filter()` should return true or false. If it returns true, then the current item will be placed in the new array.

Here's an example of how you could filter an array of art supplies.

```js
const supplies = [
    {
        id: 1,
        price: 12.99,
        color: "Red",
        brand: "Bloomfield",
        type: "Paint"
    },
    {
        id: 2,
        price: 75.49,
        color: "Brown",
        brand: "Illinois Art",
        type: "Easel"
    },
    {
        id: 3,
        price: 19.99,
        color: "White",
        brand: "Emerson",
        type: "Oil Paint Canvas"
    }
]

const supplyList = document.querySelector(".supplies")

// Create a new array that contains supplies that cost less than $50
const inexpensiveSupplies = supplies.filter(supplyObject => {
    if (supplyObject.price < 50.00) {
        return true
    }
    return false
})

supplyList.innerHTML = "<h1>Inexpensive Art Supplies</h1>"

// Iterate the inexpesive item array and build your DOM
inexpensiveSupplies.forEach(supplyObject => {
  supplyList.innerHTML += `
    <section class="supply">
        <h2 class="supply__type">${supplyObject.type}</h2>
        <div class="supply__price">
            Price: ${supplyObject.price}
        </div>
    </section>
  `
})
```

## Task: Listing New York Companies

Use `filter()` to list only Dotard &amp; Simbleton companies located in New York. Display them in element in your HTML file that has a class of `businessList--newYork`.

```html
<article class="businessList--newYork">
    <!-- New York businesses go here --->
</article>
```

![list of new york businesses](./images/dotard-simbleton-newyork-list.png)

## Task: Listing Manufacturing Companies

Use `filter()` to list only Dotard &amp; Simbleton companies that are in manufacturing.

Display them in element in your HTML file that has a class of `businessList--manufacturing`.

```html
<article class="businessList--manufacturing">
    <!-- Manufacturing businesses go here --->
</article>
```