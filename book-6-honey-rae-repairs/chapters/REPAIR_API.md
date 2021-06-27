# Honey Rae's API

Before you start building your React application, you need a database to persist the data for it. Please follow these steps to get it set up.

```sh
cd ~/workspace
mkdir honey-raes-api
cd honey-raes-api
touch database.json
```

Then copy the following JSON into the `database.json` file.

```json
{
    "customers": [
        {
            "id": 1,
            "name": "Lynn Blanda",
            "address": "64162 Lowe Branch"
        },
        {
            "id": 2,
            "name": "Jody Schultz",
            "address": "788 Bailey Point"
        },
        {
            "id": 3,
            "name": "Marco Fritsch",
            "address": "410 Magali Trafficway"
        }
    ],
    "employees": [
        {
            "id": 1,
            "name": "Tom Schamberger",
            "specialty": "iPhone"
        },
        {
            "id": 2,
            "name": "Rose Schmitt",
            "specialty": "Printers"
        }
    ],
    "services": [
        {
            "id": 1,
            "customerId": 1,
            "employeeId": 2,
            "dateCompleted": "2021-05-26"
        }
    ]
}
```

Every time you want to work on your application, you'll need to ensure that the API is running. Open a new terminal and start it.

```sh
json-server -p 8088 database.json
```

Feel free to make more of each resource if you want to see more data in your API.

| | |
|:---:|:---|
| <h1>&#x2757;</h1> |  _The [vscode-faker](https://marketplace.visualstudio.com/items?itemName=deerawan.vscode-faker) extension for Visual Studio Code is a fast, easy way to generate starter data._ |

## Backup to Github

Make sure you create a repository on your Github account for your API, and hook up the `honey-raes-api` directory. Yes, there's only one file being tracked in this repository, and that's ok.
