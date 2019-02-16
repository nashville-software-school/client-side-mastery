# Editing Data

## Edit Syntax

```js
fetch(`http://localhost:8088/resource/${id}`, {
    method: "PUT",
    headers: {
        "Content-Type": "application/json"
    },
    body: JSON.stringify(objectContainingNewProperties)
})
.then(res => res.json())
```

## Edit and Get All