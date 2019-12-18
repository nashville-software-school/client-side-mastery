# Joining Data in Separate Objects

## Why Are You Learning This?

Properly structured and normalized databases can save a development team, and an entire business, hundreds of hours and millions of dollars over a pooly designed one. The database design is, by far, the most important thing to get right in an application because it is also is the hardest to change, and those changes affect everything about the application.

![visualization of database being highest cost of change](./images/cost-of-change.png)

## Visualizing Relationships Between Data Sets

Entity Relationship Diagrams are used to visualize the relationships in a database. As human, we are visual creatures, and the ERD is the only way for us to understand a large, complex database made of thousands, millions, or billions of points of data.

## Reduce Storage with Normalization

Database normalization, or simply normalization, is the process of organizing the columns (attributes) and tables (relations) of a relational database to reduce data redundancy and improve data integrity. Normalization is also the process of simplifying the design of a database so that it achieves the optimal structure.

## Data Relationships

When you normalize your database, you end up with multiple collections of data. Let's look at an example.

```js
/*
    This database is not normalized. Notice how the strings "Candy" and "Electronics"
    are duplicated several times. Storing the data like this has two ramifications.

    1. More storage space is needed.
    2. Updating the data is an "expensive operation", because the entire array has
       to be iterated, and each item has to be updated correctly.
*/
const Database = {
    "products": [
        {
            "id": 1,
            "name": "Lollipop",
            "type": "Candy"
        },
        {
            "id": 2,
            "name": "iPad",
            "type": "Electronics"
        },
        {
            "id": 3,
            "name": "Snickers",
            "type": "Candy"
        },
        {
            "id": 4,
            "name": "Baby Ruth",
            "type": "Candy"
        },
        {
            "id": 5,
            "name": "Xbox One",
            "type": "Electronics"
        }
    ]
}
```

### One to Many

The first step towards normalization is to find strings that are repeated many times in the source data, and putting those strings into their own collection. In the example below, "Candy" and "Electronics" are now stored once, and have a unique, numeric identifier. The number 2 takes up far less storage space than the string "Electronics".

Then, I use that unique identifier in place of the string in the `products` data set.

In this, more normalized, database, if I want to change the name of the type for candies to "Confectionary", then I only need to update it in **one place** in the database, instead of iterating over each item, determining if the current value is "Candy" and then changing it to "Confectionary".

#### Primary Key

The numeric, unique identifier that we create for each object in our database is called the primary key for that object.

#### Foreign Key

The `productType` property on each `product` object is called a foreign key. It is a primary key value, but that primary key was defined on another, foreign table.

![](./images/one-to-many.png)

#### database.json

```json
{
    "productTypes": [
        {
            "id": 1,
            "name": "Candy"
        },
        {
            "id": 2,
            "name": "Electronics"
        }
    ],
    "products": [
        {
            "id": 1,
            "name": "Lollipop",
            "productTypeId": 1
        },
        {
            "id": 2,
            "name": "iPad",
            "productTypeId": 2
        },
        {
            "id": 3,
            "name": "Snickers",
            "productTypeId": 1
        },
        {
            "id": 4,
            "name": "Baby Ruth",
            "productTypeId": 1
        },
        {
            "id": 5,
            "name": "Xbox One",
            "productTypeId": 2
        }
    ]
}
```

### Many to Many

There are times where two sets of data have a more complex relationship than a simple 1 -> &infin;. Let's look at an example of aggregation where the two entities operate independently of each other, but one can contain many of the other.

Imagine you are defining a database for a family's chore list. Here's a list of chores.

1. Paint the garage
1. Take out the trash
1. Do the laundry
1. Clean the bedrooms
1. Family game night
1. Feed the dog

There are many tasks. There are also many family members.

1. Dad
1. Mom
1. Sarah
1. Blake
1. Sophia
1. Michael

Now, some of the tasks are 1-person jobs, like taking out the trash. Other tasks require more than one person, such as family game night, or painting the garage.

Also, each family member will be assigned more than one task. Dad is responsible for doing the laundry, but also for taking part in family game night.

1. A family member can have many chores
1. Each chore can be assigned to many family members

This is a many-to-many relationship. This will require us to have a data set whose purpose is simply to store those relationships. This allows us maximum flexibility because we can assign any number of family members to a task, and assign any number of tasks to a family member.

![many to many relationship ERD with three tables](./images/many-to-many.png)

#### database.json

