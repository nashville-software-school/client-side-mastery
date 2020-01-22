# Adding Animals

## Goal

In this chapter, you are going to write a component whose reposibility to is allow a customer to admit their animal to one of the Nashville Kennel locations.


1. Create an **`AnimalForm`** component.
1. Create a route for `/animals/create` that renders **`AnimalForm`**.
1. Allow customer to enter the animal's name and choose a location from a dropdown.
1. When user saves the animal, create a new animal object and save it to the API. Make sure that the animal object has the `customerId` and  `locationId` foreign keys on it.
1. Once the animal is saved, re-route the user to the list of animals.