# Updating Your Data

So far, we've learned how to POST, GET, and DELETE data in our json-server database. In this chapter, we'll discuss how to edit our data with the PUT method.

We've come back to our application that stores lego creations. At this point, we can add new lego creations to our database and print them all to the DOM. We can also delete any lego creation we want. We have the following lego creation in our database:
```json
{
  "id": "1",
  "creator": "Emily Lemmon",
  "shape": "Boat",
  "creation": "Evil Ghost Pirate Ship"
}
```
We represented this data with a DOM component that looks like this:

```html
<section id="lego-creation-1">
  <h3> Evil Ghost Pirate Ship </h3>
  <p>Boat</p>
  <p>Emily Lemmon</p>
  <button class="edit-btn" id="edit-1">Edit</button>
  <button class="delete-btn" id="delete-1">Delete</button>
</section>

```

In general, we can think of edit functionality as a four step process:
1. The user clicks the edit button beside a single lego creation
1. A form pops up
1. The user enters some new information about that lego creation
1. The user clicks "save" on the edit form, and the new lego information is saved to the database

That means that we're going to be dealing with two distinct click events:
1. *Click Event One*: The user clicks the edit button to show the edit form
1. *Click Event Two*: The user clicks the save button on the edit form

Let's focus on one click event at a time.

## What happens when a user clicks the edit button?
When a user clicks the edit button, we need to show them an edit form so they can enter new information about their lego creation. We should auto-populate the fields of the edit form with the lego's current information. That way, if they decide not to change any of the fields, the old values will be saved.

Just like with our delete button, we can't add our event listener to the edit button directly because it's generated dynamically with JavaScript. Instead, we add it to the closest hard-coded ancestor in our HTML file.
```js
document.querySelector("body").addEventListener("click", (eventObject) => {
  // Check to see if the user clicked on something with a class of edit-btn
  if(eventObject.target.classList.contains("edit-btn")){
    const legoId = eventObject.target.id.split("-")[1] // "1"

    // the rest of our logic will go right here
  }
})
```

Once our event listener is working, we can use `event.target` to get our lego creation's id.
We'll use that id to make a GET request for that single lego creation's information.(We need this data to popualte the fields of our edit form.)

```js
const getSingleItem = (id) => {
  return fetch(`http://localhost:8088/${id}`)
  .then(response => response.json())
}
```
Once we have all the data for the single item we clicked on, we can pass it into a function that builds an edit form.

```js
const buildEditForm = singleLego =>
 `<form>
    <fieldset>
      <legend>Register Your Lego Creation:</legend>
      <label for="lego__creator">Creator:</label>
      <input id="lego__creator--edit" name="lego__creator" type="text" value=${singleLego.creator} autofocus />
      <label for="lego__creator">Shape:</label>
      <input id="lego__shape--edit" name="lego__creator" type="text" value=${singleLego.shape} autofocus />
      <label for="lego__creation">Creation:</label>
      <input id="lego__creation--edit" name="lego__creator" type="text" value=${singleLego.creation} autofocus />
    </fieldset>
  </form>
  <button class="save-edit-btn" id="save-edit-${singleLego.id}">Save</button>`
```

At this point, our event listener might look like this:
```js
document.querySelector("body").addEventListener("click", () => {
  // Check to see if the user clicked on something with a class of edit-btn
  if(event.target.classList.contains("edit-btn")){
    const legoId = event.target.id.split("-")[1] // "1"
    getSingleItem(legoId)
    .then(singleLegoData => {
      document.querySelector(`#lego-creation-${legoId}`).innerHTML = buildEditForm(singleLegoData);
    })
  }
})
```
When the user clicks the edit button, voila! An edit form pops up where that lego creation used to be. All the fields are auto-populated with the lego creation's information. We can make any changes we want before we click the save button.

## What happens when a user clicks the save button on an edit form?

We need to do three things:
1. Get the values of all the form fields.
1. Build a new object with those values
1. PUT the new lego object to our json-server database.

Our event listener might look something like this:
```js
document.querySelector("body").addEventListener("click", () => {
  // Check to see if the user clicked on something with a class of save-edit-btn
  if(event.target.classList.contains("save-edit-btn")){
    const legoId = event.target.id.split("-")[2] // "1"
    // build a new object with the data in the edit form
    const editedLegoData = {
      id: legoId,
      creator: document.querySelector("#lego__creator--edit").value,
      shape: document.querySelector("#lego__shape--edit").value,
      creation: document.querySelector("#lego__creation--edit").value
    }

  // We'll call our PUT method right here!

  }
})
```

Now we just need to send our newly edited lego data to our json-server database!

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
Here's what our final event listner might look like:

```js
document.querySelector("body").addEventListener("click", () => {
  // Check to see if the user clicked on something with a class of save-edit-btn
  if(event.target.classList.contains("save-edit-btn")){
    const legoId = event.target.id.split("-")[2] // "1"
    // build a new object with the data in the edit form
    const editedLegoData = {
      id: legoId,
      creator: document.querySelector("#lego__creator--edit").value,
      shape: document.querySelector("#lego__shape--edit").value,
      creation: document.querySelector("#lego__creation--edit").value
    }

    editLego(editedLegoData)
    .then(() => {
      // Get all legos from the database
      // Print all legos to the DOM to "refresh" the list and display the newly edited information
    })
  }
})
```

Once the PUT request is successfully completed, we need to make another GET request to get all of the legos in the database and print them to the DOM so that our list "refreshes" and our newly edited information shows up.

