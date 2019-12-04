# Daily Journal

The learning objective for this chapter is to apply your knowledge of event listeners, and querying the DOM to make your daily journal form work and save entries to your API. You will also use `fetch` to make a POST request to your API, while using a factory function to generate the object that will be saved.

## Saving Entries

![animation of saving new entries and rendering them](./images/QBpNpy7FDL.gif)

## Listen for Submit Button Click

In your main JavaScript module (`journal.js`) add a click event listener to the **Record Journal Entry** button at the bottom of your form. When the user clicks the button, you need to create a new entry in your API. The HTTP method that you use to create resources is POST. Guidance on syntax is provided below.

## Collect Form Field Values

1. Use `document.querySelector` to select your input fields.
1. Use the `.value` property on the input field elements to get the text that you typed/chose.

## Journal Entry Factory Function

In your JournalForm component modules, define a factory function, named `createEntry()`, whose responsibility is to generate an object that represents a journal entry. It should define a parameter for each property on a journal entry and then return a new object that has all the properties defined.

```js
/*
    Example with one parameter provided. You must add the rest
*/
const createEntry = (mood, ) => {
    return {}
}
```

## Using POST Method to Create Resources

Now you must use `fetch` to create your journal entry in the API. The default method is GET, so you've never had to specify and configuration options with your `fetch` statements before. However, with POST, you need to configure the request.

1. Add new method named `saveJournalEntry` to your data provider module. It should take the entry object as an argument.
1. In the method, use `fetch` to perform a POST request.
    ```js
    // Use `fetch` with the POST method to add your entry to your API
    fetch("url", { // Replace "url" with your API's URL
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(newJournalEntry)
    })
        .then()  // <-- Get all journal entries
    ```
1. In journal form module, invoke method to save entry method.
1. Once the save operation is complete dispatch a new event to the Event Hub that the state of the entries data provider has changed. Here's an example of what your click event listener would look like in the journal form component.
    ```js
    eventHub.addEventListener("click", e => {
        // Invoke factory function

        // Send new entry object to
        saveJournalEntry(newEntryObject)
            .then(
                // Dispatch new custom event that state has changed
            )
    })
    ```
1. Now refactor your entry list component to listen for the event you dispatched. That listener function for render the list again with the new data.

## Challenges

> **Note:** Challenges are optional and often ask you to do things that were not covered in class. Please research the topic first before coming to your instructions team for guidance. If/when you hit a roadblock, then they will provide guidance.

### Challenge: Advanced Form Validation

Add the following validation code to your journal entry form fields.

1. Pick a maximum length for concepts field and provide visual feedback _(e.g. alert box, or putting text in a blank div)_ if you type in a string that is longer than that maximum.
1. Test that the concept and entry fields contain no curse words. You can use regular expressions for that.
