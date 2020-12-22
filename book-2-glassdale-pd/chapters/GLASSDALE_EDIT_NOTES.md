# Editing Incorrect Notes

TO DO - REFACTOR THIS TO USE HIDDEN INPUTS INSTEAD OF IDS ON BUTTONS

People make mistakes.

Misspelled words. Incorrect sentences. Using the wrong name. Oour capacity for eror is unmached.

So far, we've learned how to POST, GET, and DELETE data in our json-server database. In this chapter, we'll discuss how to edit our data with the PUT method.

Imagine we're making an app to store lego creations. At this point, we can add new lego creations to our database and print them all to the DOM. We can also delete any lego creation we want. We have the following lego creation in our database:

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
  <h3>Evil Ghost Pirate Ship</h3>
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

1. _Click Event One_: The user clicks the edit button to show the edit form
1. _Click Event Two_: The user clicks the save button on the edit form

Let's focus on one click event at a time.

## What happens when a user clicks the edit button?

When a user clicks the edit button, we need to show them an edit form so they can enter new information about their lego creation. We should auto-populate the fields of the edit form with the lego's current information. That way, if they decide not to change any of the fields, the old values will be saved.

Just like with our delete button, we can't add our event listener to the edit button directly because it's generated dynamically with JavaScript. Instead, we add it to the closest hard-coded ancestor in our HTML file.

```js
document.querySelector("body").addEventListener("click", (eventObject) => {
  // Check to see if the user clicked on something with a class of edit-btn
  if (eventObject.target.classList.contains("edit-btn")) {
    const legoId = eventObject.target.id.split("-")[1]; // "1"

    // the rest of our logic will go right here
  }
});
```

Once our event listener is working, we can use `event.target` to get our lego creation's id.
We'll use that id to find the specific lego creation we want to edit.

```js
const legoCreationToEditId = +e.target.id.split("-")[2];

// Then we have to get access all the lego creations
const legos = useLegos();

// Then we find the specific lego creation that we want to edit
const legoToEdit = legos.find(
  (singleLegoCreation) => singleLegoCreation.id === legoCreationToEditId
);
```

Once we have all the data for the single item we clicked on, we can pass it into a function that builds an edit form.

```js
const LegoEditForm = (singleLego) =>
  contentTarget.innerHTML = `<form>
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
  <button class="save-edit-btn" id="save-edit-${singleLego.id}">Save</button>`;
```

At this point, our event listener might look like this:

```js
document.querySelector("body").addEventListener("click", (eventObject) => {
  // If they click on the edit button of any lego, load the edit form
  if (eventObject.target.id.includes("edit-lego")) {
    // First we have to get the id of the lego we want to edit
    const legoToEditId = +eventObject.target.id.split("-")[2];

    // Then we have to get access to all the lego creations
    const legos = useLegos();

    // Then we find the specific lego creation that we want to edit!
    const legoToEdit = lego.find(
      (singleLegoCreation) => singleLegoCreation.id === legoToEditId
    );

    // And we pass it into the note form so that our form fields are pre-loaded with the right information
    LegoEditForm(noteToEdit);
  }
});
```

When the user clicks the edit button, voila! An edit form pops up. All the fields are auto-populated with the lego creation's information. We can make any changes we want before we click the save button.

## What happens when a user clicks the save button on an edit form?

We need to do three things:

1. Get the values of all the form fields.
1. Build a new object with those values
1. PUT the new lego object to our json-server database.

Our event listener might look something like this:

```js
document.querySelector("body").addEventListener("click", () => {
  // Check to see if the user clicked on something with a class of save-edit-btn
  if (event.target.classList.contains("save-edit-btn")) {
    const legoId = event.target.id.split("-")[2]; // "1"
    // build a new object with the data in the edit form
    const editedLegoData = {
      id: legoId,
      creator: document.querySelector("#lego__creator--edit").value,
      shape: document.querySelector("#lego__shape--edit").value,
      creation: document.querySelector("#lego__creation--edit").value,
    };

    // We'll call our PUT method right here!
  }
});
```

Now we just need to send our newly edited lego data to our json-server database!

Here's what a PUT method looks like:

