# Adding Employees with React

## Goal

In this chapter, you are going to write a component whose responsibility is to create a new employee record and assign that employee to a location.

## New Concepts

* useRef()
* Inline event handlers
* `preventDefault()` for forms

## Process

### Add Hire Button to List

In React, you can add the event listener directly on a button's `onClick` attribute instead of writing it as a separate function in the component module.

> ##### `src/components/employee/EmployeeList.js`

```jsx
return (
    <div className="employees">
        <h1>Employees</h1>
        <button onClick={() => props.history.push("/employees/create")}>
            Add Employee
        </button>
        <article className="employeeList">
            {employees.map(employee => <Employee key={employee.id} employee={employee} />)}
        </article>
    </div>
)
```

### Refactor Employee List Route

Because you need to change the route when the button is clicked, you can use the `history.push()` method that is provided by React Router. In order to make the `history` object available to the **`EmployeeList`** component, the route needs to be rewritten.

> ##### `src/components/ApplicationViews.js`

```jsx
<Route exact path="/employees" render={
    props => <EmployeeList {...props} />
} />
```


Since you are passing a property object to the employee list, you must define a parameters to capture that object.

> ##### `src/components/employee/EmployeeList.js`

```js
export const EmployeeList = (props) => {
```

### Create Route

Now you can create the route that will respond when the button click changes the URL to `/employees/create`.

> ##### `src/components/ApplicationViews.js`

```jsx
<EmployeeProvider>
    <Route exact path="/employees" render={
        props => <EmployeeList {...props} />
    } />

    <Route exact path="/employees/create" render={
        props => <EmployeeForm {...props} />
    } />
</EmployeeProvider>
```

### Create Component

When you hire an employee, you immediately want to assign that employee to a location. Therefore, you want a dropdown that lists all of the locations. To get all of the locations, you need to use the **`LocationProvider`** component, and then use the Context hook to pull in the location data.

> ##### `src/components/employee/EmployeeForm.js`

```js
import React, { useContext, useRef, useEffect } from "react"
import { EmployeeContext } from "./EmployeeProvider"
import { LocationContext } from "../location/LocationProvider"
import { AnimalContext } from "../animal/AnimalProvider"
import "./Employees.css"

export const EmployeeForm = (props) => {
    const { addEmployee } = useContext(EmployeeContext)
    const { locations, getLocations } = useContext(LocationContext)
    const { animals, getAnimals } = useContext(AnimalContext)

    /*
        Create references that can be attached to the input
        fields in the form. This will allow you to get the
        value of the input fields later when the user clicks
        the save button.

        No more `document.querySelector()` in React.
    */
    const name = useRef(null)
    const location = useRef(null)
    const animal = useRef(null)

    /*
        Get animal state and location state on initialization.
    */
    useEffect(() => {
       getAnimals().then(getLocations)
    }, [])

    const constructNewEmployee = () => {
        /*
            The `location` and `animal` variables below are
            the references attached to the input fields. You
            can't just ask for the `.value` property directly,
            but rather `.current.value` now in React.
        */
        const locationId = parseInt(location.current.value)
        const animalId = parseInt(animal.current.value)

        if (locationId === 0) {
            window.alert("Please select a location")
        } else {
            addEmployee({
                name: name.current.value,
                locationId,
                animalId
            })
            .then(() => props.history.push("/employees"))
        }
    }

    return (
        <form className="employeeForm">
            <h2 className="employeeForm__title">New Employee</h2>
            <fieldset>
                <div className="form-group">
                    <label htmlFor="employeeName">Employee name: </label>
                    <input type="text" id="employeeName" ref={name} required autoFocus className="form-control" placeholder="Employee name" />
                </div>
            </fieldset>
            <fieldset>
                <div className="form-group">
                    <label htmlFor="location">Assign to location: </label>
                    <select defaultValue="" name="location" ref={location} id="employeeLocation" className="form-control" >
                        <option value="0">Select a location</option>
                        {locations.map(e => (
                            <option key={e.id} value={e.id}>
                                {e.name}
                            </option>
                        ))}
                    </select>
                </div>
            </fieldset>
            <fieldset>
                <div className="form-group">
                    <label htmlFor="location">Caretaker for: </label>
                    <select defaultValue="" name="animal" ref={animal} id="employeeAnimal" className="form-control" >
                        <option value="0">Select an animal</option>
                        {animals.map(e => (
                            <option key={e.id} value={e.id}>
                                {e.name}
                            </option>
                        ))}
                    </select>
                </div>
            </fieldset>
            <button type="submit"
                onClick={evt => {
                    evt.preventDefault() // Prevent browser from submitting the form
                    constructNewEmployee()
                }}
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

This is because you imported the **`LocationProvider`** component and used the Context hook to get the data, but you forgot to make the **`EmployeeForm`** component a child of the **`LocationProvider`** component. Open **`ApplicationViews`** and make the change.

> ##### `src/components/ApplicationViews.js`

```jsx
<EmployeeProvider>
    <LocationProvider>
        <Route exact path="/employees" render={
            props => <EmployeeList {...props} />
        } />

        <Route exact path="/employees/create">
            <EmployeeForm />
        </Route>
    </LocationProvider>
</EmployeeProvider>
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

### Show All Employees on Save

You need to use the `history.push()` method again to take the user to a new view. Reference the code above to see how to do the following two tasks.

1. Provide the React Router history object to the **`EmployeeForm`** component by refactoring **`ApplicationViews`**.
1. Route the user to `/employees`.
