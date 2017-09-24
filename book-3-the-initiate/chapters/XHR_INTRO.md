# Asynchronous Programming with XHR

```js
let songs = []

function xhrWasSuccessful () {
  // A bit more about what `this` is here. What is the execution context?
  console.log(this.responseText);

  // Parse the text into an array defined in an outer scope
  songs = JSON.parse(this.responseText)
}

function xhrFailed () {
  console.log(this.status, this.responseText);
}

// Create an XHR object
var myRequest = new XMLHttpRequest();

// XHR objects emit events when their operation is complete, or an error occurs
myRequest.addEventListener("load", xhrWasSuccessful);
myRequest.addEventListener("error", xhrFailed);

// Then tell the XHR object exactly what to do
myRequest.open("GET", "songs.json");

// Tell the XHR object to start
myRequest.send();
```

```js
// Contents of songs.json file
{
  "songs": [
    {
      "title": "The Walk",
      "artist": "Mayer Hawthorne",
      "album": "How Do You Do"
    },
    {
      "title": "Medicine",
      "artist": "Grace Potter",
      "album": "Grace Potter and the Nocturnals"
    },
    {
      "title": "Legs",
      "artist": "ZZ Top",
      "album": "Eliminator"
    }
  ]
}
```

## Videos to Watch

1. NSS Learning Team video [JavaScript XHR and Callbacks](https://www.youtube.com/watch?v=2R28EX9QShI&index=6&list=PLX0ucpUE_qIOUsxGNEPpP9yonb4zerVIC) which shows you how to use callback functions, or lambas, to ensure that asynchronous operations execute in the right order.

## Practice

Your job is to build a department store's web page that lists products, the name of the department each one is in, and the price. Additionally, put a `<select>` element at the top of the page that contains all possible values of the `season_discount` key in the categories file. As soon as you select one of the seasons, all prices on the page should immediately be discounted by the corresponding percentage.

For example, when _Spring_ is chosen, all products in the corresponding Household category should have their prices updated with a 15% discount off the base price.

The two JSON representations above should be in two files: `products.json`, and `categories.json`. You should load both files via XHRs and store the contents in two different JavaScript variables in your code.

```js
// Contents of products.json file
{
  "products": [
    {
      "id": 0,
      "name": "Kids socks",
      "price": 4.99,
      "category_id": 1
    },
    {
      "id": 1,
      "name": "Mens socks",
      "price": 6.99,
      "category_id": 1
    },
    {
      "id": 2,
      "name": "Ladies socks",
      "price": 7.99,
      "category_id": 1
    },
    {
      "id": 3,
      "name": "Foot stool",
      "price": 14.99,
      "category_id": 2
    },
    {
      "id": 4,
      "name": "Lava lamp",
      "price": 9.99,
      "category_id": 2
    },
    {
      "id": 5,
      "name": "3 drawer dresser",
      "price": 64.99,
      "category_id": 2
    },
    {
      "id": 6,
      "name": "Air filter",
      "price": 6.99,
      "category_id": 3
    },
    {
      "id": 7,
      "name": "Surge protector",
      "price": 8.99,
      "category_id": 3
    },
    {
      "id": 8,
      "name": "Plastic storage bin",
      "price": 3.99,
      "category_id": 3
    },
    {
      "id": 9,
      "name": "Light bulb",
      "price": 1.99,
      "category_id": 3
    }
  ]
}
```

```js
// Contents of categories.json file
{
  "categories": [
    {
      "id": 1,
      "name": "Apparel",
      "season_discount": "Winter",
      "discount": 0.10
    },
    {
      "id": 2,
      "name": "Furniture",
      "season_discount": "Autumn",
      "discount": 0.25
    },
    {
      "id": 3,
      "name": "Household",
      "season_discount": "Spring",
      "discount": 0.15
    }
  ]
}
```
