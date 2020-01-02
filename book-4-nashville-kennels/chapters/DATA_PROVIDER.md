# Data Providers in React

Your data providers so far are fairly simple modules. They have a module-scoped data structure that is the raw data for a resource you are using in the application. They also include a few methods to get, create, edit, or delete data from the API state.

Here's some example vanilla JavaScript code for a data provider.

> #### `scripts/animal/AnimalProvider.js`

```js
const locations = []

const useLocations = () => locations.slice()

export const getLocations = () => {
    return fetch("http://localhost:8088/locations")
        .then(res => res.json())
        .then(parsedLocations => locations = parsedLocations)
}

export const addLocation = location => {
    return fetch("http://localhost:8088/locations", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(location)
    })
        .then(res => res.json())
        .then(getLocations)
}
```

> #### `src/components/animal/AnimalProvider.js`

```js
import React, { useState, useEffect } from "react"

/*
    The context is imported and used by individual components
    that need data
*/
export const LocationContext = React.createContext()

/*
 This component establishes what data can be used.
 */
export const LocationProvider = props => {
    const [locations, setLocations] = useState([])

    export const getLocations = () => {
        return fetch("http://localhost:8088/locations")
            .then(res => res.json())
            .then(parsedLocations => locations = parsedLocations)
    }

    export const addLocation = location => {
        return fetch("http://localhost:8088/locations", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(location)
        })
            .then(res => res.json())
            .then(getLocations)
    }

    /*
        Load all animals when the component is mounted. Ensure that
        an empty array is the second argument to avoid infinite loop.
    */
    useEffect(getLocations, [])

    useEffect(() => {
        console.log("****  LOCATION APPLICATION STATE CHANGED  ****")
    }, [locations])

    return (
        <AnimalContext.Provider value={{
            animals
        }}>
            {props.children}
        </AnimalContext.Provider>
    )
}
```