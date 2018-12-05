# React Component State and Props

In this chapter, you are going to make your application a bit more dynamic by creating objects to represent the data to be displayed in your application, and then passing values around between components. This is much like passing arguments to functions, but different in interesting ways.

## State in React Applications

State is simply the current values of the properties used to render a component. Your brain will try to make it more complex than that, so remember this statement.

> State is simply the current values of the properties used to render a component.

You initialize state by defining a `state` at the top of your class definition. Let's take a look at how to implement state for our **`Kennel`** component.

Pay special attention to how the rendering of `<EmployeeList>` and `<LocationList>` have changed.

Also note that you're importing a single CSS file directly into this component. No need to worry about `<link>` tags in your HTML any more. All of the styles in the imported CSS should only apply to the JSX elements you are making in this component.

> components/Kennel.js

```js
import React, { Component } from "react"
import EmployeeList from "./employee/EmployeeList"
import LocationList from "./location/LocationList"
import "./Kennel.css"


class Kennel extends Component {

    /*
        Although you will eventually be pulling your objects
        from your json-server API, for this chapter, we're
        faking it and just creating those arrays in the component
        itself
    */
    employeesFromAPI = [
        { id: 1, name: "Jessica Younker" },
        { id: 2, name: "Jordan Nelson" },
        { id: 3, name: "Zoe LeBlanc" },
        { id: 4, name: "Blaise Roberts" }
    ]

    // This will eventually get pulled from the API
    locationsFromAPI = [
        { id: 1, name: "Nashville North", address: "500 Circle Way" },
        { id: 2, name: "Nashville South", address: "10101 Binary Court" }
    ]

    state = {
        employees: this.employeesFromAPI,
        locations: this.locationsFromAPI
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

export default Kennel
```

> Kennel.css

```css
.kennel {
    display: flex;
    justify-content: space-around;
    flex-direction: row;
}
```

Because **`LocationList`** and **`EmployeeList`** are included in `Kennel`'s render method, they are _child components_ of the **`Kennel`** component.

If you remove `employees={this.state.employees}` in the **`Kennel`** component, it can’t be passed down as `props` to the child component - it will simply live in state in the **`Kennel`** component, but the data will never reach a child component.

Below you can see how we are now using `this.props.employees` because `employees` were passed down from the  **`Kennel`** component (_state_) to the  **`EmployeeList`** component (_props_). `employees` now evaluates to an array, so you can use the `map() ` array method to convert the raw data into HTML elements.


> EmployeeList.js

```js
import React, { Component } from 'react'


class EmployeeList extends Component {
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

export default EmployeeList
```

Here's how the implementation of the component would look in VanillaJs.

```js
const state = {
    locations = [
        {
            name: "Nashville North",
            address: "500 Puppy Way"
        },
        {
            name: "Nashville North",
            address: "576 Puppy Way"
        }
    ],
    employees = [
        {
            name: "Meg Ducharme"
        },
        {
            name: "Blaise Roberts"
        }
    ]
}

function printEmployee (employee) {
    return `<div id={employee.id}>
                {employee.name}
            </div>`
}

state.employees.forEach(employee =>
    document.querySelector(".employees").innerHTML += printEmployee(employee)
)
```

## Using State in a Component

![](./images/state.png)

## Passing State to a Child Component

![](./images/statetoprops.png)

## Expressing State as HTML

An important aspect of understanding why React works the way that it does it to realize that its core mechanism is to **_express state as HTML_**.

Gone are the days of using Vanilla JavaScript or jQuery to directly manipulate your DOM. You should never write an `appendChild()`, or `$("#something").empty()` in your code.

State is at the core of React. It drives everything. Including the HTML representation of that state via JSX. If you want to change the DOM that is being displayed to your customer, you **change the state of the component**.

So, how do you change the state of a component? Your learning team will explain in detail, but for now just know you _must_ use the `this.setState()` method, and that method, in turn, invokes the `render()` method. Therefore, changing state this way, and only this way, modifies your DOM.

* If you remove an item from a collection in state, then that element will not be rendered.
* If you add an item to a collection in state, then it will be rendered.
* If you modify an object that is used in your JSX, then it will be changed when the component is re-rendered.

---

## Practice Exercise - Displaying Locations

Update your application so that the array of locations is passed from the **`Kennel`** state to the props of **`LocationList`**. Then use the `map()` method to display all location names.

## Practice Exercise - Displaying Animals

Now that you are passing state from the **`Kennel`** to the **`EmployeeList`** and **`LocationList`**, you're going to list animals now.

1. Create a new array in state in the **`Kennel`** component named `animals`. It will look just like the locations and employees arrays in state. Make sure each animal has an `id` property.
2. Create an **`AnimalList`** component for displaying animals.
3. Update **`Kennel`** to pass its `animals` state to **`AnimalList`** and use the appropriate key on `this.props` to display all animal names.

## Challenge: Animal Owners

> Remember, challenges are completely optional and should not be attempted until you have done the practice exercises and understand the basic concepts of them.

1. Add the following `owners` property to the **`Kennel`** state.
    ```js
    ownersFromAPI = [
        { id: 1, name: "Ryan Tanay" },
        { id: 2, name: "Emma Beaton" },
        { id: 3, name: "Dani Adkins" },
        { id: 4, name: "Adam Oswalt" },
        { id: 5, name: "Fletcher Bangs" },
        { id: 6, name: "Angela Lee" }
    ]

    state = {
        owners: this.ownersFromAPI,
        employees: this.employeesFromAPI,
        locations: this.locationsFromAPI,
        animals: this.animalsFromAPI
    }
    ```
1. You create the intersection table and assign each animal to an owner.

Your task is to update the **`AnimalList`** component to also display the name of the animal's owner(s). Keep in mind that the animal may have more than one owner. You'll need to pass multiple collections - not just `animals` - to the component in order to accomplish this.
