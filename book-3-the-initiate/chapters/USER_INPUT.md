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

This code should be the last logic inside the event listener.

## Practice

Rather than the user typing in the name of the color each time, define another collection in your API named `colors` and let the user select a pre-defined color from a `<select>` element.

```html
<select id="lego__color">
    <option value="1">Red</option>
    <option value="2">Green</option>
    <option value="3">Yellow</option>
    <option value="4">Blue</option>
    <option value="5">Orange</option>
    <option value="6">Black</option>
</select>
```

This will require you to refactor your lego API data structures by adding a new `colors` resource in the API.