```js
const updateLego = (legoObject) => {
  return fetch(`http://localhost:8088/tasks/${legoObject.id}`, {
    method: "PUT",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(legoObject),
  });
};
```

Here's what our final event listner might look like:

```js
document.querySelector("body").addEventListener("click", () => {
  // Check to see if the user clicked on something with a class of save-edit-btn
  if (event.target.classList.contains("save-edit-btn")) {
    const legoId = event.target.id.split("-")[2]; // "1"
    // build a new object with the data in the edit form
    const editedLegoData = {
      id: legoId,
      creator: document.querySelector("#lego__creator--edit").value,
      shape: document.querySelector("#lego__shape--edit").value,
      creation: document.querySelector("#lego__creation--edit").value,
    };

    updateLego(editedLegoData).then(() => {
      // reprint the list of legos
    });
  }
});
```

Once the PUT request is successfully completed, we need to reprint our list so that the newly edited lego creation shows up.

## Practice: Editing Notes

First, build your edit form component.

>**glassdale/notes/NoteEditForm.js**
```js
export const NoteEditForm = (noteToEditObject) => {
  // Todo: add HTML markup here to print your edit form to the DOM
  // Be sure to load the values from the noteToEditObject into the form fields so that they auto-populate
  // Textarea elements behave a bit differently than inputs, so if you choose to use a textarea you may need to google or phone a friend for help
  document.querySelector(".note-form-container").innerHTML = `
        <h3>Update Your Note</h3>
        <input placeholder="Your inputs go here"/>
    `;
};

```
**Test your work**: Once you've created your edit form component, try adding it to your render chain in `main.js` just to be sure it shows up correctly. You shouldn't see values in the form fields, because right now your edit button doesn't know which note you want to edit. _But_ you should see a form! You won't want to render your edit form in `main.js` forever, because ultimatley we want it to show up when they click the edit button. Let's do that part next.

1. Add an edit button to each note. Which component should this be in?
1. In your `NoteEditForm` component, write an event listener that will listen for a click on the edit button.
1. The event listener should load the edit form.


>**glassdale/notes/NoteEditForm.js**
```js

document.querySelector("body").addEventListener("click", (eventObject) => {
  // If they click on the edit button of any note, load the edit form
  if (eventObject.target.id.startsWith("edit-note")) {
    // First we have to get the id of the note we want to edit
    const noteToEditId = +eventObject.target.id.split("-")[2];

    // Then we have to get access to all the notes
    const notes = useNotes();

    // ---------- Your code goes here! --------------//

    // Find the note we want to edit out of the notes collection

    // Pass the note we want to edit into the function that builds the edit form
  }
});
```

**Test your work**: At this point, you should:
1. See an edit button on your notes
1. When you click on an edit button, you should see an edit form and
1. You should see the form field pre-populated with data from the note you clicked on


When you click the "Save" button in your edit form, nothing happens. Let's do that part next. First, let's add a function in `NoteDataProvider.js` that will update a note.
>**glassdale/notes/NoteDataProvider.js**
```js
export const updateNote = (note) => {
  return fetch(`http://localhost:8088/notes/${note.id}`, {
      method: "PUT",
      headers: {
          "Content-Type": "application/json"
      },
      body: JSON.stringify(note)
  })
}
```

Now add an event listener on your save button. When the user clicks save, we need to figure out what they typed into the inputs and then send those to our json-server to update that note's information.

>**glassdale/notes/NoteEditForm.js**
```js
document.querySelector(".container").addEventListener("click", (eventObject) => {
  // If they click on the edit button of any note, load the edit form
  if (eventObject.target.id.startsWith("edit-note")) {
    // You wrote your awesome code here!
  } else if (eventObject.target.id === "update-note") {
    // Phase two: we've edited and we're ready to save our changes!
    // First we gather our changes from the input
    const noteToUpdate = {
      id: /* value of input*/,
      dateOfIntervew:/* value of input */,
      timestamp: Date.now(),
      author: /* value of input */,
      note: /* value of input */,
    };

    // Call the function in NoteDataProvider that updates a note
    // Reload the list of all the notes

  }
});

```



## Challenge: Reusing One Form Component for Edit and Create

Now we have two form components: one to edit and one to create. They have a lot of the same elements: inputs for author, date, note text, etc. This isn't very DRY. If you have the bandwidth, try to refactor the component you used to create notes and use it for editing notes as well.



