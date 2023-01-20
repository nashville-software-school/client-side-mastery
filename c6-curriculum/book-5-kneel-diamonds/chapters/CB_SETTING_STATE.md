# Saving User Options to State

Update your change event listeners in each of the options modules to remove the `window.alert` code, and instead store the user's choice in your database.

##### Example for technologies

```js
setTechnology(parseInt(clickEvent.target.value))
```

Just like in Kneel Diamonds, there should be a state key in the database that starts as an empty object, and then gets keys added to it when the user chooses one of the options for each group.

Also make sure you define a setter function for each user's choice to track that transient state.
