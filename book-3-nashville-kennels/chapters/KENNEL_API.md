# Nashville Kennels API

Before you start building your React application, you need a database to persist the data for it. Please follow these steps to get it set up.

```sh
cd ~/workspace/kennels
mkdir kennel-api
cd kennel-api
touch database.json
```

Then copy the following JSON into the `database.json` file.

```json
{
    "animals": [
        { "id": 1, "name": "Doodles", "breed": "Poodle"},
        { "id": 2, "name": "Decker", "breed": "German Shepherd" },
        { "id": 3, "name": "Esme", "breed": "Pitbull" }
    ],
    "customers": [
        {
            "id": 1,
            "name": "Hannah Hall",
            "address": "7002 Chestnut Ct"
        }
    ],
    "employees": [],
    "locations": [
        {
            "id": 1,
            "name": "Nashville North",
            "address": "8422 Johnson Pike"
        },
        {
            "id": 2,
            "name": "Nashville South",
            "address": "209 Emory Drive"
        }
    ]
}
```

Every time you want to work on your Nashville Kennels application, you'll need to ensure that the API is running.

```sh
json-server -p 5002 -w database.json
```

Add some example data for employees, locations and owners to kennel-api/database.json.