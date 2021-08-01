# Employee Specialties

## Documentation Walkthrough

In this chapter, you are going to be implementing a `useEffect()` hook that observes the `employees` state variable for changes. The logic for the hook will extract the specialty of each employee and then update the value of a state variable - `specialties` - with a comma-separated list of those words.

![list of employees with specialties string above](./images/employee-specialties.png)

## Starter Code

Replace all of the existing code in your **`EmployeeList`** module with the following starter code. Then write the code to complete the feature.

> #### `src/components/employees/EmployeeList.js`

```js
import React, { useEffect, useState } from "react"

export const EmployeeList = () => {
    const [employees, changeEmployee] = useState([])

    useEffect(
        () => {
            fetch("http://localhost:8088/employees")
                .then(res => res.json())
                .then((data) => {
                    changeEmployee(data)
                })
        },
        []
    )

    useEffect(() => {
        /*
            1. Use .map() to get the specialty of each employee
            2. Then update a state variable to be a comma-separated string
                (e.g. "iPhone, Printers, ...")
        */
    }, [employees])

    return (
        <>
            <div>
                Specialties:
            </div>
            {
                employees.map(
                    (employee) => {
                        return <p key={`employee--${employee.id}`}>{employee.name}</p>
                    }
                )
            }
        </>
    )
}
```

## Solution

Try it yourself, or with your teammates to discuss your strategy and practice vocabulary. If you get stuck, you look at the [final code](./scripts/EmployeeList.js) that shows you how to do it.