# Daily Journal

The learning objective for this chapter is to apply your knowledge of event listeners, and querying the DOM to make your daily journal form work and save entries to your API. You will also learn how to use `fetch` to make a POST request to your API.

## Saving Entries

![animation of saving new entries and rendering them](./images/image.png)

## Listen for Submit Button Click

## Collect Form Field Values

1. Using query selectors
1. Using `.value` property

### Basic Input Validation

1. Using required attribute to ensure no blank entries
1. No characters other than letters, numbers, `()`, `{}`, `:`, and `;`

## Using POST Verb with Fetch

Function to perform POST task in API module.

```js
fetch("url", {
    method: "POST",
    headers: {
        "Content-Type": "application/json"
    },
    body: JSON.stringify(object)
})
```

## Chained Promises

post.then(get).then(render)

## Challenge: Advanced Form Validation

1. Maximum length
1. No curse words

## Challenge: Entry Form Component

Create a module that defines a function for building the form fields dynamically instead of them being hard-coded in the HTML.

## Challenge: Creating Method Abstractions

Write a method in your API module that performs a POST and a GET, then use that method in the event listener.