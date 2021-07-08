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
            "name": "Dion Stoade",
            "address": "6866 4th Court",
            "email": "dstoade0@cornell.edu"
        },
        {
            "id": 2,
            "name": "Windy Thorneloe",
            "address": "59924 Beilfuss Center",
            "email": "wthorneloe1@usa.gov"
        },
        {
            "id": 3,
            "name": "Hillie Phillpotts",
            "address": "21 Straubel Point",
            "email": "hphillpotts2@rakuten.co.jp"
        },
        {
            "id": 4,
            "name": "Jobye Danielou",
            "address": "7 Pleasure Terrace",
            "email": "jdanielou3@apple.com"
        },
        {
            "id": 5,
            "name": "Gabbie Schult",
            "address": "46273 Oak Trail",
            "email": "gschult4@tinyurl.com"
        },
        {
            "id": 6,
            "name": "Vasily Youdell",
            "address": "0993 Gulseth Avenue",
            "email": "vyoudell5@globo.com"
        },
        {
            "id": 7,
            "name": "Debra Blackhurst",
            "address": "57305 Crowley Alley",
            "email": "dblackhurst6@last.fm"
        },
        {
            "id": 8,
            "name": "Helenelizabeth Passfield",
            "address": "02 Reinke Plaza",
            "email": "hpassfield7@netvibes.com"
        },
        {
            "id": 9,
            "name": "Franchot Slator",
            "address": "4930 Oneill Drive",
            "email": "fslator8@51.la"
        },
        {
            "id": 10,
            "name": "Renaud Erbe",
            "address": "30 Westridge Pass",
            "email": "rerbe9@psu.edu"
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
    "serviceTickets": [
        {
            "id": 1,
            "customerId": 4,
            "employeeId": 1,
            "description": "iPhone case cracked. Please replace.",
            "emergency": false,
            "dateCompleted": "2021-05-26"
        },
        {
            "id": 2,
            "customerId": 7,
            "employeeId": 4,
            "description": "Cannot connect to any wifi.",
            "emergency": true,
            "dateCompleted": ""
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
