# Your Own Notes Database

In this chapter, you are going to use a tool called [json-server](https://github.com/typicode/json-server) to run your own, local API in which you can manage notes about the case you are working on.

## Setup

First, you need to create a new sub-directory in your project named `api`. In that directory, create a file named `notes.json`. This fill will store the raw data for your API.

```sh
mkdir -p ~/workspace/glassdale/api && cd $_
touch notes.json
```

Now open `notes.json` in Visual Studio Code, and place the following starter JSON inside of it.

```json
{
    "notes": []
}
```

That notes array will store objects as you create them. Now think about what information needs to be on a note for your case. This will determine the properties on each object.

Here's some ideas.

1. Note text
1. Date of note
1. The suspect you are entering a note about

You decide what the properties should be defined on the object.

### Start json-server

Now that your JSON has been created, you can use json-server to start your own Notes API.

```sh
json-server -p 8088 -w notes.json
```

Once you run that, you will see a happy little guy displayed, along with the URL that json-server is making available. That URL (http://localhost:8088/notes) will be the target of all your `fetch()` calls when you request notes, add notes, and delete notes.

## Note Form Container

In order to enter notes, you will need a form. That form needs to rendered on the DOM somewhere. Therefore, you need a DOM element in your `index.html` file to be the container for it.

For starters, put it next to the element in which the criminals are rendered.

```html
<article class="noteFormContainer"></article>
<article class="criminalsContainer"></article>
```

## Components

Now it's time for you to create some form components. Go ahead and create a new directory to hold them at `glassdale/scripts/notes`.

You will need the following components.

1. Note data provider
1. Note form
1. Note list
1. Note

## Note Form Component

Next, you need some input fields for each of your note properties. For example, if your note object is going to have a `noteText` property, then you would need the following input field.

```html
<input type="text" id="note-text">
```

Define your component function and have it render the input fields you want to be able to enter. Make sure you put a button element in the component as well.

> **glassdale/scripts/notes/NoteForm.js**

```js
const contentTarget = document.querySelector(".noteFormContainer")

const render = () => {
    contentTarget.innerHTML = `
        Put some input fields and prompts here

        <button id="saveNote">Save Note</button>
    `
}

export const NoteForm = () => {
    render()
}
```

Import that component into the main component and add it to your component render chain. Perhaps before the criminal list is rendered, but its order in the chain is not truly relevent.

## Note Provider

In your note data provider, your fetch call is no longer going to query the Glassdale PD API, but rather the one running locally on your machine.

Your `getNotes()` method will execute a fetch to http://localhost:8088/notes.

Also, your note provider will have more functionality than the data providers you have defined thus far. Up to this point, you have been using only the GET method to get the API state into your application state. This provider will have the ability to modify the API state by using the POST verb on a fetch.

Add the following method to your provider.

> **glassdale/scripts/notes/NoteProvider.js**

```js
const eventHub = document.querySelector(".container")

const dispatchStateChangeEvent = () => {
    const noteStateChangedEvent = new CustomEvent("noteStateChanged")

    eventHub.dispatchEvent(noteStateChangedEvent)
}

const getNotes = () => {
    return fetch('http://localhost:8088/notes')
        .then(response => response.json())
        .then(parsedNotes => {
            notes = parsedNotes
        })

}

export const saveNote = note => {
    return fetch('http://localhost:8088/notes', {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(note)
    })
    .then(getNotes)
    .then(dispatchStateChangeEvent)
}
```

## Saving Notes

Now you need to add an event listener on the Event Hub to capture when the user clicks on the "Save Note" button, and when that happens, save a new note object to your json-server API.

```js
// Handle browser-generated click event in component
eventHub.addEventListener("click", clickEvent => {
    if (clickEvent.target.id === "saveNote") {

        // Make a new object representation of a note
        const newNote = {
            // Key/value pairs here
        }

        // Change API state and application state
        saveNote(newNote)
    }
})

const NoteForm = () => {
    // rest of the code here
}
```
