# Placing a Car Order

When the user clicks the button to place an order, take their currently chosen options _(which are currently stored as transient state)_ and construct a new order object to be sent to the API to make it permanent.

1. Make sure there is a foreign key for each options type on the new object.
2. Ensure that you have properly defined the POST options for the **fetch**.
3. Make sure you reset transient state that was being used to store the user options once the order state is created.
4. Trigger the `stateChanged` custom event and have the main module listen for it and regenerate all of the HTML.
5. Once regenerated, the new order should appear in the DOM. Again, start with displaying a simple message with the order number. _(Did you create your **Orders** module yet to display HTML representations of orders?)__
