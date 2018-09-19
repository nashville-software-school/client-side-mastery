# Daily Journal

The learning objective for this chapter is to apply your knowledge of event listeners, and querying the DOM to make your daily journal form work and save entries to your API. You will also use `fetch` to make a POST request to your API.

## Saving Entries

![animation of saving new entries and rendering them](./images/QBpNpy7FDL.gif)

## Listen for Submit Button Click

In your main JavaScript module (`journal.js`) add a click event listener to the **Record Journal Entry** button at the bottom of your form. When the user clicks the button, you need to create a new entry in your API. The HTTP method that you use to create resources is POST. Guidance on syntax is provided below.

## Collect Form Field Values

1. Using query selectors
1. Using `.value` property

### Basic Input Validation

1. Using required attribute to ensure no blank entries
1. No characters other than letters, numbers, `()`, `{}`, `:`, and `;`

## Using POST Method to Create Resources

Now you must use `fetch` to create your journal entry in the API. The default method is GET, so you've never had to specify and configuration options with your `fetch` statements before. However, with POST, you need to configure the request.

Here's an example.

```js
fetch("url", { // Replace "url" with your API's URL
    method: "POST",
    headers: {
        "Content-Type": "application/json"
    },
    body: JSON.stringify(journalEntryObject)
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

## Challenge: Advanced Form Validation

1. Maximum length
1. No curse words

## Challenge: Entry Form Component

Create a module that defines a function for building the form fields dynamically instead of them being hard-coded in the HTML.

## Challenge: Creating Method Abstractions

Write a method in your API module that performs a POST and a GET, then use that method in the event listener.