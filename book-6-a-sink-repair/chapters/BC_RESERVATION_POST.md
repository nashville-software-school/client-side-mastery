# Reserving a Clown

## Setup

1. Create a directory structure that matches the Sink Repair service.
1. Create a `database.json` file in your `api` directory, and establish all of the resources needed as properties of the main object. Default value for each one should be an empty array.
1. Refer back to chapter 4 to get the command for starting `json-server` and ensure that you set up the structure correctly.

## User Input

Build the HTML that contains input fields for all of the information that needs to be collected for a person to reserve a clown for a birthday party. Keep referring back to your ERD to make sure you have an input field for each property.

Next, create a function in the data access module that will POST a reservation state object to your API to be saved in permanent storage.

Then create the event listener that collects the user input, constructs a state object for the reservation, and then pass it to your function that you defined above as an argument. Verify that it works by looking in your `database.json` file as see if a new object is in your reservations resource collection.
