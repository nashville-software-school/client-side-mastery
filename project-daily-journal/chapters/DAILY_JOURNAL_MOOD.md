# Related Data in Daily Journal

> **Task**: Normalize your API so that moods are their own collection, and the primary key is stored as a foreign key in each item in the `entries` collection.

Until now, you've been storing each entry's mood as a direct property of the entry.

```json
{
  "entries": [
    {
      "id": 18,
      "concept": "Array methods",
      "date": "07/24/2018",
      "entry": "We learned about array methods, but only forEach made sense",
      "mood": "ok"
    }
  ]
}
```

In this chapter, you need to make a collection of moods in your `notes.json` file. You choose how many mood objects you want to be available to your application.

```json
"moods": [
    {
        "id": 1,
        "label": "Ok"
    },
    {
        "id": 2,
        "label": "Verklempt"
    }
]
```

Then change all of your entries to store the proper foreign key for its mood. Change the key name to `moodId` and then change the string to the appropriate `id` of the mood in the `moods` collection. Here's what the entry above should look like after it is modified.

```json
{
  "entries": [
    {
      "id": 18,
      "concept": "Array methods",
      "date": "07/24/2018",
      "entry": "We learned about array methods, but only forEach made sense",
      "moodId": 1
    }
  ]
}
```

### Traversing the Relationship

Once this change to your database structure has been made, it has a destructive effect on your code. You need to refactor your code that interacts with your API and use the [`_expand` query string parameter available in json-server](https://github.com/typicode/json-server#relationships) when you query for your journal entries. This will cause the related mood to be a child resource embedded in the journal entry's JSON representation.

http://localhost:8088/entries?_expand=mood


```json
{
    "id": 18,
    "concept": "Array methods",
    "date": "07/24/2018",
    "entry": "We learned about array methods, but only forEach made sense",
    "moodId": 1,
    "mood": {
        "id": 1,
        "label": "Ok"
    }
}
```

This is a new data structure, so you must now refactor your JavaScript code that built the HTML representation of a journal entry to use the new structure. Instead of using, for example, `${ entryObject.mood }` in your HTML converter component, you would need to use `${ entryObject.mood.label }`.

## Populating the Mood Choice

The last thing to refactor is the `<select>` element that holds all of the `<option>` elements for your moods. Right now, you likely have those hard-coded into your HTML form. You now need to query all of those moods from your API with a new `fetch()` method and then dynamically build a new `<option>` for each of the moods.

This requires you to get the mood state from the API.

Then, in the form component, you need to use the `map()` array function to convert each object in the mood array to an `<option>` HTML element.

```js
${
    allMoods.map(
        (mood) => {
            return `<option value="${ mood.id }">${ mood.label }</option>`
        }
    ).join("")
}
```
