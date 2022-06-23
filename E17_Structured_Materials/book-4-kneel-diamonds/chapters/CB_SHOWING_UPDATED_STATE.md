# Placing a Car Order

When the user clicks the button to place an order, take their currently chosen options _(which are currently stored as state in the database)_ and construct a new order object to be placed in state.

1. Make sure there is a foreign key for each options type on the new object.
1. Make sure there is a new primary key value that is 1 greater than the current highest one.
1. Make sure there is a timestamp on the order.
1. Make sure you clear out the state that was being used to store the user options once the order state is created.
1. Trigger the `stateChanged` custom events and have the main module listen for it and regenerate all of the HTML.
1. Once regenerated, the new order should appear in the DOM.
    Example:
    ```html
    Order #1 was placed on 16895837301
    ```
