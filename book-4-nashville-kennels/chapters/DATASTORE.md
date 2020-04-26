# Higher Order Components: Single Data Store

A higher order component is a single component that returns a component. Instead of having the Pyramid of Doom nested providers in the **`Dashboard`** component, you can define a function whose responsibility is to return all of those provider. This will allow you to wrap all of your UI component with a single component that provides all of the data.

## Higher Order Component

##### **`src/components/DataStore.js`**

```jsx
import React from "react"
import { LocationProvider } from "./location/LocationProvider"
import { EmployeeProvider } from "./employee/EmployeeProvider"
import { AnimalProvider } from "./animal/AnimalProvider"
import { CustomerProvider } from "./customer/CustomerProvider"

export const DataStore = props => (
    <AnimalProvider>
        <CustomerProvider>
            <EmployeeProvider>
                <LocationProvider>
                    {props.children}
                </LocationProvider>
            </EmployeeProvider>
        </CustomerProvider>
    </AnimalProvider>
)
```

## Dashboard Refinement

Now that all of the providers and been rolled up into a single higher order component, you only need to implement the **`DataStore`** component in **`Dashboard`**.

```jsx
import React, { useState, useEffect } from "react"
import { DataStore } from "./DataStore"
import { LocationList } from "./location/LocationList"
import { EmployeeList } from "./employee/EmployeeList"
import { CustomerList } from "./customer/CustomerList"
import { SearchBar } from "./search/SearchBar"
import { SearchResults } from "./search/SearchResults"
import "./Layout.css"
import "./Kennel.css"

export const Dashboard = () => {
    const [searchTerms, setTerms] = useState(null)
    const [activeList, setActiveList] = useState("locations")
    const [components, setComponents] = useState()

    // Higher order functions that return which component to render
    const showLocations = () => <LocationList />
    const showCustomers = () => <CustomerList />
    const showEmployees = () => <EmployeeList />

    /*
        This effect hook determines which list is shown
        based on the state of the `activeList` variable.
    */
    useEffect(() => {
        if (activeList === "customers") {
            setComponents(showCustomers)
        }
        else if (activeList === "locations") {
            setComponents(showLocations)
        }
        else if (activeList === "employees") {
            setComponents(showEmployees)
        }
    }, [activeList])

    return (
        <div className="mainContainer">
            <DataStore>
                <div className="searchContainer">
                    <SearchBar setTerms={setTerms} />
                    <SearchResults searchTerms={searchTerms} />
                </div>
                <div className="dataContainer">
                    <h1>Nashville Kennels</h1>
                    <small>Loving care when you're not there.</small>
                    <div className="listContainer">
                        <div className="links">
                            <div className="fakeLink href" onClick={() => setActiveList("locations")}>Locations</div>
                            <div className="fakeLink href" onClick={() => setActiveList("customers")}>Customers</div>
                            <div className="fakeLink href" onClick={() => setActiveList("employees")}>Employees</div>
                        </div>
                        <div className="listDisplay">
                            {components}
                        </div>
                    </div>
                </div>
            </DataStore>
        </div>
    )
}
```

## Advanced Abstraction

Now that each of the `showXXX()` functions return just a single, simple component _(i.e. no nested children)_ then you could simplify the dashboard even further. Remove the `activeList` state, and have the link click event directly set the component to be displayed.

This eliminates the need for the effect hook.

> **Instructor Note:** Do not apply this level of abstraction to your code if you are still unclear what is happening with the previous version of **`DashBoard`** above. The previous version is more explicit and you should continue to study that until you can analyze it in detail with a teammate or instructor.

```jsx
import React, { useState } from "react"
import { DataStore } from "./DataStore"
import { LocationList } from "./location/LocationList"
import { EmployeeList } from "./employee/EmployeeList"
import { CustomerList } from "./customer/CustomerList"
import { SearchBar } from "./search/SearchBar"
import { SearchResults } from "./search/SearchResults"
import "./Layout.css"
import "./Kennel.css"


export const Dashboard = () => {
    const [searchTerms, setTerms] = useState("")
    const [component, setComponent] = useState(<LocationList />)


    return (
        <div className="mainContainer">
            <DataStore>
                <div className="searchContainer">
                    <SearchBar setTerms={setTerms} />
                    <SearchResults searchTerms={searchTerms} />
                </div>
                <div className="dataContainer">
                    <h1>Nashville Kennels</h1>
                    <small>Loving care when you're not there.</small>
                    <div className="listContainer">
                        <div className="links">
                            <div className="fakeLink href" onClick={() => setComponent(<LocationList />)}>Locations</div>
                            <div className="fakeLink href" onClick={() => setComponent(<CustomerList />)}>Customers</div>
                            <div className="fakeLink href" onClick={() => setComponent(<EmployeeList />)}>Employees</div>
                        </div>
                        <div className="listDisplay">
                            {component}
                        </div>
                    </div>
                </div>
            </DataStore>
        </div>
    )
}
```
