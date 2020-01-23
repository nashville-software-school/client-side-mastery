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
export default (props) => {
```

### Create Route

Now you can create the route that will respond when the button click changes the URL to `/employees/create`.

> ##### `src/components/ApplicationViews.js`

```jsx
<EmployeeProvider>
    <Route exact path="/employees" render={
        props => <EmployeeList {...props} />
    } />

    <Route exact path="/employees/create">
        <EmployeeForm />
    </Route>
</EmployeeProvider>
```

### Create Component

When you hire an employee, you immediately want to assign that employee to a location. Therefore, you want a dropdown that lists all of the locations. To get all of the locations, you need to use the **`LocationProvider`** component, and then use the Context hook to pull in the location data.

> ##### `src/components/employee/EmployeeForm.js`

```js
import React, { useContext } from "react"
import { EmployeeContext } from "./EmployeeProvider"
import { LocationContext } from "../location/LocationProvider"
import "./Employees.css"

export default props => {
    const { addEmployee } = useContext(EmployeeContext)
    const { locations } = useContext(LocationContext)


    return (
        <form className="employeeForm">
            <h2 className="employeeForm__title">New Employee</h2>
            <div className="form-group">
                <label htmlFor="employeeName">Employee name</label>
                <input
                    type="text"
                    id="employeeName"
                    required
                    autoFocus
                    className="form-control"
                    placeholder="Employee name"
                />
            </div>
            <div className="form-group">
                <label htmlFor="location">Assign to location</label>
                <select
                    defaultValue=""
                    name="location"
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
            <button type="submit" className="btn btn-primary"> Save Employee </button>
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

### Save Button Click Handler

When you click on the save button, the Employee state will change. Just like in your previous applications, you need to follow these steps.

1. Define a function that handles the save button click.
1. Construct a new object representation of the new employee from the user input.
1. POST the object to your API and change the API state.
1. Immediately update the application state with the new array of employees that are in the API.

Once that process is complete, you will send the user to the list of employees so that she can see that her data has been saved correctly.

> ##### `src/components/employee/EmployeeForm.js`

```js

```

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
    const [ employeeName ] = useRef("")
    const [ employeeLocation ] = useRef(0)
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

### Show All Employees on Save

You need to use the `history.push()` method again to take the user to a new view. Reference the code above to see how to do the following two tasks.

1. Provide the React Router history object to the **`EmployeeForm`** component by refactoring **`ApplicationViews`**.
1. Route the user to `/employees`.