# Related Data in Daily Journal

> **Task**: Normalize API so that moods are their own collection, and the PK is stored as a FK in each item in the `entries` collection.

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

In this chapter, you need to make a collection of moods.

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

This is a new data structure, so you must now refactor your JavaScript code that built the HTML representation of a journal entry to use the new structure.

## Populating the Mood Choice

The last thing to refactor is the `<select>` element that holds all of the `<option>` elements for your moods. Right now, you likely have those hard-coded into your HTML form. You now need to query all of those moods from your API with a new `fetch()` method and then dynamically build a new `<option>` for each of the moods.

## Challenge: Delivery

> **Note**: Remember, challenges should only be attempted once you have completed the main exercise(s) and understand the concept.

1. Add an `instructors` resource collection in your API.
1. Add an object representing each of the three members of your instruction team.
    ```json
    {
        "id": 1,
        "firstName": "Greg",
        "lastName": "Korte"
    }
    ```
1. Refactor your entry form to include a `<select>` HTML component containing an `<option>` for each instructor.
1. Refactor your method for saving an entry to include a foreign key on your entry object to the chosen intructor.

## Advanced Challenge

> As always, advanced challenges are completely optional. You should only attempt this challenge if you have understood everything covered so far. Otherwise, skip it.

1. Add a `tags` collection
1. Add an `entriestags` collection to store the many-to-many relationship.
1. Apply tags as a comma separated string in an input field.
