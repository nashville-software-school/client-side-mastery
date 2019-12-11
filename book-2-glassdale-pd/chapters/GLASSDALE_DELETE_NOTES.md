# Deleting Notes

As you keep notes during your investigation, you will eventually find that some of the notes are no longer relevant, and you want to remove them from your personal notes API. In this chapter, you are going to be refactoring your notes list to add a delete button which, when clicked, will delete the corresponding note from the API.

## Adding Delete Button

In your note component, add some HTML that displays a delete button.


> #### `glassdale/scripts/notes/Note.js`

```js
const NoteComponent = noteObject => `
    <section class="note">
        <div class="note__text">${noteObject.text}</div>
        <div class="note__suspect">${noteObject.suspect}</div>
        <div class="note__timestamp>${noteObject.timestamp}</div>
        <button id="deleteNote--${noteObject.id}">Delete</button>
    </section>
`

export default NoteComponent
```

> #### `glassdale/scripts/notes/NoteList.js`

```js
... awesome code above

const render = notes => {
    contentTarget.innerHTML = `
        <h2>Cold Case Notes</h2>
        ${
            notes.map(note => NoteComponent(note)).join("")
        }
    `
}

... awesome code below
```

## Adding a DELETE Operation

Add a new method to your note data provider with a fetch that uses the DELETE method.

```js
const deleteNote = noteId => {
    return fetch(`http://localhost:8088/notes/${noteId}`, {
        method: "DELETE"
    })
        .then(getNotes)
}
```

## Handling Delete Button Click

In your note list component, add a new event listener to the event hub that captures any delete button click.

> #### `glassdale/scripts/notes/NoteList.js`

```js
const eventHub = document.querySelector(".container")

eventHub.addEventListener("click", clickEvent => {
    if (clickEvent.target.id.startsWith("deleteNote--")) {
        const [prefix, id] = clickEvent.target.id.split("--")

        /*
            Invoke the function that performs the delete operation.

            Once the operation is complete you should THEN invoke
            useNotes() and render the note list again.
        */
       deleteNote(id).then( () => render(useNotes()) )
    }
})
```