# Adding Employees and Locations

## Goal

In this chapter, you are going to write a component whose responsibility to is create a new employee assigned to a location.

Refer back to the [Adding an Animal](./FORMS_CONTROLLED_COMPONENT.md) chapter to review how to make a form in React.

1. Create an **`EmployeeForm`** component.
1. Create a route in **`ApplicationViews`** for `/employees/create` that renders **`EmployeeForm`**.
1. Add a button to the employee list labeled, "New Employee".
1. When the button is clicked, show the employee form by using `history.push()` to change the route.
1. User will see the form and can now enter the employee's name and choose a location from a dropdown.
1. When user saves the employee, create a new employee object and save it to the API. Make sure that the employee object has the `locationId` foreign key on it.
1. Once the employee is saved, re-route the user to the list of employees.

## New locations
Practice adding new locations. This will follow a similar pattern.