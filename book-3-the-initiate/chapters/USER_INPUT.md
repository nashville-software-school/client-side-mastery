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

Your company is building an application for an HR department to keep track of its employees.Let's start by building out the functionality for a user to add a new employee and see a list of all the company's employees.

1. Set up a new project. This project should use Grunt to run `http-server` and `json-server` from the same terminal.
1. Create a collection (i.e. empty array) in your json-server database file called "employees"
1. In your `index.html` file, create a form. Your form should have input fields where the HR manager can enter information about the new employee. Include the following fields and add more if you like:
    - First name
    - Last name
    - Email address
    - Phone number
    - Birthday
    - Department
1. When the user clicks the "Add Employee" button on your form, use the data they entered into the form to build a new employee object in your JavaScript file.
1. `POST` the new employee object to your json-server database.
1. When the `POST` request is complete, get a list of all the employees from the database and print them to the DOM.

## Challenge: More Form Inputs
Add the following inputs to your form. In your JavaScript file, you should add their values to the employee object before you POST it to the database.
1. Refactor your form to include a checkbox labeled `Supervisor?`. If the check box is checked, add a property of `supervisor` to your employee object and set it equal to `true`. If not, add a property of `supervisor` to the employee object and set it equal to `false`.
1. Instead of having the HR manager enter the departments manually in a text input, create a dropdown of departments.
1. Add radio buttons in your form for the employee's gender


## Challenge: Filtering Data
If you haven't already, take some time to read about [filtering data with json-server](https://github.com/typicode/json-server#filter).
1. Create an affordance for users to view all the employees in a department. If that department has a supervisor, the supervisor's name should be in bold and their DOM component should have a black border that's 1px wide.
1. Create an affordance to view all the supervisors at the company (from any department).
1. Create a search bar where users can search all the employees at a company by first or last name.