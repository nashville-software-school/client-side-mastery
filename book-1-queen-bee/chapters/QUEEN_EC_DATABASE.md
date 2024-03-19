# Database Challenge

The data in the **Her Majesty** project is currently two separate arrays.

```js
const queens = []
const tributeChest = []
```

In future books, you will be working with a single data structure that will contain **all** data instead of each collection being a discrete array. In this Explorer chapter, you are going to try to work with your first database object that contains multiple sets of data.

In your data module, put the following code and then see if you can modify the rest of your project to work with this new, singular database object instead of two separate ones.

```js
// At the top of the module
const database = {
    queens: [],
    tributeChest: []
}

...

// At the bottom of the module
module.exports = { database }
```
