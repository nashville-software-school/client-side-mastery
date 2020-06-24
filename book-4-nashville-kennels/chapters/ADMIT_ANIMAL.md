# Adding Animals

## Goal

In this chapter, you are going to write a component whose responsibility to is allow a customer to admit their animal to one of the Nashville Kennel locations.

Refer back to the [Hiring Employees](./FORMS_USEREF.md) chapter to review how to make a form in React.

1. Create an **`AnimalForm`** component.
1. Create a route in **`ApplicationViews`** for `/animals/create` that renders **`AnimalForm`**.
1. Add a button to the animal list labeled, "Make Appointment".
1. When the button is clicked, show the animal form by using `props.history.push()` to change the route.
1. User will see the form and can now enter the animal's name and choose a location from a dropdown.
1. When user saves the animal, create a new animal object and save it to the API. Make sure that the animal object has the `customerId` and  `locationId` foreign keys on it.
1. Once the animal is saved, re-route the user to the list of animals.