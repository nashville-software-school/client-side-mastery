# Joining Data in Separate Objects

## Reduce Storage with Normalization

Database normalization, or simply normalization, is the process of organizing the columns (attributes) and tables (relations) of a relational database to reduce data redundancy and improve data integrity. Normalization is also the process of simplifying the design of a database so that it achieves the optimal structure.

## Data Relationships

When you normalize your database, you end up with multiple collections of data. Let's look at an example.

```js
/*
    This database is not normalized. Notice how the strings "Candy" and "Electronics"
    are duplicated several times. Storing the data like this has two ramifications.

    1. More storage space is needed.
    2. Updating the data is an "expensive operation", because the entire array has
       to be iterated, and each item has to be updated correctly.
*/
const Database = {
    "products": [
        {
            "id": 1,
            "name": "Lollipop",
            "type": "Candy"
        },
        {
            "id": 2,
            "name": "iPad",
            "type": "Electronics"
        },
        {
            "id": 3,
            "name": "Snickers",
            "type": "Candy"
        },
        {
            "id": 4,
            "name": "Baby Ruth",
            "type": "Candy"
        },
        {
            "id": 5,
            "name": "Xbox One",
            "type": "Electronics"
        }
    ]
}
```

### One to Many

The first step towards normalization is to find strings that are repeated many times in the source data, and putting those strings into their own collection. In the example below, "Candy" and "Electronics" are now stored once, and have a unique, numeric identifier. The number 2 takes up far less storage space than the string "Electronics".

Then, I use that unique identifier in place of the string in the `products` data set.

In this, more normalized, database, if I want to change the name of the type for candies to "Confectionary", then I only need to update it in **one place** in the database, instead of iterating over each item, determining if the current value is "Candy" and then changing it to "Confectionary".

```js
const Database = {
    "productTypes": [
        {
            "id": 1,
            "name": "Candy"
        },
        {
            "id": 2,
            "name": "Electronics"
        }
    ],
    "products": [
        {
            "id": 1,
            "name": "Lollipop",
            "productType": 1
        },
        {
            "id": 1,
            "name": "iPad",
            "productType":2
        },
        {
            "id": 1,
            "name": "Snickers",
            "productType": 1
        },
        {
            "id": 1,
            "name": "Baby Ruth",
            "productType": 1
        },
        {
            "id": 1,
            "name": "Xbox One",
            "productType":2
        },
    ]
}
```

### Many to Many

