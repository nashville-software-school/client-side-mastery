# Joining Data from Multiple Resources

Sometimes we need data from multiple resources when making a GET requests to an API. Previously you saw how to include location data on the animal data in the response from the API using `_expand=location` as a query string parameter.

Time to build on using `json-server` features to include more data... and sort it.

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

This will result in an array of objects that look like this. Both the customer and location related resources were embedded in the response from the API.

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

