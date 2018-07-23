# React Component State and Props

In this chapter, you are going to make your application a bit more dynamic by creating objects to represent the data to be displayed in your application, and then passing values around between components. This is much like passing arguments to functions, but different in interesting ways.

## State in React Applications

State is simply the current values of the properties used to render a component. Your brain will try to make it more complex than that, so remember this statement.

> State is simply the current values of the properties used to render a component.

You initialize state by defining a `state` at the top of your class definition. Let's take a look at how to implement state for our **`Kennel`** component.

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

> Kennel.css

```css
.kennel {
    display: flex;
    justify-content: space-around;
    flex-direction: row;
}
```

**`LocationList`** and **`EmployeeList`** are _child components_ of the **`Kennel`** component.

If you remove `employees={this.state.employees}` in the **`Kennel`** component, it can’t be passed down as `props` down to the child component - it will simply live in state in the **`Kennel`** component, but the data will never reach a child component.

Below you can see how we are now using `this.props.employees` because `employees` were passed down from the  **`Kennel`** component (_state_) to the  **`EmployeeList`** component (_props_). `employees` now evaluates to an array, so you can use the `map() ` array method to convert the raw data into HTML elements.


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

1. Create a new array in state in the **`Kennel`** component named `animals`. It will look just like the locations and employees arrays in state. Make sure each animal has an `id` property.
2. Create a **`AnimalList`** component for displaying animals.
3. Update **`Kennel`** to pass its `animals` state to **`AnimalList`** and use the appropriate key on `this.props` to display all animal names.

## Challenge: Animal Owners

> Remember, challenges are completely optional and should not be attempted until you have done the practice exercises and understand the basic concepts of them.

1. Add the following `owners` property to the **`Kennel`** state.
    ```js
    state = {
        owners: [
            { id: 1, name: "Ryan Tanay" },
            { id: 2, name: "Emma Beaton" },
            { id: 3, name: "Dani Adkins" },
            { id: 4, name: "Adam Oswalt" },
            { id: 5, name: "Fletcher Bangs" },
            { id: 6, name: "Angela Lee" }
        ],
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
        ]
    }
    ```
1. You create the intersection table and assign each animal to an owner.

Your task is to update the **`AnimalList`** component to also display the name of the animal's owner. You'll need to pass multiple collections - not just `animals` - to the component in order to accomplish this.
