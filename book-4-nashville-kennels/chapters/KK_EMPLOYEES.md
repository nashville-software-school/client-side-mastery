# Kandy Korner Employees

Create a form for hiring employees. You must be able to choose a location when filling out the form. An employee should have the following information provided.

* Name (string)
* Location (foreign key)
* Manager (boolean)
* Full time (boolean)
* Hourly rate (number)

Once the user fills out the form, a new employee object representation should be created, then use `fetch` to POST that object to your database. When the saving process is complete, redirect the user to the `/employee` route to see a list of all employees.

Make sure that each employee HTML representation displays the name of the location in which she works instead of the foreign key.

> **Challenge:** Can you use the `_expand` query string parameter to include the employee's full location object?