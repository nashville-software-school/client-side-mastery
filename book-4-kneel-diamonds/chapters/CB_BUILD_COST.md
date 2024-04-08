# Displaying Total Cost

Time to update the list of car orders to show the total cost of all customizations that the user has chosen. Use the **_expand** query paramter in your fetch URL to embed all of the related objects for a car.

Then calculate the sum of prices for all options for the car and display it for each car order.

If you want to try out something fun, display that cost on each HTML representation of the orders with the `toLocalString()` method which will place a dollar sign, and commas in the correct location for each cost.

```js
// To automatically format the number as currency
variableWithTotalPrice.toLocaleString("en-US", {
    style: "currency",
    currency: "USD"
})
```
