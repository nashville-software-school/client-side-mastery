# Daily Journal

The learning objective for this chapter is to apply your knowledge of event listeners, and querying the DOM to make your daily journal form work and save entries to your API. You will also use `fetch` to make a POST request to your API, while using a factory function to generate the object that will be saved.

## Saving Entries

![animation of saving new entries and rendering them](./images/QBpNpy7FDL.gif)

## Listen for Submit Button Click

In your main JavaScript module (`journal.js`) add a click event listener to the **Record Journal Entry** button at the bottom of your form. When the user clicks the button, you need to create a new entry in your API. The HTTP method that you use to create resources is POST. Guidance on syntax is provided below.

## Collect Form Field Values

1. Use `document.querySelector` to select your input fields.
1. Use the `.value` property on the input field elements to get the text that you typed/chose.

### Basic Input Validation

1. Use a conditional to ensure no blank entries

## Journal Entry Factory Function

Define a factory function whose responsibility is to generate an object that represents a journal entry.

## Using POST Method to Create Resources

Now you must use `fetch` to create your journal entry in the API. The default method is GET, so you've never had to specify and configuration options with your `fetch` statements before. However, with POST, you need to configure the request.

Here's an example.

```js
// Invoke the factory function, passing along the form field values
const newJournalEntry = ??

// Use `fetch` with the POST method to add your entry to your API
fetch("url", { // Replace "url" with your API's URL
    method: "POST",
    headers: {
        "Content-Type": "application/json"
    },
    body: JSON.stringify(newJournalEntry)
})
```

## Chained Promises

* Add new method named `saveJournalEntry` to your data module. It should take the entry object as an argument.
* Implement the method using `fetch` to perform a POST request.
* In main module, invoke method to save entry, then add item to local array.
* Update DOM with updated array values.

```js
post.then(get).then(render)
```

## Challenge: Input Validation
1. No characters other than letters, numbers, `()`, `{}`, `:`, and `;`


## Challenge: Advanced Form Validation

Add the following validation code to your journal entry form fields.

1. Pick a maximum length for concepts field and provide visual feedback _(e.g. alert box, or putting text in a blank div)_ if you type in a string that is longer than that maximum.
1. Test that the concept and entry fields contain no curse words. You can use regular expressions for that.

## Challenge: Entry Form Component

Create a module that defines a function for building the form fields dynamically instead of them being hard-coded in the HTML.

## Challenge: Creating Method Abstractions

Write a method in your API module that performs a POST and a GET, then use that method in the event listener.
