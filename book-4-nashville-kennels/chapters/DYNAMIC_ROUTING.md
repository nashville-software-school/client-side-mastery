# Individual Items with Dynamic Routing

In this chapter, you will be learning how to render individual resources. So far you are listing all employees, all animals, all customers, and all locations. By the end of the chapter, you will be able to click on one of the cards in the list view and only view the details of a specific item.

You are going to start with employees. You are going to change the list of employees to display the employee name, as a hyperlink, and then have a separate component for displaying more details.

## New Employee Details Component

With the code below, you will create a new component in the employee directory which will be responsible for showing all the details of the employee.

Note that you are using the `useEffect()` hook to listen for state change event dispatch for animals, employees, and locations. When the data is finally pulled into application state from the API, the animal and location that is related to the current employee is determined with `.find()` methods.

> ##### `/src/components/employee/EmployeeDetail.js`

```jsx
import React, { useState, useEffect, useContext } from "react"
import { AnimalContext } from "../animal/AnimalProvider"
import { LocationContext } from "../location/LocationProvider"
import { EmployeeContext } from "./EmployeeProvider"
import "./Employees.css"


export const EmployeeDetail = (props) => {
    const { animals, getAnimals } = useContext(AnimalContext)
    const { locations, getLocations } = useContext(LocationContext)
    const { employees, getEmployees } = useContext(EmployeeContext)

    const [animal, setAnimal] = useState({})
    const [employee, setEmployee] = useState({})
    const [location, setLocation] = useState({})

    useEffect(() => {
        getEmployees()
            .then(getAnimals)
            .then(getLocations)
    }, [])

    useEffect(() => {
        const animal = animals.find(a => a.id === employee.animalId) || {}
        setAnimal(animal)
    }, [animals])

    useEffect(() => {
        const employee = employees.find(e => e.id === parseInt(props.match.params.employeeId)) || {}
        setEmployee(employee)
    }, [employees])

    useEffect(() => {
        const location = locations.find(l => l.id === employee.locationId) || {}
        setLocation(location)
    }, [locations])

    return (
        <section className="employee">
            <h3 className="employee__name">{employee.name}</h3>
            <div>Currently working at { location.name }</div>
            <div>
                {
                (employee.animalId === null)
                    ? "Not assigned to an animal"
                    : `Currently taking care of ${animal.name}`
                }
            </div>
        </section>
    )
}
```

## Create a New Dynamic Route

A dynamic route component is one that matches a pattern, instead of a static route.

Notice the route that renders **`EmployeeDetail`**. It has `:employeeId(/d+)` at the end of the URL. What that does is handle if the URL is http://locahost:3000/employees/3, the value of 3 will be stored in a variable named `employeeId`. That variable can then be used inside **`EmployeeDetail`**.

Look back at the code you put in the detail component.

See the `props.match.params.employeeId`?

That's how you access the number 3 inside the component. It's part of the routing package you installed. Don't worry, that one's tricky. We'll help you remember it.

> ##### `/src/components/ApplicationViews.js`

```jsx
<EmployeeProvider>
    <LocationProvider>
        <AnimalProvider>
            <Route path="/employees/create" render={
                props => <EmployeeForm {...props} />
            } />

            {/* New route for showing employee details */}
            <Route path="/employees/:employeeId(\d+)" render={
                props => <EmployeeDetail {...props} />
            } />
        </AnimalProvider>
    </LocationProvider>
</EmployeeProvider>
```

This route will match any of the following URIs in the browser.

* `http://localhost:3000/employees/1`
* `http://localhost:3000/employees/42`
* `http://localhost:3000/employees/8`
* `http://localhost:3000/employees/70021`
* `http://localhost:3000/employees/319`

## Refactor Employee List

On the **`EmployeeList`** component, each employee's name will be a hyperlink that, when clicked, will show further details about the employee.

Note in the new code that the `<Link>` component is being imported from the `react-router-dom` package, and then is used to make the employee name a hyperlink.

> ##### `/src/components/employee/EmployeeList.js`

```jsx
import React, { useContext, useEffect } from "react"
import { EmployeeContext } from "./EmployeeProvider"
import { Link } from "react-router-dom"
import "./Employees.css"

export const EmployeeList = props => {
    const { employees, getEmployees } = useContext(EmployeeContext)

    useEffect(() => {
        getEmployees()
    }, [])

    return (
        <div className="employees">
            <h1>Employees</h1>

            <button onClick={() => props.history.push("/employees/create")}>
                Add Employee
            </button>

            <article className="employeeList">
                {
                    employees.map(employee => {
                        return <Link key={employee.id} to={`/employees/${employee.id}`}>
                            <h3>{employee.name}</h3>
                        </Link>
                    })
                }
            </article>
        </div>
    )
}
```

## Try it Out

Now when you click on an animal's name in the list view, you should see your new animal detail view.

![image of animal detail view](./images/employee-list-and-details.gif)

