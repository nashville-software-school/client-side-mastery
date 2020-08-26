# Location Details with Event Payloads

Your next task is to refactor your location components. On your location list, display the location name, the number of animals currently being treated, and the number of employees.

When you click the name of a location, you should be taken to a detail view that lists the names of all animals currently being treated, and the names of all employees working there.

## Data Payloads with Custom Events

Recall that when you dispatch a custom event, you could send data along with that event. In the example below, you are passing an object with a key of `entry` and a value of an entry object along with the event.

```js
const entryChosen = new CustomEvent("entryChosen", {
    detail: {
        entry: { id: 1, title: "React routes", mood: "Sad" }
    }
})
```

## Data Payloads with Router State

You can achieve the same goal by using React Router. There are two mechanisms to pay attention to in the modules below. In the location detail component immediately below, you are accessing data that got sent from another component.

They common link between them is the `chosenLocation` property. Here, you are accessing that key on the following object.

```js
props.location.state
```

Then read below in the Passing State section about how you can add the `chosenLocation` key to the state object in a different component.

> ##### `/src/components/location/LocationDetail.js`

```jsx
import React, { useState } from "react"
import "./Locations.css"

export const LocationDetail = (props) => {
    return (
        <section className="location">
            <h2 className="location__name">{props.location.state.chosenLocation.name}</h2>
            <address className="location__address">{props.location.state.chosenLocation.address}</address>
            <div>
                <h4>Employees</h4>
                { props.location.state.chosenLocation.employees.map(e => e.name).join(", ") }
            </div>
            <div>
                <h4>Current Residents</h4>
                {
                    props.location.state.chosenLocation.animals.map(a => a.name).join(", ")
                }
            </div>
        </section>
    )
}
```

## A New Route

> ##### `/src/components/ApplicationViews.js`

```jsx
<LocationProvider>
    <Route path="/locations/:locationId(\d+)" render={
        props => <LocationDetail {...props} />
    } />
</LocationProvider>
```

## Passing State

Now here's the component where you can pass state. Go ahead and make your location list look like the code below, but then focus on the following part of it.

```jsx
<Link className="card-link"
    to={{
        pathname: `/locations/${location.id}`,
        state: { chosenLocation: location }
    }}>
    <h2 className="card-title">{location.name}</h2>
</Link>
```

What the above code snippet above does is create a hyperlink that not only changes the URL to something like http://localhost:3000/locations/3 but also sends a data payload of...

```js
{
    chosenLocation: location
}
```

> ##### `/src/components/location/LocationList.js`

```jsx
import React, { useContext, useEffect } from "react"
import { EmployeeContext } from "../employee/EmployeeProvider"
import { LocationContext } from "./LocationProvider"
import { AnimalContext } from "../animal/AnimalProvider"
import { Link } from "react-router-dom"
import "./Locations.css"

export const LocationList = () => {
    const { locations, getLocations } = useContext(LocationContext)
    const { employees, getEmployees } = useContext(EmployeeContext)
    const { animals, getAnimals } = useContext(AnimalContext)

    useEffect(() => {
        getLocations().then(getEmployees).then(getAnimals)
    }, [])

    return (
        <div className="locations">
            {
                locations.map(location => {
                    location.employees = employees.filter(e => e.locationId === location.id)
                    location.animals = animals.filter(a => a.locationId === location.id)

                    return <article key={`location--${location.id}`} className="card location" style={{ width: `18rem` }}>
                        <section className="card-body">

                            <Link className="card-link"
                                to={{
                                    pathname: `/locations/${location.id}`,
                                    state: { chosenLocation: location }
                                }}>
                                <h2 className="card-title">{location.name}</h2>
                            </Link>
                        </section>
                        <section>
                            {`${location.employees.length} ${location.employees.length === 1 ? "employee" : "employees"}`}
                        </section>
                        <section>
                            {`${location.animals.length} ${location.animals.length === 1 ? "animal" : "animals"}`}
                        </section>
                    </article>
                })
            }
        </div >
    )
}
```


![animation of location list and location details](./images/location-details.gif)