# Ch 6: JSON-Server

Sometimes we need data from multiple resources when making a GET requests to an API. Time to build on using `json-server` features to include more data... and sort it.

## More functionality from JSON-Server 

Up to now, we've used JavaScript to combine data from two different models and to sort the data we display.  In many systems, this is done on the server-side (back-end), making client-side (front-end) development easier.  Imaging getting the animals in the order you want to display them!    
JSON-Server can do simple expanding and sorting for us.  

This requires three query string parameters.  A query string is defined in a url by adding a `?` at the end of the url followed by the query string. Typically, a query string contains a parameter, the `=` and then a value.  Here's some examples in JSON-server:

1. `_expand=customer` - Include related customer
1. `_expand=location` - Include related location
1. `_sort=location.id` - Sort data by the employee id

Looking to trouble shoot your API call.  Try adding coping and pasting into your browser.  
`http://localhost:8088/animals?_expand=customer&_expand=location`

What do you see?  

If you would like a single animal, add the `id` to the url.  It will look something like `http://localhost:8088/animals/2?_expand=customer&_expand=location` for the animal with and id of 2.

We can also use `_sort` to but the animals in order of location or customer.  Try `http://localhost:8088/animals?_expand=customer&_expand=location&_sort=locationId` in your browser.  What do you notice about the location ids?  

Try changing location to customer.  Now what do you see?


[Return  to Book 6's Table of Contents](../README.md) 

[Ch 7: Navigation Bar with Routing](./REACT_ROUTING.md)

