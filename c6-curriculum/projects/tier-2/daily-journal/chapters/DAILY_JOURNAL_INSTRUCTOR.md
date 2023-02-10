# Daily Journal Tags

For this feature, you will provide an affordance that allows the user to select the instructor that either reviewed the concept, or coached you on it individually.

## Steps

1. Add an `instructors` resource collection in your API.
1. Add an object representing each of the three members of your instruction team.
    ```json
    {
        "id": 1,
        "first_name": "Greg",
        "last_name": "Korte"
    }
    ```
1. Refactor your entry form to include a `<select>` HTML component containing an `<option>` for each instructor.
1. Refactor your method for saving an entry to include a foreign key on your entry object to the chosen intructor.