```json
{
    "familyMembers": [
        {
            "id": 1,
            "name": "Mom"
        },
        {
            "id": 2,
            "name": "Dad"
        },
        {
            "id": 3,
            "name": "Sarah"
        },
        {
            "id": 4,
            "name": "Blake"
        },
        {
            "id": 5,
            "name": "Sophia"
        },
        {
            "id": 6,
            "name": "Michael"
        }
    ],
    "chores": [
        {
            "id": 1,
            "task": "Paint Garage"
        },
        {
            "id": 2,
            "task": "Take out the trash"
        },
        {
            "id": 3,
            "task": "Do the laundry"
        },
        {
            "id": 4,
            "task": "Clean the bedrooms"
        },
        {
            "id": 5,
            "task": "Family game night"
        },
        {
            "id": 6,
            "task": "Feed the dog"
        }
    ]
}
```

The next step is to define an intersection table to store the relationships between family members and chores. In this intersection table definition below, you can see that mom is assigned to two tasks, and dad is also assigned to two tasks.

You can also see that mom and dad are both assigned to the same `taskId` of 5 - which is game night.

You would add the following `familyChores` property to your JSON file.

#### database.json

```json
{
    "familyMembers": [...],
    "chores": [...],
    "familyChores": [
        {
            "id": 1,
            "familyId": 1,
            "choreId": 4
        },
        {
            "id": 2,
            "familyId": 1,
            "choreId": 5
        },
        {
            "id": 3,
            "familyId": 2,
            "choreId": 5
        },
        {
            "id": 4,
            "familyId": 2,
            "choreId": 3
        }
    ]
}
```

## Additional Resources

