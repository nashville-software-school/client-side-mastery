# Related Data in Daily Journal

> **Task**: Normalize API so that moods are their own collection, and the PK is stored as a FK in each item in the `entries` collection.

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
