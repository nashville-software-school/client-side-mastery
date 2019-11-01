# Big Fish, Little Fish

## Filtering Source Data into Smaller Arrays

### Why Are You Learning This?

Filtering is a very common process that applications provide for their users. Think of Amazon, or Etsy, or really any site that sells a large number of products. They always provide a way to filter their list of products to help you find products that match your likes.

* Filter by price
* Filter by category
* Filter by color
* Filter by size
* etc...

### Filtering with a for..of Loop

One thing that many people despise is when they discover that a sock was devoured by the Dryer Monster. I't sbeen a while since you did laundry, you get out of the shower, put on some nice black pants and start searching in your socks drawer for some black socks. A minute later, you realize that there is only 1 black sock left.

How did that happen? I just put all my black socks through the wash last time and I counted out 8 of them. How do I only have 7 now?

```js
const socks = ["white", "brown", "white", "black", "blue",
"white", "brown", "white", "white", "white", "brown", "white",
"black", "white", "black", "brown", "black",  "white",
"brown", "white", "black"]

/*
    From the source data, which should never be modified,
    filter out each color of socks into its own array
*/
const brownSocks = []
const blackSocks = []
const whiteSocks = []

for (const sock of socks) {
    if (sock === "brown") {
        brownSocks.push(sock)
    } else if (sock === "black") {
        blackSocks.push(sock)
    } else if (sock === "white") {
        whiteSocks.push(sock)
    }
}
```

## Martin's Mathemetical Theory

Martin explains a theory that any fish whose length is a multiple of 3 inches is the perfect proportion. The most visually appealing. Therefore, any fish that he owns that are 3, 6, 9, 12, etc. inches long, then they should appear first in the listing.

Next most appealing is any fish that is a multiple of 5 inches long. Display those fish next.

Those are the only two size ratios that matter. Display all other fish after that.

Luckily, you know about the remainder operator in JavaScript. The following code will only display even numbers.

```js
const numbers = [4,1,5,8,6,4,2,2,4,6,7,7,8,9,7,5,3,2,1,3,4,2,1,3,5,7,76,5,9,4,23,5,3,2,6,8,98,65,3,1,3,4]

// Only display even numbers
for (const number of numbers) {
    if (number % 2 === 0) {
        console.log(number)
    }
}
```

##### Example

