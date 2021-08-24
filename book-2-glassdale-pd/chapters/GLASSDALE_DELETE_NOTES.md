# Deleting Notes

As you keep notes during your investigation, you will eventually find that some of the notes are no longer relevant, and you want to remove them from your personal notes API. In this chapter, you are going to be refactoring your notes list to add a delete button which, when clicked, will delete the corresponding note from the API.

## Adding Delete Button

In your note HTML representation, add the following button.

> #### `glassdale/scripts/notes/Note.js`

```js
<button id="deleteNote--${noteObject.id}">Delete</button>
```


## Adding a DELETE Operation

Add a new method to your note data provider with a fetch that uses the DELETE method.

> #### `glassdale/scripts/notes/NoteProvider.js`

```js
const deleteNote = noteId => {
    return fetch(`http://localhost:8088/notes/${noteId}`, {
        method: "DELETE"
    })
}
```

## Handling Delete Button Click

In your notecomponent, add a new event listener to the event hub that captures any delete button click.

> #### `glassdale/scripts/notes/Note.js`

```js
const eventHub = document.querySelector(".container")

eventHub.addEventListener("click", (eventObject) => {
  if (e.target.id.startsWith("delete-note")) {
    const idToDelete = eventObject.target.id.split("-")[2]
    // ---------- Write your code here -------------//
    // Call the deleteNote function and pass in the appropriate id
    // Then call NoteList to refresh the list of notes
  }
});

```
