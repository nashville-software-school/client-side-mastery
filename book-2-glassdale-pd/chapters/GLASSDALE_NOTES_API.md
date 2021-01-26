# Your Own Notes Database

## Before this chapter...

- JSON
- `fetch()`
- Custom events

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

Remember, json-server allows you to access your notes data via an HTTP request. That means you can throw `http://wwwlocalhost:8088/notes` into a browser tab URL bar, or use Postman, to `GET` your data. Of course, you can just peek at `notes.json` to see if your POST works, as well. But where's the fun in that? 

## Viewing Notes

Next, it's time to find a way to display the notes in the DOM. Start by updating `index.html` to add a home for your notes. How about a nice sidebar to diplasy the notes in a column.

```html

<!-- existing code -->
<article class="noteFormContainer"></article>
<article class="criminalsContainer" id="criminalsContainer"></article>

<!-- new code -->
<aside class="noteListContainer">
  <div class="noteListButton"></div>
  <article class="noteList"></article>
</aside>
```

Notice that we've given your user an affordance for doing just that, by adding a `show notes` button. Or at least a spot to dynamically add one. ( Be aware that the button will be at the very bottom of the page until you add the proper styling )

Where do you write that JavaScript button code, though? The note form component shouldn't have that responsibility. You *could* put it in the `NoteList` component, but let's drink the component KoolAid to the fullest and make a whole component just to render that button. Add the following new file to the notes directory.

> **glassdale/scripts/notes/ShowNotesButton.js**

```js
const contentTarget = document.querySelector(".noteListButton")
const eventHub = document.querySelector(".container")

eventHub.addEventListener("click", clickEvent => {
    if (clickEvent.target.id === "showNotes") {
        const customEvent = new CustomEvent("showNotesClicked")
        eventHub.dispatchEvent(customEvent)
    }
})

export const ShowNoteButton = () => {
    contentTarget.innerHTML = "<button id='showNotes'>Show Notes</button>"
}
```
Here, you display the button and then create a custom event that simply declares the button was clicked. Is that enough? It will be, once your note list component gets in the game. 

First, remember to import and execute `ShowNoteButton()` in main,js.

Then, toss this into `Note.js`  
> **glassdale/scripts/notes/Note.js**

```js
export const NoteHTMLConverter = (noteObject) => {
    return `
        <section class="note">
            <div class="note__text">${ noteObject.text }</div>
            <div class="note__suspect">Title: ${ noteObject.suspect }</div>
            <div class="note__author">Author: ${ noteObject.author }</div>
            <div class="note__timestamp">Timestamp: ${ new Date(noteObject.timestamp).toLocaleDateString('en-US')  }</div>
        </section>
    `
}
```

Now you're ready to fire up your note list component.  

> **glassdale/scripts/notes/NoteList.js**

```js
import { getNotes, useNotes } from "./NoteProvider.js";
import { NoteHTMLConverter } from "./Note.js";

// Query the DOM for the element that your notes will be added to 
const contentTarget = document.querySelector(???)
// Define ye olde Evente Hubbe
const eventHub = ???

eventHub.addEventListener("showNotesClicked", customEvent => {
    NoteList()
})

const render = (noteArray) => {
    const allNotesConvertedToStrings = noteArray.map(
        // convert the notes objects to HTML with NoteHTMLConverter

    ).join("")

    contentTarget.innerHTML = ???
}

// Standard list function you're used to writing by now. BUT, don't call this in main.js! Why not?
export const NoteList = () => {
    getNotes()
        .then(() => {
            const allNotes = useNotes()
            render(allNotes)
        })
}
```
Pretty standard looking list component, right? Except for that event listener. That's new. Here, instead of calling `NoteList` when the app loads, you want the notes to display only after the user clicks the `show notes` button.

> NOTE: You are going to run across some errors as you build this. Some will be yours, but some will be from the code you've been given. Aren't we stinkers? You'll need to read the errors and use your debugging skills to get past them. Welcome to your new career.

## Styling break

By this point, you should be seeing your notes appear on the page when the button is clicked. Yay! But it probably looks like garbage. Boo. If you just can't look at that mess, this is a great time to throw in some CSS and flex those boxes 'til your `<aside>` is actually, well, on the side.


## Synching your API state and App state

Now that you're adding and displaying notes, you're just about ready to show off this latest feature to Chief Watson. But not quite.  

Try adding a new note. Check the db to verify that the new note is there. If it is, good job! You didn't break that code while working on displaying the notes. Look at the DOM, though. It still shows the previous notes. Clicking the notes button will fix that, but it's not a great user experience. The Chief will definitely not want to waste time clicking that button over and over.

To steal a line from *Cool Hand Luke*, what we've got here is a failure to communicate. Your database state has changed. And, thanks to the last couple of lines in `saveNote` in your note provider, your application state has been updated to match that new API state. Then, another helpful custom event has dispatched that news far and wide.

```js
export const saveNote = note => {
    let stringifiedObj = JSON.stringify(note)
    debugger
    return fetch('http://localhost:8088/notes', {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: stringifiedObj
    })
    .then(getNotes) // fetch the notes collection containing the newly added note
    .then(dispatchStateChangeEvent) // tell any component listening that the notes state has been updated
}
```
But, is anyone out there listeneing? Which component needs to know about this important update? Bet you can figure it out. 

Once you do, notice what happens when you add a new note when the note list isn't being shown already. Does the list now display? If so, how might you keep that from happening? 

Discuss with your classmates and try a couple of different solutions to the problem. Which solution is most satisfying. Why? We'd love to hear what you come up with!
