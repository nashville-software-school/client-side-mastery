# Writing New Note with no Id

Write a function named `createNote` that will add a new note to the `notes` array. The function should add an `id` property to the note object that you provide as an argument when the function is invoked.

```js
const createNote = (note) => {
    /*
        Your code for adding `id` property to note object
     */

    notes.push(note)
}

// Create a new note object
const moreNewerNote = {

}

// Specify object as argument for function
//         |
//         |
//         V
createNote()
```

## Optional Challenge: Date Created

One of the properties on your notes is `date` which provides information about the date you learned a concept. However, you may not actually create the note until the next day - perhaps you got caught in a crowd of maniacal porcupines on the way home, and the trauma prevented you from entering the note.

Whatever the reason, you want to record the exact moment that the note was stored in the array, even if was for a previous date.

In your function, add another property named `dateCreated` and make its value be the current date and time. The [JavaScript Date()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/now) object is something to investigate to find out the current date/time.

If you want to try this challenge, and give it a few tries but get stuck, talk to your teammates or instruction team and get some helpful hints.

