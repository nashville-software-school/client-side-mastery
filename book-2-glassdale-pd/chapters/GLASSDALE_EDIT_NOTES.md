# Editing Incorrect Notes

People make mistakes.

Misspelled words. Incorrect sentences. Using the wrong name. Oour capacity for error is unmatched.

## Editing Form

1. Modify the **`NoteForm`** component. It should accept a note object as a parameter. It should define an HTML form with two fields.
    * A hidden input field to hold the `id` of the note.
    * A text field to hold the text of the note.
1. It should also have a button to save.

## Note List Refactor

1. Add a button next to the delete button for each note labeled "Edit" with an id of `deleteNote--${note.id}`.
1. Add an event listener that captures the click of any edit button.
1. When an edit button is clicked, render the note edit form in the main UI area. Make sure you pass the note object to the journal edit form component.

## Using PUT to Edit

Add a method to your note data provider to change a note.

```js
const editNote = (note) => {
    return fetch(`http://localhost:8088/notes/${note.id}`, {
        method: "PUT",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify(note)
    })
}
```