# Deleting Favorites

In this exercise, you will be allowing the user to remove an item from the favorites list by using the HTTP DELETE method on a fetch call.

## Setup

1. Add a button next to each favorited item labeled "Remove". Make sure that either the `id` or the `class` attribute on the button has the `id` property of the favorite item (e.g. `id="deleteFavorite--4"`)
1. Add a click event listener in your favorite list component module that capture the click of any remove button.
1. Add a `removeFavorite()` method to the data provider component. This method must use the DELETE method on the fetch call.
    ```js
    fetch(`http://localhost:5050/favorites/${id}`, {
        method: "DELETE"
    })
        .then(getFavorites)
    ```
