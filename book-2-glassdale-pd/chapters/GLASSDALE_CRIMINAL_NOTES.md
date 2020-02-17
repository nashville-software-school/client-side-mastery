# Notes on Specific Criminals

In this chapter, you are going to modify your data so that notes are about specific criminals. A note will have a `criminalId` foreign key on them, so this is your first one -> many relationship you will be using in an application.

## Criminal and Note Data Example

Here is a quick example of how the data will look in your `database.json` file.

```json
{
    "notes": [
        {
            "id": 1,
            "noteText": "This is a possible suspect because she was not incarcerated at the time and had a motive.",
            "criminalId": 5
        }
    ]
}
```

## Multiple Providers

When you have two objects in different collections in your database that are related to each, that means that you need to pull in both collections to a component that wants to render information about both resources. For example, if you want your notes to render with the criminal name, then just using `useNotes()` will not be enough because each note only have the criminal's number on it.

> #### `glassdale/scripts/notes/NoteList.js`

```js
import { useNotes } from './NoteProvider.js'
import { useCriminals } from '../criminals/CriminalProvider.js'


const render = (noteCollection, criminalCollection) => {
    contentTarget.innerHTML = noteCollection.map(note => {
        // Find the related criminal
        const relatedCriminal = criminalCollection.find(criminal => criminal.id === note.criminalId)

        return `
            <section class="note">
                <h2>Note about ${relatedCriminal.name}</h2>
                ${note.noteText}
            </section>
        `
    })
}

const NoteList = () => {
    const notes = useNotes()
    const criminals = useCriminals()

    render(notes, criminals)
}
```
