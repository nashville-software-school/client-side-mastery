# Promises

When you need to ensure that a series of asynchronous operations is performed in a specific order, you need to use promises. Luckily, jQuery provides support for promise syntax on `$.ajax()` operations.

```js
// First, create a new food in the API. The ajax() method is a promise
// so we can chain a .then() method after it
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
// After the resource is created, then modify it
.then(newFood => {
    return $.ajax({
        url: `http://localhost:8088/food/${newFood.id}`,
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
})
// After the resource has been updated, get a list of all foods
.then(updatedFood => {
    console.log(updatedFood)
    return $.ajax("http://localhost:8088/food")
})
// After all foods have been returned, then display them in the console
.then(response => {
    console.log(response)
})
```

## Videos to Watch

1. NSS Learning Team video for [using Promises to asynchronously load images](https://www.youtube.com/watch?v=ieS07COyZZU&list=PLX0ucpUE_qIOUsxGNEPpP9yonb4zerVIC&index=7)
