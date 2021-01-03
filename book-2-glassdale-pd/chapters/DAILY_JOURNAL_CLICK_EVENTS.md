# Daily Journal

## Collecting User Input
So far, you've build a form in your journal that doesn't do anything. You've also built a function that prints an array of journal objects to the DOM. Now it's time to put the two together.

In your Daily Journal form, add an event listener to the submit/ save button. The callback function for your event listener should do the following things: 
1. Capture the values the user entered into your form fields.
2. Once you have the values of the text inputs in your JavaScript, build them into an object that looks like this:

```js
{
    date: dateValue,
    concept: conceptValue,
    entry: entryValue,
    mood: moodValue
}
```
3. Once you've build the object representing a single jouranl entry, use the `.push()` method to add it to your array of journal entries. 
4. If you already have a function that prints the entire array of object to the DOM, call it inside your submit button event listener to reprint all of your journal entries. If you don't, revisit [Daily Journal - Part 3](./chapters/DAILY_JOURNAL_DATA_DOM.md)
