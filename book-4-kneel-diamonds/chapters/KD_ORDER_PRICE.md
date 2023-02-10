# Showing Prices on Jewelry Orders

You are currently showing a simple message for each jewelry order. Natasha wants to see the cost of each order in the list because if there are two orders that need to be done at the same time, she can focus on the one(s) that generate the most revenue first.

## Finding the Metal Price

Go to your code where you are generating the HTML representation of the orders that customers place. Add the following code to find the price of the chosen metal.

```js
const metals = getMetals()

// Remember that the function you pass to find() must return true/false
const foundMetal = metals.find(
    (metal) => {
        return metal.id === order.metalId
    }
)
const totalCost = foundMetal.price
```

Then, you can interpolate the price in the HTML string.

```js
const costString = totalCost.toLocaleString("en-US", {
    style: "currency",
    currency: "USD"
})

`<li>
    Order #${order.id} cost ${costString}
</li>`
```

## Finding all the Prices

Now it's your turn. Follow the same process as above to find the price for the chosen size and style for each order. Then take those values and add them to the value of the `totalCost` variable.

<img src="./images/kneel-diamonds-show-price.gif" width="800px" alt="animation showing total price on each order" />
