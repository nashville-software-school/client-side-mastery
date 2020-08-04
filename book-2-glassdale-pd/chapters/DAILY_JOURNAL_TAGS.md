# Daily Journal Tags

In this chapter, your goal is to have a collection of tags that can be applied to any of your journal entries. What this requires is a join table in your `database.json`. Consider that you have a tag of `array-methods` and a tag of `api`.

Each of those tags could be applied to multiple entries in your journal.

Each of your journal entries can have multiple tags applied to it.

This is a many-to-many relationship.

This is the last feature of Daily Journal, so you are going to be tasked with implementing this feature on your own with no starter code.

## Data Structures

Make the following changes to you `database.json` file.

1. Add a `tags` collection in your `database.json` file. Here's an example.
    ```js
    "tags": [
        {
            "id": 1,
            "subject": "API"
        }
        {
            "id": 2,
            "subject": "components"
        }
        {
            "id": 3,
            "subject": "fetch"
        }
    ]
    ```
1. Add an `entriestags` collection to store the many-to-many relationship. Here's an example. Journal entry with an `id` of 4 has tags 2 and 3 added to it. Journal entry with an `id` of 9, has tags 1 and 2 added to it.
    ```js
    "entriestags": [
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
1. Add an input field in your journal form where you can enter a list of tags, separated by commas - "API, components,providers".
1. When the save button is clicked, split the string on the comma to produce an array of tag strings - `["API", "components", "provider"]`.
1. For each tag, check if there is already a tag object in your database with that subject.
    1. If there isn't, use a POST operation to create one. Capture the `id` of the newly created tag.
    1. If there is, get its `id`.
1. Create your journal entry and capture the `id` of it once it is created.
1. For each tag that was applied, create an entry in the `entriestags` collection. For this example, there would be three POST operations.
    1. Entry id and "API" tag id
    1. Entry id and "components" tag id
    1. Entry id and "providers" tag id