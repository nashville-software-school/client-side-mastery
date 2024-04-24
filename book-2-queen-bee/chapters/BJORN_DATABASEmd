# Database Challenge

The data in the **Björn Wilderness Adventures** project is currently in their own discrete, separate arrays.

```js
const trails = [{
    "id": 1,
    "price": "$$",
    "latitude": 8.99214,
    "longitude": 105.19602,
    "plantHighlight": "Rock Melicgrass",
    "trailName": "Faraway Glades Trail",
    "length": 10.46
},
...
]

const rivers = [{
    "id": 1,
    "price": "$$$$",
    "latitude": 57.6055534,
    "longitude": 12.2028691,
    "uniqueFish": "Hystrix indica",
    "river": "Eleven Point National Scenic River",
    "length": 22
},
...
]
```

In future books, you will be working with a single data structure that will contain **all** data instead of each collection being a discrete array. In this Explorer chapter, you are going to try to work with a single database object that contains multiple sets of data.

Create a module whose sole purpose is to store the data. In your database module, put the following code and then see if you can modify the rest of your project to work with this new, singular database object instead of two separate ones.

```js
// At the top of the module. Move all data into the arrays below.
const database = {
    trails: [],
    rivers: []
}

...

// At the bottom of the module
module.exports = { database }
```
