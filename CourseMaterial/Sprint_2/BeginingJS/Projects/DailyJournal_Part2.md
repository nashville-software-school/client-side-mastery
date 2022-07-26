# Daily Journal

You have built your form for entering in journal entries, so now you need to define how the data that you will be collecting in the form should be stored. Your learning objective for this chapter is to build a data structure to represent a journal entry, and then define the data structure for storing a collection of entries.

## Setup
1. Navigate into `scripts` sub-directory that you created when you setup your project directory.
1. Use `touch` to create a new JavaScript module named `main.js`.
1. Update your `index.html` file to have a `<script type="module" src="./scripts/main.js>` element that includes your main JavaScript module.

## Single Journal Entry

You defined form fields for the following bits of data to collect from a user of your application.

1. Date of the journal entry.
1. Concepts covered (which will be the title of the entry).
1. The long-form contents of the journal entry.
1. The mood of the journal entry.

In your `main.js` module create an array of objects that represents your journal entries. 

/********Continue From HERE**********/

## More Journal Entries

Take a few minutes and add two or three more JavaScript objects to represent journal entries for some other things that you have learned about so far at NSS.

Make sure you increment the `id` property of each journal entry by 1 each time you add a new object. For example, if you manually create another one right now it should looks like this.

Note the `id` property value is 2.

```js
{
    id: 2,
    date: "07/26/2025",
    concept: "Complex Flexbox",
    entry: "I tried to have an element in my Flexbox layout also be another Flexbox layout. It hurt my brain. I hate Steve.",
    mood: "Sad"
}
```

Add those new objects to your journal entries array. Make sure you separate each object with a comma, and do not put a comma after the last one.

