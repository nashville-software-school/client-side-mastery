# Ch 6: JSON-Server

Sometimes we need data from multiple resources when making a GET requests to an API. Time to build on using `json-server` features to include more data... and sort it.

## Related Resources and Sorting

Time to update the fetch call for animals again. Up to this point, you have included the related location for the animal. Now you are going to include the related customer, **and** you are going to sort the animals by location.

This requires three query string parameters

1. `_expand=customer` - Include related customer
1. `_expand=location` - Include related location
1. `_sort=location.id` - Sort data by the employee id

```js
const getAnimals = () => {
    return fetch("http://localhost:8088/animals?_expand=customer&_expand=location&_sort=location.id")
        .then(res => res.json())
        .then(setAnimals)
}
```

This will result in an array of objects that looks like this. Both the customer and location related resources were embedded in the response from the API.

```json
[
    {
        "id": 1,
        "name": "Doodles",
        "breed": "German Shepherd",
        "employeeId": 2,
        "locationId": 1,
        "customer": {
            "id": 2,
            "name": "Jordan Nelson",
            "address": "84 Wallabee Ave"
        },
        "location": {
            "id": 1,
            "name": "Nashville North",
            "address": "8422 Johnson Pike"
        }
    }
]
```
Looking to trouble shoot your API call.  Try adding coping and pasting into your browser.  
`http://localhost:8088/animals?_expand=customer&_expand=location&_sort=location.id`

What do you see?  

If you would like a single animal, add the `id` to the url.  It will look something like `http://localhost:8088/animals/4?_expand=customer&_expand=location&_sort=location.id` for the animal with and id of 4.


[Return  to Book 6's Table of Contents](../README.md) 

[Ch 7: Navigation Bar with Routing](./REACT_ROUTING.md)

