# Daily Journal

The learning objective for this chapter is to be able to search your journal entries using array iteration, and object property iteration.

## Search Input

Add a search input field to the right of your mood buttons. Practice your Flex skills to get them side-by-side, with each component taking up 40% of the width of the page.

## Listening for KeyPress

Attach a `keypress` listener to the input field. When the user presses their return key, get the input field's value and look through each of your journal entries to find any property whose value contains that text. Then emit a message to the EventHub indicating that a the user wants to perform a search. Perhaps name it "searchInitiated", and send the search term as the data.

The **`EntryList`** component will listen for that event and extract the search term from the details.

## Searching All Entries

Consider that you have a collection of objects like the one below in an application you are building for tracking games that people like to play. Each object will have the same keys, but different state.

```js
const games = [
    {
        name: "Battleship",
        manufacturer: "Hasbro",
        minimumPlayers: 2,
        maximumPlayers: 2,
        difficulty: "easy"
    },
    {
        name: "Monopoly",
        manufacturer: "Hasbro",
        minimumPlayers: 2,
        maximumPlayers: 6,
        difficulty: "difficult"
    },
    {
        name: "Ticket to Ride",
        manufacturer: "Days of Wonder",
        minimumPlayers: 2,
        maximumPlayers: 4,
        difficulty: "medium"
    },
    {
        name: "Dixit",
        manufacturer: "Asmodee",
        minimumPlayers: 3,
        maximumPlayers: 6,
        difficulty: "easy"
    }
]
```

Now consider that you want to provide the ability for a user to search for any of the state values of the toy objects. If the user provides the search term of "easy", you want to show a list of all games that are easy, but if the user provides the search term of "Hasbro", you want to have the list show all the Hasbro games.

You can do this by using the `Object.values(yourObject)` method. The `.values()` method will return an array of all values in the object.

```js
for (const game of games) {
    console.log(Object.values(game))
}

> [ 'Hasbro', 'Battleship', 2, 2, 'easy' ]
> [ 'Hasbro', 'Monopoly', 2, 6, 'difficult' ]
> [ 'Days of Wonder', 'Ticket to Ride', 2, 4, 'medium' ]
> [ 'Asmodee', 'Dixit', 3, 6, 'easy' ]
```

Now that you have another array, you need another `for..of` loop inside the original one. To find games that are easy, here's how you would do it.

```js
const searchTerm = "easy"
const matchingGames = []

for (const game of games) {
    for (const value of Object.values(game)) {
        if (value === searchTerm) {
            matchingGames.push(game)
        }
    }
}

```

You will need to follow these steps when the user presses enter in the search box. In the event listener in **`EntryList`**, iterate the entire array of entries, and look at each value on each object and see if the search term is in the value.

Consider using the [`includes()`](https://www.w3schools.com/Jsref/jsref_includes.asp) method on the string values, which will allow you to match substrings.

## Update the DOM

Once you've found matching entries, render only those entries in the DOM.

![searching entries](./images/Jjf9WdimeY.gif)
