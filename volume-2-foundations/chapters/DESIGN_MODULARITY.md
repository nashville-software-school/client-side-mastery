# Introduction to Modularity

Modularity is the root concept behind all modern development. It's the practical application of the DRY principle. Keeping your code DRY is easy when you modularize it. It also makes a large code base easily manageable for a team of developers.

## Splitting JavaScript into Different Files

Up to this point in the course, you've had a single JavaScript file for each of the exercises you've worked on. The first step in modularity is to start making different JavaScript files that contain code for a specific domain of the application. 

For example, you may have code for building your database and getting information out of it, as well as code that deals with making your data available in the DOM for human beings to consume. To modularize this code, you take all code that deals with the database and put it in one file, and the DOM manipulation code in a different one.

> database.js

```js
const FlowerDatabase = [
    {
      "id": 1,
      "commonName": "Rose",
      "species": ["Hulthemia", "Hesperrhodos", "Platyrhodon", "Gymnocarpae"]
    },
    {
      "id": 2,
      "commonName": "Daisy",
      "species": ["Aster breweri", "Aster chezuensis", "Aster protoflorian", "Gymnocarpae"]
    }
];

const getFlower = function (id) {
    return FlowerDatabase.filter((flower) => flower.id === id)
}
```

> domHandler.js

```js
// Use a method defined in a different JavaScript module
const flower = getFlower(1)

// Update the DOM
document.getElementById("currentFlower").innerHTML = `${flower.commonName}`;
```

## Splitting CSS into Different Files

> layout.css

> navigation.css

> home.css

