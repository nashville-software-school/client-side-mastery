# Editing Notes


People make mistakes.

Misspelled words. Incorrect sentences. Using the wrong name. Oour capacity for eror is unmached.

So far, we've learned how to print, add, and delete our notes. Now we're going to learn how to modify our notes if we make a typo or if our information changes.

In general, we can think of edit functionality as a four step process:

1. The user clicks the edit button beside a note
2. A form pops up pre-populated with that note's information
3. The user changes some of the information
4. The user clicks "Save Changes" on the edit form, and the newly modified note information is saved to the database

That means that we're going to be dealing with two distinct click events:

1. _Click Event One_: When the user wants to edit a note, they click a button to show the edit form
2. _Click Event Two_: Once the user is _done_ editing a note, they click a button to save their changes

Let's focus on one click event at a time.

## Edit Button
First, let's add an edit button to our `Note` component. Just like with our delete button, we need to know which note we want to edit so we add the note's unique id to the button.

**notes/Note.js**
```js
<button id="edit--${noteObject.id}">Edit</button>
```
Next, add an event listener on that button.

**notes/Note.js**
```js
const eventHub = document.querySelector(".noteListContainer")
eventHub.addEventListener("click", (eventObject) => {

    const noteId = +eventObject.target.id.split("--")[1]
    NoteEditForm(noteId);
})
```
Right now this code will throw errors because we haven't built a `NoteEditForm` component yet. That's ok! Let's build one next.

## Edit Form
When we click the edit button, a form should pop up. But not just an empty form. We want this form to come filled with all of the note's information.

Go ahead and create a new file called `NoteEditForm.js`. Copy and paste the following code into it.

**notes/NoteEditForm.js**
```js
import {useNotes} from "./NoteDataProvider.js"

// We're going to print the edit form where the "add note" form usually goes. We could move it around on the page by changing our content target.
const contentTarget = document.querySelector(".noteFormContainer")

export const NoteEditForm = (noteId) => {
    // Give this component access to our application's notes state
    const allNotes = useNotes();

    // Find the note that we clicked on by its unique id
    const noteWeWantToEdit = allNotes.find(singleNote=> singleNote.id === noteId)

    // Print the form
    // We'll use the HTML value attribute to pre-populate our form fields with the note's info
    contentTarget.innerHTML = `
        <h2>Edit Note</h2>
        <input type="date" id="note-date" value="${noteWeWantToEdit.date}" />
        <input type="text" value="${noteWeWantToEdit.text}" id="note-text" />
        <input type="text" value="${noteWeWantToEdit.suspect}" id="note-suspect" />
        <button id="saveNoteChanges-${noteId}">Save Changes</button>
    `
}
```
Be sure to import this new component into your `Note` component so that we can render it when we click on any note's "Edit" button.

**Test your work** by trying to click on an edit button. You should see your "Add Note" form disappear. An edit form should replace it, and you should see the form fields pre-populated with data from the note that you clicked on. If you don't get that result, take soem time to troubleshoot and/or ask an instructor.

## Saving Your Changes
Once we've shown the user their edit form, the user can make all the changes they want. We don't need to do anything until they're done making changes and they click on the "Save Changes" button.

Then we need to do two things:

1. Get the newly modified values from the form
2. Send those values to our json-server database.

Add the following event listener to your `NoteEditForm` component.
**notes/NoteEditForm.js**
```js
eventHub.addEventListener("click", (event) => {
    if(event.target.id.startsWith("saveNoteChanges")){

        // Make a new object representation of a note
        const editedNote = {
            id: // how can you get the note's id?
            text: // get value of text from input
            suspect: // get value of suspect from input,
            date: // get value of date from input
        }

        // Send to json-server and refresh the list
        updateNote(editedNote).then(NoteList)

    }
})
```
This will throw errors for a couple of reasons. First of all, you'll need to fill in the code to pull the values from the appropriate input fields in your edit form. Second of all, you'll need to add an `updateNote` function in your provider. This will use the `PUT` verb to modify an entry in the databaes based on its unique id.

**notes/NoteDataProvider.js**
```js
export const updateNote = note => {

    return fetch(`http://localhost:8088/notes/${note.id}`, {
        method: "PUT",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(note)
    })

}
```

## Discussion Questions
Once you have this code working, go back through your code and try to answer the following questions. Come prepared to discuss your ideas with the group. It's ok if you don't know the answers to these questions-- that's a good indication that you should find an instructor and chat with them about this chapter.
1. How does the edit form know which note it should use to pre-populate its input fields?
2. How is editing a note similar to adding a note? How is it different?
3. How is editing a note similar to deleting a note? How is it different?


## Challenge: Reusing One Form Component for Edit and Create

Now we have two form components: one to edit and one to create. They have a lot of the same elements: inputs for author, date, note text, etc. This isn't very DRY. If you have the bandwidth, try to refactor the component you used to create notes and use it for editing notes as well.



