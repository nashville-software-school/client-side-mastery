# Updating and Deleting Your Data

So far, we've learned how to POST new data to our json-server database. In this chapter, we'll discuss how to edit and delete our data.

Let's revisit our application for registering lego creations. At this point, we can add new lego creations to our database and print them all to the DOM. Imagine we have the following lego creation in our database:
```json
{
  "id": "1",
  "creator": "Emily Lemmon",
  "shape": "Boat",
  "creation": "Evil Ghost Pirate Ship"
}
```
We might represent it to our users with a DOM component that looks like this:

```html
<section>
  <h3> Evil Ghost Pirate Ship </h3>
  <p>Boat</p>
  <p>Emily Lemmon</p>
  <button class="edit-btn" id="edit-1">Edit</button>
  <buton class="delete-btn" id="delete-1">Delete</button>
</section>

```
There are two important things to keep in mind here:
1. The DOM component above is generated with JavaScript. It's not hard coded into our HTML file.
1. We gave each button a unique id that corresponds to the entry's id in the database. This is going to come in handy later.

## Deleting Data
First, let's add an event listener to our delete button. Because this DOM component was generated with JavaScript, we'll have to add our event listener to one of its parent elements that *wasn't* dynamically generated with JavaScript. In other words, find the closest parent element that's hard coded into your HTML file.

```js
// Add the event listener to the entire body element
document.querySelector("body").addEventListener("click", () => {
  // Check to see if the user clicked on something with a class of delete-btn
  if(event.target.classList.contains("delete-btn")){
    console.log(event.target.id); // in our example, this will be "delete-1"
    console.log(event.target.id.split("-")); // ["delete", "1"]
    console.log(event.target.id.split("-")[1]) // "1"

    // Hooray! We've used event.target to figure out which button we clicked on, and we used the .split() method to get the id of our lego creation that matches its id in the database
  }
})
```

Now we can use fetch to delete just that item in the database.

```js
  fetch(`http://localhost:8088/legos/${idToDelete}`,{
        method: "DELETE"
  }).then(() => {
    // get all the legos again to "refresh" the list
  })

```

## Updating Data

We'll add our event listener in pretty much the same way.
```js
document.querySelector("body").addEventListener("click", () => {
  // Check to see if the user clicked on something with a class of delete-btn
  if(event.target.classList.contains("edit-btn")){
    const legoId = event.target.id.split("-")[1] // "1"
    getSingleItem(legoId)
    .then(singleLegoData => {
      document.querySelector("#form-container").innerHTML += buildForm(singleLegoData);
    })
  }
})

```

This time, in the event listener, we need to build a form that allows users to enter new data about the item they want to edit. It's a nice UI to go ahead and give the fields a `"value"` attribute of the item's current values, so let's get those first.

```js
const getSingleItem = (id) => {
  return fetch(`http://localhost:8088/${id}`)
  .then(response => response.json())
}
```
That function will get an item by its id. Once we have all the data for the single item we clicked on, we can pass it into a function that builds an edit form.

```js
const buildEditForm = singleLego =>
 `<form>
    <fieldset>
      <label for="lego__creator">Creator:</label>
      <input id="lego__creator" name="lego__creator" type="text" value=${singleLego.creator} autofocus />
    </fieldset>
    <fieldset>
      <label for="lego__creator">Shape:</label>
      <input id="lego__creator" name="lego__creator" type="text" value=${singleLego.shape} autofocus />
    </fieldset>
    <fieldset>
      <label for="lego__creator">Creation:</label>
      <input id="lego__creator" name="lego__creator" type="text" value=${singleLego.creation} autofocus />
    </fieldset>
  </form>
  <button id="submit-edit-${singleLego.id}">Submit</button>`
```

Okay, so at this point here's what's happening from a user's perspective:
1. A user clicks on the edit button next to a lego
1. A form pops up auto-populated with that lego's information
1. The user can enter new information into the form fields and then click the Submit button

When they click the Submit button, we need to do three things:
1. Get the values of all the form fields.
1. Build a new object with those values
1. PUT the new lego object to our json-server database.

Here's what a PUT method looks like:
```js
const editLego= legoObject =>{
    return fetch(`http://localhost:8088/tasks/${legoObject.id}`,{
        method: "PUT",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(legoObject)
    })

}

```

Once the PUT request is successfully completed, we need to make another GET request to get all of the legos in the database and print them to the DOM so that our list "refreshes" and our newly edited information shows up.


## Practice: Delete
1. Revisit your HR application from the User Input chapter.
1. Add a delete button to your employee DOM component.
1. When the user clicks the delete button beside an employee's DOM component, that employee should be deleted from the database and the DOM

## Practice: Edit
1. Revisit your HR application from the User Input chapter.
1. Add an edit button to your employee DOM component.
1. When the user clicks the edit button beside an employee's DOM component, a form shoud appear. The form should be auto-populated with that employee's information.
1. When the user clicks the submit button on the form, the employee's information should be updated in the database and on the DOM.









