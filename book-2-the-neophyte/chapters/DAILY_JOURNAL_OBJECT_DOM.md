# Daily Journal

You have built your form for entering in journal entries, so now you need to define how the data that you will be collecting in the form should be stored. Your learning objective for this chapter is to build a data structure to represent a journal entry, and then define the data structure for storing a collection of entries.

## Setup
1. Navigate into `scripts` sub-directory that you created when you setup your project directory.
1. Use `touch` to create a new file named `journal.js`
1. Update your `index.html` file to have a `<script>` element that includes your new JavaScript file.

## Single Journal Entry

You defined form fields for the following bits of data to collect from a user of your application.

1. Date of the journal entry.
1. Concepts covered (which will be the title of the entry).
1. The long-form contents of the journal entry.
1. The mood of the journal entry.

In your JavaScript file, define an object that will represent a journal entry in your code.

```js
/*
    Define the keys and value for a JavaScript object that
    represents a journal entry about what you learned today
*/
const journalEntry = {

}
```

## Journal Entry Collection

Eventually, you will have multiple journal entries, so you need to define an appropriately named variable that will have the value of an array.

Once you define that variable and give it a default value of a blank array, use the `push()` method to add the `journalEntry` object you defined above to the array.

## More Journal Entries

Take a few minutes and define two or three more JavaScript objects to represent journal entries for some other things that you have learned about so far at NSS.

Add those new objects to your journal entries array.

## Talk to your Instructors

Once you are done with this chapter, we strongly suggest that you meet with one of your instructors to verify that you've got the concepts down, and have the correct syntax for defining these data structures. Not understanding these foundational data structures will have an impact on your future understanding, so you'll want to discuss them now.
