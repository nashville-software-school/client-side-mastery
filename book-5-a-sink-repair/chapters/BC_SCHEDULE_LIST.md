# Showing Reservations

## Fetch Before Display

You should have created a function in the previous chapter which is responsible for fetching the state of reservations from the API. Update your main module to fetch the data before the HTML is generated and rendered to the browser.

Next, you will need a function to be exported from the data access module which is responsible for returning the application state for reservations. When you have that function written, create a module that will be responsible for generating a list of reservations.

Import the function into that new module and invoke it. Store the returned state into a variable. Then use the `map()` array method to generate the HTML structure needed to display the list of reservations.
