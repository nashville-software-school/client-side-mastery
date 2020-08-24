# Daily Journal Tags

In this chapter, your goal is to have a collection of tags that can be applied to any of your journal entries. What this requires is a join table in your `database.json`. Consider that you have a tag of `array-methods` and a tag of `api`.

Each of those tags could be applied to multiple entries in your journal.

Each of your journal entries can have multiple tags applied to it.

This is a many-to-many relationship.

This is the last feature of Daily Journal, so you are going to be tasked with implementing this feature with minimal helper code shown at the end of the chapter.

## Goal

Implementing tagging is a deep rabbit hole, so we want to set expectations of what you need to focus on for this chapter.

When you save a new journal entry, the tags should be created and applied in the database. Then, when you refresh the browser, you should have the tags displayed on the new journal entry.

Things we **do not** expect you to implement:

1. Tags showing up immediately when list re-renders. Only looking for them to appear on refresh.
1. Deleting related tags when you delete a journal entry.
1. Updating the tags when you edit an entry.

All three of those features are very challenging and lead down a path to using [Promise.all()](https://www.youtube.com/watch?v=SyL1thdXmlE) which is not part of your base learning experience. If you are curious about it, then by all means you should expand your learning and try it out, but it is advanced, so be prepared for lots of fails before success.

## Data Structures

Make the following changes to you `database.json` file.

1. Add a `tags` collection in your `database.json` file. Here's an example.
    ```js
    "tags": [
        {
            "id": 1,
            "subject": "API"
        },
        {
            "id": 2,
            "subject": "components"
        },
        {
            "id": 3,
            "subject": "fetch"
        }
    ]
    ```
1. Add an `entrytags` collection to store the many-to-many relationship. Here's an example. Journal entry with an `id` of 4 has tags 2 and 3 added to it. Journal entry with an `id` of 9, has tags 1 and 2 added to it.
    ```js
    "entrytags": [
        {
            "id": 1,
            "entryId": 4,
            "tagId": 2
        },
        {
            "id": 2,
            "entryId": 4,
            "tagId": 3
        },
        {
            "id": 2,
            "entryId": 9,
            "tagId": 1
        },
        {
            "id": 2,
            "entryId": 9,
            "tagId": 2
        }
    ]
    ```
1. Add an input field in your journal form where you can enter a list of tags, separated by commas - "API,components,providers".
1. When the save button is clicked, split the string on the comma to produce an array of tag strings - `["API", "components", "providers"]`.
1. For each tag, check if there is already a tag object in your database with that subject.
    1. If there isn't, use a POST operation to create one. Capture the `id` of the newly created tag.
    1. If there is, get its `id`.
1. Create your journal entry and capture the `id` of it once it is created.
1. For each tag that was applied, create an entry in the `entrytags` collection. For this example, there would be three POST operations.
    1. Entry id and "API" tag id
    1. Entry id and "components" tag id
    1. Entry id and "providers" tag id

## Helpful Hints

Since this is the last feature to be implemented, and it is highly challenging, here are some helpful snippets to nudge you along.

### Saving Tags to Entries

Here's some sample logic for adding tags to entries.

```js
findTag(tag)  // tag variable will have a string value
    .then(matches => {  // `matches` variable value will be array of matching objects
        let matchingTag = null

        if (matches.length > 0) {
            matchingTag = matches[0].id
        }

        if (matchingTag === null) {
            // Tag doesn't exist. Create it then assign it to entry.
            saveTag(tag)
                .then(new_tag => {
                    saveEntryTag(entry.id, new_tag.id)
                })
        }
        else {
            // Tag does exist. Assign it to entry.
            saveEntryTag(entry.id, matchingTag)
        }
    })
```

In your **`TagProvider`**, define a `findTag()` function. Notice the query string parameter of `?subject=${subject}`. This is a search feature of json-server.

> "Get all of the tag objects whose subject property equals this value."

```js
export const findTag = (subject) => {
    return fetch(`${settings.apiURL}/tags?subject=${subject}`)
        .then(response => response.json())
}
```