# React Component State and Props

## State

State is simply the current values of the properties used to render a component. Your brain will try to make it more complex than that, so remember this statement.

> State is simply the current values of the properties used to render a component.

You initialize state by defining a `state` object in your component constructor. Let's take a look at how to implement state for our **`Kennel`** component.

```js
import React, { Component } from 'react'
import EmployeeList from "./EmployeeList"


export default class Kennel extends Component {

    state = {
        employees: [
            { name: "Jessica Younker" },
            { name: "Jordan Nelson" },
            { name: "Zoe LeBlanc" },
            { name: "Blaise Roberts" }
        ],
        locations: [
            { name: "Nashville North" },
            { name: "Nashville South" }
        ]
    }

    render() {
        return (
            <div>
                <LocationList locations={this.state.locations} />
                <EmployeeList employee={this.state.employees} />
            </div>
        );
    }
}
```

Each of those attributes for the child components become keys on a `props` object.

> EmployeeList.js

```js
import React, { Component } from 'react'


export default class EmployeeList extends Component {
    render() {
        return (
            {
                /*
                This is a reference to the employees array
                defined in the state object in Kennel.js
                */
                this.props.employees
            }
        );
    }
}
```

Now you can use the `map()` array method to convert the raw data into HTML elements.

```js
import React, { Component } from 'react'


export default class EmployeeList  extends Component {
    render() {
        return (
            {
                <section>
                    /*
                    This is a reference to the employees array
                    defined in the state object in Kennel.js
                    */
                    this.props.employees.map(employee => (
                        <div>
                            {employee.name}
                        </div>
                    ))
                <section>
            }
        );
    }
}
```

## Using State in a Component

![](./images/state.png)

## Passing State to a Child Component

![](./images/statetoprops.png)


## Practice

### Displaying Locations

Update your application so that the array of locations is passed from the Kennel state to the props of **`LocationList`**. Then use the `map()` method to display all location names.

### Displaying Animals

Now that you are passing state from the **`Kennel`** to the **`EmployeeList`** and **`LocationList`**, you're going to list animals now.

1. Create a new state array in the Kennel component named `animals`
2. Create a **`AnimalList`** component for displaying animals.
3. Update **`Kennel`** to pass its `animals` state to **`AnimalList`** and use the appropriate key on `this.props` to display all animal names.

