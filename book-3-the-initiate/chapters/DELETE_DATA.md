# Deleting Raw Data in an API

You have implemented the POST HTTP verb in order to create a new object in your API. Next is learning to use the DELETE verb to remove an object from your API.

## Learning Objectives

By the end of this chapter, you will have been shown the following techniques.

1. How to add a button in the DOM whose purpose it to initiate a DELETE operation for a particular resource.
1. How to dynamically add the unique identifier for a resource to the `id` attribute of the button responsible for deleting it.
1. How to listen for the click event on that button.
1. Determine which resource should be deleted by using the `split()` method on a string.
1. Perform a DELETE operation with the JavaScript Fetch API.
1. Ensure that the DELETE operation is complete, and then display all resources again.


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