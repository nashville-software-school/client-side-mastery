# Kandy Korner Employees

Create a form for hiring employees. You must be able to choose a location when filling out the form. An employee should have the following information provided.

* Name (string)
* Location (foreign key)
* Start date (date)
* Pay rate per hour (number)

This will require two POST requests.

1. Create an object in `users`
1. Creat an object in `employees` with a `userId` that you captured from the response in the previous step

When the saving process is complete, redirect the user to the `/employee` route to see a list of all employees.

Make sure that each employee HTML representation displays the name of the location in which she works instead of the foreign key. Use the `_expand` query string parameter to include the employee's full location object.