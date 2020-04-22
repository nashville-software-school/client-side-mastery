# Adding Animals

## Goal

In this chapter, you are going to write a component whose reposibility to is allow a customer to admit their animal to one of the Nashville Kennel locations.

1. Create an **`AnimalForm`** component.
1. Add a button to the animal list labeled, "Make Appointment".
1. When the button is clicked, show the animal form in a modal which allows the customer to enter the animal's name and choose a location from a dropdown.
1. When user saves the animal, create a new animal object and save it to the API. Make sure that the animal object has the `customerId` and  `locationId` foreign keys on it.
1. Once the animal is saved, make sure the modal closes.