# Daily Journal

You have built your form for entering in journal entries, so now you need to define how the data that you will be collecting in the form should be stored. Your learning objective for this chapter is to build a function that returns an HTML representation of a journal entry data structure, and render it to the DOM.

## The First Journal Entry Rendered to the DOM

By the end of this chapter - once you have all the functionality written - you will see your journal entry beneath your form.

![](./images/first-journal-entry.png)


## Data Structure for Journal Entries

In the last daily journal chapter, you defined an object data structure for the following four pieces of information that you will collect from the user.

1. Date
1. Concept/Title
1. Journal entry
1. Mood

Since a journal entry is actual thing that you want to track in JavaScript, you need an object. Here's a sample representation.

```js
{
    date: "07/24/2018",
    concept: "Array methods",
    entry: "We learned about 4 different array methods today. forEach made sense, but the others still confuse me.",
    mood: "Ok"
}
```

## Defining Journal Entries

Combining the definition of the daily journal objects, and the daily journal collection. Open `journal.js` and define your journal entry objects by inside the journal entries array.

```js
const journalEntries = [
    {
        date: "07/24/2018",
        concept: "Array methods",
        entry: "We learned about 4 different array methods today. forEach made sense, but the others still confuse me.",
        mood: "Ok"
    },
    etc...
]
```

## Journal Entries in the DOM

The last step in this chapter is to take your raw data structures, and create HTML representations of them so they can be added to the DOM.

### Journal Entry Component Function

You've worked on exercises in which you wrote functions that returned HTML components. Now write a function that builds a journal entry HTML string template.

> src/scripts/journal.js

```js
const journalEntries = [
    {
        concept: "Array methods",
        date: "07/24/2018",
        entry: "We learned about array methods, but only forEach made sense",
        mood: "Ok"
    }
]

/*
    Purpose: To create, and return, a string template that
    represents a single journal entry object as HTML

    Arguments: journalEntry (object)
*/
const makeJournalEntryComponent = (journalEntry) => {
    // Create your own HTML structure for a journal entry
    return `

    `
}
```

## Render Journal Entries to the DOM

Create a new element in your `index.html` file that will be the container for all of your journal entries. Place it beneath the form component.

> src/index.html

```html
<article class="entryLog">

</article>
```

Now write a function whose reponsibility is to iterate your array of journal entries and add them to the DOM.

> src/scripts/journal.js

```js
/*
    Purpose: To render all journal entries to the DOM

    Arguments: entries (array of objects)
*/
const renderJournalEntries = (entries) => {

}

// Invoke the render function
renderJournalEntries(journalEntries)
```

