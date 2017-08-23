# Joining Data in Separate Objects

## Reduce Storage with Normalization

Database normalization, or simply normalization, is the process of organizing the columns (attributes) and tables (relations) of a relational database to reduce data redundancy and improve data integrity. Normalization is also the process of simplifying the design of a database so that it achieves the optimal structure.

## Data Relationships

When you normalize your database, you end up with multiple collections of data. Let's look at an example.

```js
const Database = {
    "products": [
        {
            "id": 1,
            "name": "Lollipop",
            "type": "Candy"
        },
        {
            "id": 1,
            "name": "iPad",
            "type": "Electronics"
        },
        {
            "id": 1,
            "name": "Snickers",
            "type": "Candy"
        },
        {
            "id": 1,
            "name": "Baby Ruth",
            "type": "Candy"
        },
        {
            "id": 1,
            "name": "Xbox One",
            "type": "Electronics"
        }
    ]
}
```

### One to Many


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


