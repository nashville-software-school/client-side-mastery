# Nashville Kennels API

Before you start building your React application, you need a database to persist the data for it. Please follow these steps to get it set up.

```sh
cd ~/workspace
mkdir kennel-api
cd kennel-api
touch database.json
```

Then copy the following JSON into the `database.json` file.

```json
{
    "animals": [
        {
            "id": 1,
            "name": "Doodles",
            "breed": "Poodle",
            "customerId": 1,
            "locationId": 2
        },
        {
            "id": 2,
            "name": "Barney",
            "breed": "Boxer",
            "customerId": 2,
            "locationId": 1
        }
    ],
    "customers": [
        {
            "id": 1,
            "name": "Hannah Hall",
            "address": "7002 Chestnut Ct"
        },
        {
            "id": 2,
            "name": "Caitlin Stein",
            "address": "4 Killian Trace"
        }
    ],
    "employees": [
        {
            "id": 1,
            "name": "Emma Beaton",
            "address": "54 Sycamore Avenue",
            "locationId": 1
        },
        {
            "id": 2,
            "name": "Michael Conrad",
            "address": "1906 Pelargir Circle",
            "locationId": 2
        }
    ],
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
json-server -p 8088 -w database.json
```