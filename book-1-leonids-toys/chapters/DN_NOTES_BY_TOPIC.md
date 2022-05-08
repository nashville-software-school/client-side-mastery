# Notes by Topic

A common task that software developers need to do is filter data by some criteria. You may have an array filled with thousands of objects, but you want to display a subset of those objects to your customers.

1. Products below a price
1. Houses in a zip code
1. Patients with a specific ailment
1. Equipment in a particular category

You need to examine every object in the array _(by iterating the array)_ and determine, for each one, if that object passes the condition _(with an `if` statement)_.

## Instructions

Your task in this chapter is to filter all of the notes to find only the ones that have a specific topic assigned to it. For example, look at the following 4 notes.

```js
[
    {
        id: 1,
        topics: [ "strategy", "professional", "help" ],
        text: "Review all my old code before asking for help or looking at hints.",
        author: "Samantha Maas",
        date: "2020-11-09"
    },
    {
        id: 2,
        topics: [ "thinking", "help" ],
        text: "I have found that slowing down and thinking about the problem, and writing out the comments makes it vastly easier to write code.",
        author: "Gib Jeffries",
        date: "2021-01-18"
    },
    {
        id: 3,
        topics: [ "reminder", "github" ],
        text: "Need to have all my code backed up to Github by the end of the week.",
        author: "Rebecca Parker",
        date: "2021-02-25"
    },
    {
        id: 4,
        topics: [ "strategy", "github" ],
        text: "Always work on a branch and submit a PR, even if I'm working on my own project.",
        author: "Red Tilson",
        date: "2020-11-25"
    }
]
```

If you wanted to see notes about `github`, you want a new array containing only objects 3 and 4.

If you wanted to see notes about `strategy`, you want a new array containing only objects 1 and 4.

If you wanted to see notes about `help`, you want a new array containing only objects 2 and 1.

If you wanted to see notes about `thinking`, you want a new array containing only object 2.

With your current understanding of JavaScript, here is a strategy you can follow.

1. Create a new variable called `filteredNotes` with an empty array as its initial value.
1. Create a new variable called `criteria` the contains a string of the topic by which you want to filter the notes.

```js
const filteredNotes = []
const criteria = "put whatever topic you want here"
```

Then you iterate the notes array and check if the criteria is in the `topics` array property. You can use the `.includes()` method that you used in a previous exercise _(professionals go back to old code for review and do not rely on memory)_. If the array does contain the criteria, add the current object to the `filteredNotes` array.

After you are done iterating, use `console.log()` to output the new array containing the notes you found.

### Run Your Code

In your terminal, run your code with the following command.

```sh
node main.js
```

When you run the code, it should display the following.

```js
*** Notes with the github topic ***
[
    {
        id: 3,
        topics: [ "reminder", "github" ],
        text: "Need to have all my code backed up to Github by the end of the week.",
        author: "Rebecca Parker",
        date: "2021-02-25"
    },
    {
        id: 4,
        topics: [ "strategy", "github" ],
        text: "Always work on a branch and submit a PR, even if I'm working on my own project.",
        author: "Red Tilson",
        date: "2020-11-25"
    }
]
```

## Hint

Remember, use all the other resources at your disposal before looking at hints. Start thinking like a professional now and become an efficient learner, not a lazy one.

<details>
    <summary>Condition for criteria</summary>

```js
if (note.topics.includes(criteria)) {

}
```
</details>
