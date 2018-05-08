# API: The Next Level of Peristent Storage

Up to this point, you've been using local storage to persist data. However, local storage is usually used to store very small chinks of data about a user of your website to make their experience better.

1. User preferences
1. Items in their shopping cart
1. Deals the signed up for
1. Notification settings

A database is a separate project that is developed, managed and maintained by a (sometimes different) in a software organization. In this chapter, you are going to use a tool called `json-server` to store your application's data in JSON format on your file system instead of on the browser.

Visit the Github [repo for json-server](https://github.com/typicode/json-server) if you want to learn more details.

## Setup

### Install JSON Server

```sh
npm install -g json-server
```

### Create the API

You are going to create an API that you will use to store and retrieve information your favorite foods.

```sh
mkdir -p ~/workspace/javascript/exercises/api-intro
cd $_
touch routes.json database.json
```

Add the following configuration object to `routes.json`.

```json
{
    "/api/*": "/$1",
    "/food/:type": "/food?type=:type",
    "/food/:ethnicity": "/food?ethnicity=:ethnicity"
}
```

That file defines the URLs and query string parameters that you can use to interact with your API (_more on this later_).

Next, pre-populate your API with some of your favorite foods. Each object should have the following keys.

1. Name (_string_)
1. Type (_string_)
1. Ethnicity (_string_)
1. Side dishes (_array_)

> Example data in `database.json`

```json
{
    "food": [
    {
        "id": "75771e6d-5a80-420a-82a8-94ecbdd863b2",
        "name": "Linguine with bolognese",
        "type": "pasta",
        "ethnicity": "italian",
        "sideDishes": [ "asparagus", "squash" ]
    },
    {
        "id": "18211431-2698-4376-a4a3-77b7c183f208",
        "name": "Massaman curry",
        "type": "curry",
        "ethnicity": "thai",
        "sideDishes": [ "tom ka kai", "curry puffs" ]
    },
    {
        "id": "265c6032-8712-425d-b795-aa5416b54118",
        "name": "Green curry",
        "type": "curry",
        "ethnicity": "thai",
        "sideDishes": [ "Chicken satee", "Samosa" ]
    }
    ]
}
```

Now that the routes are configured and you have some data, you can start your API with the following command.

```sh
json-server -p 8088 -r routes.json -w database.json
```

Go to Chrome and go to the following URL.

[http://localhost:8088/food](http://localhost:8088/food)

You will see a JSON representation of all of your favorite foods.

## Filtering Data

Now filter the food to only show Italian dishes

[http://localhost:8088/food?ethnicity=italian](http://localhost:8088/food?ethnicity=italian)

Or curry dishes.

[http://localhost:8088/food?type=curry](http://localhost:8088/food?type=curry)

## AJAX and your API

### GET

```js
// Query and then display all food
$.ajax("http://localhost:8088/food").then(allFood => console.log(allFood))
```

### POST

```js
// Create a food then display the new food
$.ajax({
    url: "http://localhost:8088/food",
    method: "POST",
    data: {
        "name": "Red curry",
        "type": "curry",
        "ethnicity": "thai",
        "sideDishes": [
            "Chicken satee",
            "Samosa"
        ]
    }
})
.then(newFood => console.log(newFood))
```

### PUT

```js
// Update an existing food, then display the modified version
$.ajax({
    url: "http://localhost:8088/food/5",
    method: "PUT",
    data: {
        "name": "Yellow curry",
        "type": "curry",
        "ethnicity": "thai",
        "sideDishes": [
            "Noodles",
            "Oranges"
        ]
    }
})
.then(updatedFood => console.log(updatedFood))
```

### DELETE

```js
// Delete an existing food
$.ajax({
    url: "http://localhost:8088/food/5",
    method: "DELETE"
})
```

## Practice: CRUD App for a Hipster Business

Your instructor will lead you through the process of building a modular application with Browserify that will use your external API to query and manage the data your business.
