# Displaying Total Added Cost

Time to update the list of car orders to show the total cost of all customizations that the user has chosen.

1. Where are you generating the list of orders as HTML?
2. Use `find()` to get the related objects for wheels, paint, tech, and interior customizations.
    ```js
    const chosenPaint = paints.find(paint => {
        return paint.id === order.paintId
    })
    ```
3. Get the property from each object whose value is the cost.
    ```js
    chosenPaint.price  // For example. Check your properties.
    ```
4. Add all the costs together.
5. Display that cost on each HTML representation of the orders.
    ```js
    // To automatically format the number as currency
    variableWithTotalPrice.toLocaleString("en-US", {
        style: "currency",
        currency: "USD"
    })
    ```
