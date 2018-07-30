# Joining Data in Separate Objects

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
            "productId": 1,
            "name": "Lollipop",
            "type": "Candy"
        },
        {
            "productId": 2,
            "name": "iPad",
            "type": "Electronics"
        },
        {
            "productId": 3,
            "name": "Snickers",
            "type": "Candy"
        },
        {
            "productId": 4,
            "name": "Baby Ruth",
            "type": "Candy"
        },
        {
            "productId": 5,
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

```js
const Database = {
    "productTypes": [
        {
            "productTypeId": 1,
            "name": "Candy"
        },
        {
            "productTypeId": 2,
            "name": "Electronics"
        }
    ],
    "products": [
        {
            "productId": 1, // Primary key for lollipop
            "name": "Lollipop",
            "productType": 1 // Foreign key to Candy
        },
        {
            "productId": 2,  // Primary key for iPad
            "name": "iPad",
            "productType": 2  // Foreign key to Electronics
        },
        {
            "productId": 3,
            "name": "Snickers",
            "productType": 1
        },
        {
            "productId": 4,
            "name": "Baby Ruth",
            "productType": 1
        },
        {
            "productId": 5,
            "name": "Xbox One",
            "productType": 2
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

This is a many-to-many relationship. This will require us to have a data set whose purpose is simply to store those relationships. This allows us maximum flexibility because we can assign any number of family members to a task, and assign any number of taks to a family member.

![](./images/many-to-many.png)

```js
const Family = [
    {
        "familyId": 1,
        "name": "Mom"
    },
    {
        "familyId": 2,
        "name": "Dad"
    },
    {
        "familyId": 3,
        "name": "Sarah"
    },
    {
        "familyId": 4,
        "name": "Blake"
    },
    {
        "familyId": 5,
        "name": "Sophia"
    },
    {
        "familyId": 6,
        "name": "Michael"
    }
]

const Chores = [
    {
        "choreId": 1,
        "task": "Paint Garage"
    },
    {
        "choreId": 2,
        "task": "Take out the trash"
    },
    {
        "choreId": 3,
        "task": "Do the laundry"
    },
    {
        "choreId": 4,
        "task": "Clean the bedrooms"
    },
    {
        "choreId": 5,
        "task": "Family game night"
    },
    {
        "choreId": 6,
        "task": "Feed the dog"
    }
]

/*
    In this initial intersection table, we can see that
    mom is assigned to two tasks, and dad is also assigned
    to two tasks.

    We also see that mom and dad are both assigned to the
    same taskId of 5 - which is game night.
*/
const FamilyChores = [
    {
        "familyId": 1,
        "choreId": 4
    },
    {
        "familyId": 1,
        "choreId": 5
    },
    {
        "familyId": 2,
        "choreId": 5
    },
    {
        "familyId": 2,
        "choreId": 3
    }
]

const FamilyDatabase = {
    "family": Family,
    "chores": Chores,
    "familyChores": FamilyChores
}
```

## Videos to Watch

1. [Beginner SQL - 14 - One to Many Relationship](https://www.youtube.com/watch?v=mOkplknUNiU)
1. [Beginner SQL - 16 - Many to Many Relationship](https://www.youtube.com/watch?v=iLn-lIpm5dU)
1. [Entity Relationship Diagram (ERD) Tutorial - Part 1](https://www.youtube.com/watch?v=QpdhBUYk7Kk)

## Practice: Small Business

A small business wants to keep track of its employees and the computers that they use. Each employee is assigned to a department, and they each get assigned a computer when they join the company.

1. Build arrays of objects that represent _Employees_, _Departments_, and _Computers_.
1. Assign every resource a unique `id` property.
1. Assign each employee to a department using a foreign key.
1. Assign each employee a computer using a foreign key.

Once your data is normalized, use your DOM skills to display a card for each employee. It should display the employee name, the name of their department, and which computer they are using

```html
<article class="employee">
    <header class="employee__name">
        <h1>Rainu Ittycheriah</h1>
    </header>
    <section class="employee__department">
        Works in the IT department
    </section>
    <section class="employee__computer">
        Currently using a 2015 MacBook Pro
    </section>
</article>
```

## Challenge: Follow the Money

You need to design a database to represent the financial relationship between political candidates and corporate entities. Since corporations can contribute to political action committees (PAC), your job is to help see how politicians are being funded, and if that funding is directly translating into bills that politicians [sponsor](https://en.wikipedia.org/wiki/Sponsor_(legislative)).

1. Politicians can receive donations from many PACs or SuperPACs.
1. A legislative bill can be categorized to support a particular commercial interest.
1. Corporations can donate to multiple PACs, on multiple dates.
1. A bill can be sponsored by one, or more, politicians.
1. PACs can make direct contributions to a political campaign.
1. Corporations can have myriad interests for which they donate money to a PAC.

The resources in this system are as follows:

1. Politician
1. Corporation
1. Donation
1. PoliticalActionCommittee
1. LegislativeBill

Create an ERD that visualizes the relationships between these resources. You will need to create some entities in addition to the ones listed above to build the correct relationships.

## Advanced Challenge: Honest Abe API

Create an API using `json-server` for the resources you created above to track campaign contributions.

1. Create a `db.json` file containing all of the resources.
1. Define a few entries for each resource. Each resource must have a unique primary key.
1. Establish relationships between the resources by storing primary key values as foreign keys on related objects.
1. Run your API with the following command.
    ```sh
    json-server --watch db.json
    ```
1. Use jQuery's `$.ajax()` method to get all of the related data to build a card for each politician. It should list the bills they have sponsored, and any companies that have contributed to a PAC that has a shared interest for each bill.

```html
<article class="politician">
    <header class="politician__name">
        <h1>Abby Fleming</h1>
    </header>
    <section class="politician__bills">
        <h3>Sponsored Bills</h3>
        <div>
            <h4>S. 2325: Northern Mariana Islands U.S. Workforce Act</h4>
            <ul>
                <li>Employment</li>
                <li>Energy</li>
                <li>Natural Resources</li>
            </ul>
        </div>
    </section>
    <section class="politician__influencers">
        <h3>Related PACs</h3>
        <ul>
            <li>American Gas Association</li>
            <li>League of Conservation Voters Action Fund</li>
        </ul>
    </section>
</article>
````
