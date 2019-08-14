# Gathering Information from Users

One of the most common ways that developers have used since the dawn of the Web to collect information from the users of their application is the form. A form contains many different kinds of fields, and your job as a developer is to gather the user's input and save it to a persistent data store.

In this chapter you will be creating a two input fields for the user to enter in information, then capturing that input when a button is clicked, and generating an HTML representation from that raw data.

## Address Book

Your job is to create a very straightforward form that someone can use to build an address book. You will not be persisting this data, so use of `json-server` is not needed. This is just to practice the operation of capturing input and builing DOM elements based on it.

## Setup

```sh
mkdir -p ~/workspace/javascript/exercises/address-book && cd $_
simplehtml address.css address.js
```


### Define Fields

Start with the basics. Define two fieldsets, one for entering in a person's name, and one for entering in the person's address.

In each fieldset, define a `<label>` element, and an `<input>` field for each of the piece of data our user will be providing.


```html
<fieldset>
    <label for="fullName">Name</label>
    <input type="text" id="fullName" placeholder="Enter person's full name" autofocus />
</fieldset>
<fieldset>
    <label for="address">Address</label>
    <input type="text" id="address" placeholder="Address" />
</fieldset>
```

Make sure you put a button after all the fields with the text **Save**.

```html
<button id="saveEntry">Save Address</button>
```

Then add an HTML element to act as a container for all addresses.

```html
<article id="addressList"> </article>
```

## Handle Save Button Click

Add an event listener to the Save button, and start collecting the value of each of the input fields.

```js
// Some starter code
const container = document.querySelector("#addressList")

document.querySelector("#saveEntry").addEventListener("click", event => {
    /*
        Collect the user put by selecting the input fields, one
        at a time, and accessing the `value` property
    */
    const personName = document.querySelector("#fullName").value
    const personAddress = document.querySelector("#address").value

    // Once you have collected all the values, update the DOM
    // with some HTML
    container.innerHTML += `
        <section>
            <h1>${personName}</h1>
            <div>${personAddress}</div>
        </section>
    `

})
```

## Practice: These are a few of my favorite things

Build two fieldsets and input fields that will allow you to enter the name of a favorite thing of yours, and a location where you might purchase it (Target, Amazon, Best Buy, etc...)

Add a button beneath the fieldsets labeled "Save to Wishlist".

When the button is clicked, display the data in the following format in the DOM.

```
I can purchase {thing} at {location}
```

![](./images/favorite-thing.png)

## Challenge

When you click the button and the new favorite thing is added to the DOM, clear out the value of both input fields. Then set the focus to the firsrt input field.

## Challenge

When you click the button check if both input fields have a value that is not empty string (`""`). If it is that, then you did not type anything into that input field.

If either input field is blank, do not add anything to the DOM and alert the user that they need to enter in all information.

## UI/UX Challenge
**This is an optional challenge once you meet MVP. Make a new GitHub branch for this challenge.**

Employ best practices for form design
Take a look at Luke Wroblewski's article on form design. The following sections will get you started. [webforms_lukew.pdf](webforms_lukew.pdf)
1. Inputs: pp18-48 (lots of visual examples)
2. Actions: pp49-56
