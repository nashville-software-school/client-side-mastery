# Listing Employees

In this first chapter, your task is to create a list of employees.

## Practice: Small Business Workforce

> Create a `~/workspace/workforce` directory for this exercise.

A small software consulting business wants to keep track of its employees and the computers that they use. Each employee is assigned a computer when they join the company.

Create an API to be served with `json-server` and create the following resources in your `database.json` file. **Do not** build the arrays of objects in your JavaScript code.

1. Build arrays of objects that represent _Employees_, and _Computers_ in your `database.json` file.
1. Assign every resource a unique `id` property.
1. Assign each employee a computer using a foreign key.

Here's some JSON to get you started. Add at least 4 more computers, and 4 more employees to your database. Assign each employee a different computer.

> #### `workforce/api/database.json`

```json
{
    "computers": [
        {
            "id": 1,
            "model": "Macbook Pro",
            "year": 2015
        }
    ],
    "employees": [
        {
            "id": 1,
            "firstName": "Rainu",
            "lastName": "Ittycheriah",
            "computerId": 1
        }
    ]
}
```

## HTML Representations

1. Create your employee data provider, employee list, and employee components
1. Create your computer data provider
1. Use the employee and computer data in the employee list component to display the employee's name, and age. Also display the model and manufacture year for the computer she is using.

