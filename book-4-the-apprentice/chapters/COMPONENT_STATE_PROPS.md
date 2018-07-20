# React Component State and Props

## State

State is simply the current values of the properties used to render a component. Your brain will try to make it more complex than that, so remember this statement.

> State is simply the current values of the properties used to render a component.

You initialize state by defining a `state` object in your component constructor. Let's take a look at how to implement state for our **`Kennel`** component.

> components/Kennel.js

```js
import React, { Component } from "react"
import EmployeeList from "./employee/EmployeeList"
import LocationList from "./location/LocationList"
import "./Kennel.css"


export default class Kennel extends Component {

    state = {
        employees: [
            { id: 1, name: "Jessica Younker" },
            { id: 2, name: "Jordan Nelson" },
            { id: 3, name: "Zoe LeBlanc" },
            { id: 4, name: "Blaise Roberts" }
        ],
        locations: [
            { id: 1, name: "Nashville North" },
            { id: 2, name: "Nashville South" }
        ]
    }

    render() {
        return (
            <article className="kennel">
                <LocationList locations={this.state.locations} />
                <EmployeeList employees={this.state.employees} />
            </article>
        )
    }
}
```

> components/Kennel.css

```css
.kennel {
    display: flex;
    justify-content: space-around;
    flex-direction: row;
}
```

Each of those attributes for the child components become keys on a `props` object. In this case, each of those variables evaluate to arrays, so you can use the `map()` array method to convert the raw data into HTML elements.

> EmployeeList.js

```js
import React, { Component } from 'react'


export default class EmployeeList extends Component {
    render() {
        return (
            <section className="employees">
            {
                this.props.employees.map(employee =>
                    <div key={employee.id}>
                        {employee.name}
                    </div>
                )
            }
            </section>
        )
    }
}
```

## Using State in a Component

![](./images/state.png)

## Passing State to a Child Component

![](./images/statetoprops.png)


## Practice Exercise - Displaying Locations

Update your application so that the array of locations is passed from the **`Kennel`** state to the props of **`LocationList`**. Then use the `map()` method to display all location names.

## Practice Exercise - Displaying Animals

Now that you are passing state from the **`Kennel`** to the **`EmployeeList`** and **`LocationList`**, you're going to list animals now.

1. Create a new state array in the **`Kennel`** component named `animals`.
2. Create a **`AnimalList`** component for displaying animals.
3. Update **`Kennel`** to pass its `animals` state to **`AnimalList`** and use the appropriate key on `this.props` to display all animal names.

## Challenge: Animal Owners

1. Add an `id` property to each of your existing resources.
1. Add the following `owners` property to the **`Kennel`** state.
    ```js
    state = {
        employees: [
            { id: 1, name: "Jessica Younker" },
            { id: 2, name: "Jordan Nelson" },
            { id: 3, name: "Zoe LeBlanc" },
            { id: 4, name: "Blaise Roberts" }
        ],
        locations: [
            { id: 1, name: "Nashville North" },
            { id: 2, name: "Nashville South" }
        ],
        animals: [
            { id: 1, name: "Doodles" },
            { id: 2, name: "Jack" },
            { id: 3, name: "Angus" },
            { id: 4, name: "Henley" },
            { id: 5, name: "Derkins" },
            { id: 6, name: "Checkers" }
        ],
        owners: [
            { id: 1, name: "Ryan Tanay" },
            { id: 2, name: "Emma Beaton" },
            { id: 3, name: "Dani Adkins" },
            { id: 4, name: "Adam Oswalt" },
            { id: 5, name: "Fletcher Bangs" },
            { id: 6, name: "Angela Lee" }
        ]
    }
    ```
1. You create the intersection table and assign each animal to an owner.

Your task is to update the **`AnimalList`** component to also display the name of the animal's owner. You'll need to pass multiple collections - not just `animals` - to the component in order to accomplish this.
