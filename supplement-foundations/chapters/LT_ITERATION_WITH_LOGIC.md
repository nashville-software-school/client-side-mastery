# Performing Logic in Loops

In the last chapter, you used string interpolation to output a more human-readable string based on the less human-readable JavaScript object properties. You used a `for..of` loop to step through an array and perform the same operation on every item in the array.

In this chapter, you will do one more operation before you output the string representation of your toys.

> Times are tough for Leonid. He's finding that the market for bespoke, artisinal, locally sourced, hand crafted toys doesn't have quite the broad appeal that he thought. He has some loyal customers, but he does have the number of sales each month that he feels he needs to become more profitable.
>
> To account for lower number of sales, he decides to increase the price of all of his toys across the board. After a few months of increased revenue, he believes he will have the cash needed to buy from other distributors and expand his offerings to appeal to a broader audience.
>
> He thinks that having vegan-friendly toys with zero carbon footprint will be the extra appeal needed to start moving more products.

## Heavier Phones

Your phone store just got notified by all of the major  manufacturers that a new battery technology was just implemented in all of their phones. The battery will last 3x longer, but it has the side-effect of adding 0.4 grams of weight to **every** phone.

Rather than going and modifying every phone in your inventory _(yeah, I know you only have 3 phones right now, but let's just imagine that you have 529)_, you decide to just display the increased weight when you print the catalog.

Since your output is done in a loop, and logic done in a loops is run for every item in the loop, you can write the following code.

```js
// Step through the array of phones
for (const phone of phones) {
    // Add 0.4 grams to the weight of each phone
    phone.weight = phone.weight + 0.4

    // Add the weight to the output
    console.log(`The ${phone.maker} ${phone.name} costs ${phone.price} dollars. It weighs ${phone.weight} grams.`)
}
```

![](./images/adding-weight-to-phones.gif)

Yep. We see it, too. There's tons of extra numbers in the decimal places for some of those numbers. Don't worry. You didn't do anything wrong. Your computer isn't broken.

It's just an issue with how floats work with JavaScript. You can dig into that later in your career. Just ignore it for now.

## Practice: Increasing Leonid's Prices

Using the strategy above, modify the current `for..of` loop that displays the toy catalog and increase the price of each toy before it is printed for the terminal-based catalog.

He wants the price of every toy to be inceased by 5%.

For example, here is the current example output for the catalog.

![](./images/toy-catalog.gif)

Here's the output if every toy's price is increased by 5%.

![](./images/increased-toy-prices.gif)
