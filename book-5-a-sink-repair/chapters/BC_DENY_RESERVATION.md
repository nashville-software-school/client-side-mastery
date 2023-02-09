# Denied!

Sometimes Buttons and Lollipop have conflicting reservations, or are just unavailable during a requested time. Add a `<button>` next to each reservation with the word "Deny" as the text of the button. Make sure the `id` attribute of each button contains the primary key of the request.

Then add a click event listener that reacts to the delete button being clicked. Extract the primary key from the `event.target.id` using the `.split("--")` technique along with array destructuring.

## Deleting Reservations

Create and export a function in the data access module that contains a `fetch()` call which performs a request to your API with the DELETE method. Make sure the function has a parameter defined so that other modules can specify the `id` of the reservation to be deleted.

Also remember that you can only delete single resources, so you will need the id value at the end of the URL for the DELETE request.

`http://localhost:8080/resource/id`
