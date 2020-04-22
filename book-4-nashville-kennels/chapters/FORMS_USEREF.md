# Adding Employees with React

## Goal

In this chapter, you are going to write a component whose responsibility is to create a new employee record and assign that employee to a location. This component will be dislayed as a modal!!

## New Concepts

* useRef()
* Inline event handlers
* `preventDefault()` for forms
* Reactstrap Modals

## Setup

Visit the [Reactstrap homepage](https://reactstrap.github.io/) and follow the instructions to get it installed for your project.

## Process

### CSS for Fake Links

React does not like it when you use `<a>` elements in your JSX, so everything must be buttons or divs. However, the design pattern that muggles are used to is having a blue hyperlink to click on in a list.

Add the following styles to `Kennel.css`

```css
.fakeLink {
    background: none!important;
    border: none;
    font-family: arial, sans-serif;
    text-decoration: none;
    cursor: pointer;
}

.href {
    color: #479cf7d3;
    text-decoration: underline;
}

.href:hover {
    color: #007bff;
}

.fakeLink:focus {
    outline: 0;
}

.icon--delete {
    padding-left: 0.5rem;
}
```

### Add Hire "Link" to List and Modals

In React, you can add the event listener directly on a element by using the `onClick` attribute instead of writing it as a separate function in the component module.

Also below you will see the use of a `<Modal>` from the Reactstrap library.

> ##### `src/components/employee/EmployeeList.js`

```jsx
import React, { useContext, useState } from "react"
import { EmployeeContext } from "./EmployeeProvider"
import Employee from "./Employee"
import { LocationContext } from "../location/LocationProvider"
import { Button, Modal, ModalHeader, ModalBody, ModalFooter } from "reactstrap"
import EmployeeForm from "./EmployeeForm"


export default () => {
    const { employees } = useContext(EmployeeContext)
    const { locations } = useContext(LocationContext)

    const [modal, setModal] = useState(false)
    const toggle = () => setModal(!modal)

    return (
        <>
            <h2>Employees</h2>

            <div className="fakeLink href" onClick={toggle}>New Employee</div>

            <ul className="employees">
                {
                    employees.map(employee => {
                        const loc = locations.find(l => l.id === employee.locationId)

                        return <Employee key={employee.id} location={loc} employee={employee} />
                    })
                }
            </ul>

            <Modal isOpen={modal} toggle={toggle}>
                <ModalHeader toggle={toggle}>
                    New Employee
                </ModalHeader>
                <ModalBody>
                    <EmployeeForm toggler={toggle} />
                </ModalBody>
            </Modal>
        </>
    )
}
```

### New Employee Form Component

When you hire an employee, you immediately want to assign that employee to a location. Therefore, you want a dropdown that lists all of the locations. To get all of the locations, you need to use the **`LocationProvider`** component, and then use the Context hook to pull in the location data.

> ##### `src/components/employee/EmployeeForm.js`

```js
import React, { useContext, useRef } from "react"
import { EmployeeContext } from "./EmployeeProvider"
import { LocationContext } from "../location/LocationProvider"
import "./Employee.css"

export default props => {
    const { addEmployee } = useContext(EmployeeContext)
    const { locations } = useContext(LocationContext)
    const name = useRef()
    const location = useRef()
    const address = useRef()

    const constructNewEmployee = () => {
        const locationId = parseInt(location.current.value)

        if (locationId === 0) {
            window.alert("Please select a location")
        } else {
            addEmployee({
                name: name.current.value,
                locationId: locationId,
                address: address.current.value
            })
            .then(props.toggler)
        }
    }

    return (
        <form className="employeeForm">
            <h2 className="employeeForm__title">New Employee</h2>
            <fieldset>
                <div className="form-group">
                    <label htmlFor="employeeName">Employee name: </label>
                    <input
                        type="text"
                        id="employeeName"
                        ref={name}
                        required
                        autoFocus
                        className="form-control"
                        placeholder="Employee name"
                    />
                </div>
            </fieldset>
            <fieldset>
                <div className="form-group">
                    <label htmlFor="employeeAddress">Address: </label>
                    <input
                        type="text"
                        id="employeeAddress"
                        ref={address}
                        required
                        autoFocus
                        className="form-control"
                        placeholder="Street address"
                    />
                </div>
            </fieldset>
            <fieldset>
                <div className="form-group">
                    <label htmlFor="location">Assign to location: </label>
                    <select
                        defaultValue=""
                        name="location"
                        ref={location}
                        id="employeeLocation"
                        className="form-control"
                    >
                        <option value="0">Select a location</option>
                        {locations.map(e => (
                            <option key={e.id} value={e.id}>
                                {e.name}
                            </option>
                        ))}
                    </select>
                </div>
            </fieldset>
            <button type="submit"
                onClick={
                    evt => {
                        evt.preventDefault() // Prevent browser from submitting the form
                        constructNewEmployee()
                    }
                }
                className="btn btn-primary">
                Save Employee
            </button>
        </form>
    )
}
```

### Wrap it in the Provider Component

You should immediately see the following error.

```html
TypeError: Cannot read property 'locations' of undefined
```

This is because you imported the **`LocationProvider`** component and used the Context hook to get the data, but you forgot to make the **`EmployeeForm`** component a child of the **`LocationProvider`** component. Open **`Kennel`** and make the change.

> ##### `src/components/Kennel.js`

```jsx
<EmployeeProvider>
    <LocationProvider>
        <EmployeeList />
    </LocationProvider>
</EmployeeProvider>
```

### Save Button Click Handler

When you click on the Save Employee button, the Employee state will change. Just like in your previous applications, you need to follow these steps.

1. Define a function that handles the save button click.
1. Construct a new object representation of the new employee from the user input.
1. POST the object to your API and change the API state by using the `addEmployee` function that is in the Employee Provider.

Once that process is complete, the list of employees will immediately be re-rendered with the new employee you create.

### Get User Input

Time to learn a new React hook - the Ref hook. Working with input fields is different that in vaillaJS. Since React handles all DOM querying and updating, you should not query the DOM directly anymore for the input's value.

```js
// Not valid anymore
document.querySelector("#employeeName").value
```

You are going to create a reference object and then use the Ref hook to get and set the value of the input fields.

First, add new new reference objects and provide default values. The default value is the value that you put in the parenthesis for `useRef()`.

```js
export default props => {
    const { addEmployee } = useContext(EmployeeContext)
    const { locations } = useContext(LocationContext)
    const employeeName = useRef("")
    const employeeLocation = useRef(0)
```

Then create a `ref` attribute on the employee name field.

```jsx
<input
    type="text"
    id="employeeName"
    ref={employeeName}
    required
    autoFocus
    className="form-control"
    placeholder="Employee name"
    />
```

Then create one for the location dropdown.

```jsx
<select
    defaultValue=""
    name="location"
    ref={employeeLocation}
    id="employeeLocation"
    className="form-control"
>
```

### Provider Function to Save Employee

Now it is time for you to save your employee. First, create a function in your provider to perform the fetch operation.

```js
const addEmployee = employee => {
    return fetch("http://localhost:8088/employees", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(employee)
    })
        .then(getEmployees)
}
```

Then write a function to collect the user input and build the new employee object. Use the `.current.value` property of the reference object to achieve this.

```js
const constructNewEmployee = () => {
    const locationId = parseInt(employeeLocation.current.value)

    if (locationId === 0) {
        window.alert("Please select a location")
    } else {
        addEmployee({
            name: employeeName.current.value,
            locationId: locationId
        })
        .then(props.toggler)
    }
}
```

Lastly, update the save button.

```js
<button type="submit"
    onClick={
        evt => {
            evt.preventDefault() // Prevent browser from submitting the form
            constructNewEmployee()
        }
    }
    className="btn btn-primary">
    Save Employee
</button>
```

### Employee List Re-renders on Save

Since the Employee list component has an effect hook that reponds to the employee state change, once your new employee is saved, the list should immediately re-renders with the new employee in it.
