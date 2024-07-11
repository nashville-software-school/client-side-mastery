## Handling Large Customers

In this exercise, you will be implementing a many-to-many relationship. As you gain more customers, you need to start assigning more than one employee to a job. You also find that you need to shift employees from job to job as the complexities change for each one.

One customer can have many employees assigned.

One employee can work for many customers.

This is a many-to-many relationship. This means that you need a join, or intersection, table to handle the relationships between these two resources.

### The Workforce ERD

Update your ERD with the following two tables. Then make sure that the relationship lines are drawn between all the related tables.

```js
Table Customers {
    id int pk
    name varchar
}

Table EmployeeCustomers {
    id int pk
    customerId int
    employeeId int
}
```

Then add two new resources in your `database.json`.

```json
"customers": [
    {
        "id": 1,
        "name": "Juniper Distribution"
    }
],
"employeeCustomers": [
    {
        "id": 1,
        "customerId": 1,
        "employeeId": 2
    }
]
```

Create at least 4 customers. Then assign each employee to 2 customers. In the example above, I am recording the fact that the employee with an `id` of 2 worked for the customer with an `id` of 1.

### HTML Representations

To get all the related data for a single employee, you won't be using the `find()` method like you did for the 1 -> * relationships. You will be using the `filter()` method.

#### Example

Here's some example code _(not complete)_ of how your algorithm might be designed.

```js
const EmployeeList = () => {
    // Get all employees
    const response = await fetch("")
    const employees = await response.json()

    /*
        Get all relationships and _expand the customer

        https://github.com/typicode/json-server/tree/v0.17.4#relationships
    */
    const response = await fetch("")
    const customerRelationships = await response.json()

    const employeesHTML = `
    ${
        employees.map(employee => {
            // Find all the customer relationships for this employee
            const relationships = customerRelationships.filter()

            // Find the related customer for each relationship
            const assignedCustomers = relationships.map(rel => {
                return `customer list item (see below)`
            })
        }).join("")
    }
    `
}
```

The final HTML representation should look like this.

```html
<div class="employee">
    <header class="employee__name">
        <h1>Rainu Ittycheriah</h1>
    </header>
    <section class="employee__department">
        Works in the IT department
    </section>
    <section class="employee__computer">
        Currently using a 2015 MacBook Pro
    </section>
    <section class="employee__location">
        Works at the Memphis office
    </section>
    <section class="employee__customers">
        Has worked for the following customers.
        <ul>
            <li>Juniper Distribution</li>
            <li>Bluelife Health Services</li>
        </ul>
    </section>
</div>
```
