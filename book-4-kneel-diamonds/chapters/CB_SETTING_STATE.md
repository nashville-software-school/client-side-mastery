# Saving User Options to State

Update your change event listeners in each of the options modules to remove the `window.alert` code, and instead store the user's choice in your database.

Just like in Kneel Diamonds, there should be a state variable in the database that starts as an empty object, and then gets keys added to it when the user chooses one of the options for each group.