1. [JSON Server Typicode](https://github.com/typicode/json-server)
2. [Enhancing fetch calls with `_expand` & `_embed`](./JS_JSON_SERVER_RELATIONSHIPS.md)

## Videos to Watch

1. [Beginner SQL - 14 - One to Many Relationship](https://www.youtube.com/watch?v=mOkplknUNiU)
1. [Beginner SQL - 16 - Many to Many Relationship](https://www.youtube.com/watch?v=iLn-lIpm5dU)
1. [Entity Relationship Diagram (ERD) Tutorial - Part 1](https://www.youtube.com/watch?v=QpdhBUYk7Kk)


## Practice: Small Business Workforce

> Create a `~/workspace/workforce` directory for this exercise.

A small software consulting business wants to keep track of its employees and the computers that they use. Each employee is assigned to a department, and they each get assigned a computer when they join the company.

Create an API to be served with `json-server` and create the following resources in your `database.json` file. **Do not** build the arrays of objects in your JavaScript code.

1. Build arrays of objects that represent _Employees_, _Departments_, and _Computers_ in your `database.json` file.
1. Assign every resource a unique `id` property.
1. Assign each employee to a department using a foreign key.
1. Assign each employee a computer using a foreign key.

Here's some JSON to get you started. Add at least 3 more computers, departments, and employees to your database.

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
    "departments": [
        {
            "id": 1,
            "name": "IT"
        }
    ],
    "employees": [
        {
            "id": 1,
            "firstName": "Rainu",
            "lastName": "Ittycheriah",
            "departmentId": 1,
            "computerId": 1
        }
    ]
}
```

### The Workforce ERD

Now use dbdiagram.io to create an ERD that visualizes the data relationships for this exercises. Here's some beginning definitions to get you started.

```js
Table Employees {
  id INT PK
}

Table Computers {
  id INT PK
}

Table Departments {
  id INT PK
}
```

### HTML Representations

Based on that data, you will be rendering HTML representations of an employee. Here is what that representation would look like.

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
</div>
```

You are only going to be listing employees, but you need data from all three resources. Create the following data provider files, and write a function in each to perform a GET request to pull them data into application state.

* `workforce/scripts/computers/ComputerProvider.js`
* `workforce/scripts/departments/DepartmentProvider.js`
* `workforce/scripts/employees/EmployeeProvider.js`

In your `main.js` get all of your data. Make sure you use several `.then()` calls to ensure all the data is pulled into application state before you invoke the employee list component.

In your `index.html` file, create an article element with a class of `employeeList`. That will be your content target.

> #### `workforce/scripts/employees/EmployeeList.js`

```js
const EmployeeList = () => {
    const employees = useEmployees()
    const computers = useComputers()
    const departments = useDepartments()

    const render = () => {
        contentTarget.innerHTML = `
            ${
                employees.map(employee => {
                    // Find the computer assigned to the employee
                    const computer = computers.find()

                    // Find the department assigned to the employee
                    const department = departments.find()

                    // Return the HTML representation
                    return `
                        <div class="employee">
                            <header class="employee__name">
                                <h1></h1>
                            </header>
                            <section class="employee__department">

                            </section>
                            <section class="employee__computer">

                            </section>
                        </div>
                    `
                }).join("")
            }
        `
    }

    render()
}
```

## Practice: A Growing Business

In this exercise, you are going to refactor you application to include office locations. Your business is thriving and now you have offices in Nashville, Atlanta, and Memphis. Each employee will be assigned to one office location.

### The Workforce ERD

Add a new table to your ERD in dbdiagram.io to visualize the locations resource and its relationship to the employees resource.

### HTML Representations

1. Add a new resource in your database named `locations` and create an object representation of each office location.
1. Modify each employee object to have a foreign key to one office location.
1. Refactor **`EmployeeList`** to display the office location in the employee's HTML representation.

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
</div>
```


## Practice: Handling Customers

In this exercise, you will be implementing a many-to-many relationship. As you gain more customers, you need to start assigning more than one employee to a job. You also find that you need to shift employees from job to job as the complexities change for each one.

One customer can have many employees assigned.

One employee can work for many customers.

This is a many-to-many relationship. This means that you need a join, or intersection, table to handle the relationships between these two resources.

### The Workforce ERD

Update your ERD with the following two tables. Then make sure that the relationship lines are drawn between all the related tables.

```js
Table Customers {
    id INT PK
    name varchar
}

Table EmployeeCustomers {
    id INT PK
    customerId INT
    employeeId INT
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

1. Create a new **`CustomerProvider`** component which gets all customers.
1. Create a new **`EmployeeCustomerProvider`** component which gets all customer/employee relationships.

To get all the related data for a single employee, you won't be using the `find()` method like you did for the 1 -> * relationships. You will be using the `filter()` method.

```js
const EmployeeList = () => {
    const customers = useCustomers()
    const customerRelationships = useEmployeeCustomers()

    const render = () => {
        contentTarget.innerHTML = `
            ${
                employees.map(employee => {
                    // Find all the customer relationships
                    const relationships = customerRelationships.filter()

                    // Find the related customer for each relationship
                    const assignedCustomers = relationships.map(rel => {
                        customers.find()
                    })
                }).join("")
            }
        `
    }

    render()
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


## Challenge: Follow the Money

You need to design an ERD with dbdiagram.io to represent the financial relationship between political candidates and corporate entities. Since corporations can contribute to political action committees (PAC), your job is to help see how politicians are being funded, and if that funding is directly translating into bills that politicians [sponsor](https://en.wikipedia.org/wiki/Sponsor_(legislative)).

1. Politicians can receive donations from many PACs.
1. A legislative bill can be categorized to support only one, particular commercial interest.
1. Corporations can donate to multiple PACs, on multiple dates.
1. A bill can be sponsored by one, or more, politicians.
1. PACs can make direct contributions to as many political campaigns as it wants.
1. Corporations can have multiple interests.
1. Corporations do **not disclose** any specific information about a donation, including its interests, when it donates to a PAC. We only know the date of the donation and the amount.

The obvious resources in this system are as follows:

1. Corporation
1. Political Action Committee
1. Donations (either from corporation to PAC, or from PAC to campaign)
1. Politician
1. Legislative Bill

There are other resources (tables) that you will need to create to fulfill the requirements and represent the complex relationships. Build an ERD to visualize these relationships.

## Advanced Challenge: Honest Abe API

Create an API using `json-server` for the resources you created above to track campaign contributions.

1. Create a `database.json` file containing all of the resources.
1. Define a few entries for each resource. Each resource must have a unique primary key.
1. Establish relationships between the resources by storing primary key values as foreign keys on related objects.
1. Run your API with the following command.
    ```sh
    json-server -w database.json
    ```
1. Use `fetch` to get all of the related data to build a card for each politician. It should list the bills they have sponsored, and any companies that have contributed to a PAC that has a shared interest for each bill.

> **HINT:** We will give you **one** hint. You will need to use the [`Promise.all()`](https://attacomsian.com/blog/promise-all-javascript) method to [resolve multiple fetch](https://appdividend.com/2019/01/03/javascript-promise-all-example-promise-all-tutorial/) calls at the same time.

```html
<article class="politician">
    <header class="politician__name">
        <h1>Dyer Cummings</h1>
    </header>
    <section class="politician__bills">
        <h3>Sponsored Bills</h3>
        <div>
            <h4>H.R. 5215: Veterans Affairs Purchase Card Misuse Mitigation Act</h4>
            <ul>
                <li>Military</li>
            </ul>
        </div>
    </section>
    <section class="politician__funders">
        <h3>Related PACs</h3>
        <ul>
            <li>American Gas Association</li>
            <li>League of Conservation Voters Action Fund</li>
        </ul>
    </section>
    <section class="politician__influencers">
        <h3>Influencing Corporations</h3>
        <ul>
            <li>Lockheed Martin</li>
            <li>Boeing</li>
        </ul>
    </section>
</article>
```

![animation of some rendered politicians](./images/honest-abe.gif)