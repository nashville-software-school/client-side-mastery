# Deleting Raw Data in an API

## Delete Syntax

```js
fetch(`http://localhost:8088/resource/${id}`, {
    method: "DELETE",
    headers: {
        "Content-Type": "application/json"
    }
})
.then(res => res.json())
```


## Delete DOM Elements Option

Delete request, then remove DOM element on success to eliminate possibly excessive call to API to retrieve all items again.


## Delete and Get All Option