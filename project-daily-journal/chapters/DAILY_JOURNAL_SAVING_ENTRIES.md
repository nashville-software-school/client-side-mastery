# Daily Journal

The learning objective for this chapter is to apply your knowledge of event listeners, and querying the DOM to make your daily journal form work and save entries to your API. You will also use `fetch` to make a POST request to your API, while using a factory function to generate the object that will be saved.

## Saving Entries

![animation of saving new entries and rendering them](./images/QBpNpy7FDL.gif)

## State Change

Since you will be implementing functionality in the chapter to create new journal entries in your API _(which is a state change)_, you need to implement a custom event whose responsibility is to broadcast to the application that the state of the journal entries has changed.

It's state has changed because a new item was added to the array of journal entries in your database. Add the following function to your journal data provider module.


## Using POST Method to Create Resources

Now you must use `fetch` to create your journal entry in the API. The default method is GET, so you've never had to specify and configuration options with your `fetch` statements before. However, with POST, you need to configure the request.

1. Add new function named `saveJournalEntry` to your data provider module. It should take the entry object as a parameter.
1. In the function, use the `fetch()` function to perform a POST request.
    ```js
    // Use `fetch` with the POST method to add your entry to your API
    fetch("fill this in with the URL to your API posts resource", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(newJournalEntry)
    })
        .then(
            () => {
                //  Get all journal entries
            }
        )
        .then(
            () => {
                //  Broadcast the state change event
            }
        )
    ```

## Saving New Journal Entry Process

1. In your **`JournalForm`** component module listen for the click on the **Record Journal Entry** button at the bottom of your form.
1. Use `document.querySelector` to select your input fields.
1. Use the `.value` property on the input field elements to get the text that you typed/chose.
1. Build a new object representation of a journal entry. Make sure the keys are consistent with the existing objects in your API.
1. Invoke the save function that you created in your provider component above.

## Regenerate HTML Once State Changes

Remember to listen for the state change in the main module and render the HTML representations of state again.
