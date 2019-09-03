# Gathering Information from Users

One of the most common ways that developers have used since the dawn of the Web to collect information from the users of their application is the form. A form contains many different kinds of fields, and your job as a developer is to gather the user's input and save it to a persistent data store.

In this chapter you will be creating a form to allow users to define their own Lego creations.

## Define Data Structure

Before you begin writing a single line of code, one of the things you need to is design your data structures. Since we're building Lego creations, you need to determine what information should be collected from the user, and what form the data will take.

Here's the core requirements for what the user should be able to specify.

* Their name
* Name of their creation
* Color of the bricks
* Basic shape for creation (plant, animal, circular, etc...)

Here's a data structure that fulfills those requirements. Is it the only logical data structure? Absolutely not, but it is often best to start simple and obvious.

```js
const legoCreation = {
    id: 1,
    creator: "Per Sun",
    color: "Black",
    shape: "Animal",
    creation: "Black Cow"
}
```

## Define Form

Next, define an HTML form that has a fieldset for each of the values that the user must provide.

## Define Fields

In each fieldset, define a `<label>` element, and an `<input>` field for each of the properties in our data structure that the user must provide.

Here's what the creator fieldset should look like.

```html
<fieldset>
    <legend>Register your Lego Creation:</legend>
    <label for="lego__creator">Creator:</label>
    <input id="lego__creator" name="lego__creator" type="text" autofocus />
</fieldset>
```

Make sure you put a button after all the fields with the text **Save**.

```html
<button class="btn lego__save">Save Lego Creation</button>
```

## Handle Save Button Click

Add an event listener to the Save button, and start collecting the value of each of the input fields.

```js
// Some starter code
document.querySelector(fillInTheBlank).addEventListener("click", event => {
    const creator = document.querySelector(".lego__creator").value

    // Once you have collected all the values, build your data structure
    const legoToSave = {
        property: value,
        property: value,
        property: value,
        property: value
    }
})
```

## Saving User Input to API

Now you must use `fetch` to create your lego in the API. The default method for `fetch` is GET, so you've never had to specify and configuration options before. However, with POST, you need to configure the request.

Here's an example.

```js
fetch("url", { // Replace "url" with your API's URL
    method: "POST",
    headers: {
        "Content-Type": "application/json"
    },
    body: JSON.stringify(legoToSave)
})
```

This code should be the last logic inside the event listener. By the end, your event listener looks like this:

```js
document.querySelector(fillInTheBlank).addEventListener("click", event => {
    const creator = document.querySelector(".lego__creator").value

    // Once you have collected all the values, build your data structure
    const legoToSave = {
        property: value,
        property: value,
        property: value,
        property: value
    }

    fetch("url", { // Replace "url" with your json-server API's URL
        method: "POST",
            headers: {
            "Content-Type": "application/json"
        },
    body: JSON.stringify(legoToSave)
    })
})
```
The code above will POST the lego to your json-server database, but the new lego will not apepar on the DOM. To update the DOM with the newly added lego, you'll need to make a GET request for all the legos from the database. Then you'll have to print them to the DOM.

*Note: it's important that you wait for the POST request to complete before you GET all of the legos again to refresh the DOM. That means that you'll need to chain a `.then()` onto the POST logic and run the code to GET all of the legos inside that `.then()`.*

```js
document.querySelector(fillInTheBlank).addEventListener("click", event => {
    const creator = document.querySelector(".lego__creator").value

    // Once you have collected all the values, build your data structure
    const legoToSave = {
        property: value,
        property: value,
        property: value,
        property: value
    }

    fetch("url", { // Replace "url" with your json-server API's URL
        method: "POST",
            headers: {
            "Content-Type": "application/json"
        },
    body: JSON.stringify(legoToSave)
    }).then(() => {
        // Once the lego has been posted, GET all of the legos from the database
        fetch('url')
        .then(response => response.json())
        .then(parsedLegos => {
            // Print your legos to the DOM here
        })
    })
})
```
The code above can (and probably should) be refactored into smaller, single responsibility functions. It can also be refactored so that you chain your `.then()` methods instead of nesting them inside each other. Here's an example of how we might refactor the code above:
```js
document.querySelector(fillInTheBlank).addEventListener("click", event => {
    const creator = document.querySelector(".lego__creator").value

    // Once you have collected all the values, build your data structure
    const legoToSave = {
        property: value,
        property: value,
        property: value,
        property: value
    }

    fetch("url", { // Replace "url" with your json-server API's URL
        method: "POST",
            headers: {
            "Content-Type": "application/json"
        },
    body: JSON.stringify(legoToSave)
    }).then(() => {
     return fetch('url') // GET all of the legos AFTER the POST is complete
    })
    .then(response => response.json())
    .then(parsedLegos => {
        console.log(parsedLegos)
        // print parsedLegos to the DOM
    })
})
```

