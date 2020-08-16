# Data Providers in React

Your data providers have so far been fairly simple modules. They have a module-scoped data structure that is the raw data for a resource you are using in the application. They also include a few methods to get, create, edit, or delete data from the API state.

Here's some example vanilla JavaScript code for a data provider.

> **This is example VanillaJS code. Do not make this file in your app.**

> ##### `scripts/location/LocationProvider.js`

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

## Data Providers in React

In the React library, there is a feature called the Context API. This API provides you with two critical functions.

1. `createContext()` - Create the context to be used by other components that need data.
1. `useContext()` - Used by UI components that need data stored in the context, and exposed by the provider component.

The following data provider component serves the exact same purpose in a React application as the vanilla one above does. However, there are plenty of new keywords and statements that will be explained.

> ##### `src/components/location/LocationProvider.js`

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
export const LocationProvider = (props) => {
    const [locations, setLocations] = useState([])

    const getLocations = () => {
        return fetch("http://localhost:8088/locations")
            .then(res => res.json())
            .then(setLocations)
    }

    const addLocation = location => {
        return fetch("http://localhost:8088/locations", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(location)
        })
            .then(getLocations)
    }

    /*
        You return a context provider which has the
        `locations` state, the `addLocation` function,
        and the `getLocation` function as keys. This
        allows any child elements to access them.
    */
    return (
        <LocationContext.Provider value={{
            locations, addLocation, getLocations
        }}>
            {props.children}
        </LocationContext.Provider>
    )
}
```

## Breaking it Down

### Importing React Functions

This code imports the main React library, and two functions that it exports. These are special functions called hooks. You know something is a hook when it starts with the word _"use"_.


```js
import React, { useState, useEffect } from "react"
```

> **Definition:** `useState()` is what the React team calls a hook. It is used to store data about the component. You can translate its usage into English with the following statement.
>
> "My component has its own state to maintain. Therefore, I will use the State hook to store it."

> **Definition:** `useEffect()` is what the React team calls a hook. It is used to respond to changes in the component's state. You can translate its usage into English with the following statement.
>
> "When the user performs an action, and this component needs to do something in response to that action, I will use the Effect hook to define those responses."

### Defining a Data Context

A context stores a certain kind of data to be used in your application. Therefore, when you create a data provider component in React, you need to create a context.

```js
export const LocationContext = React.createContext()
```

Nothing is stored in the context when it's defined. At this point, it's just an empty warehouse waiting to be filled.

### Data Provider Component

Now that the required hooks are imported, and an empty context is created, it's time for you to define the data provider component that will allow other components to use the data in the context.

```js
export const LocationProvider = (props) => {

}
```

You need to define a single property for each provider that you define in your system. This is because the components that use the data must be defined as children components _(more about this in the next chapter)_, and React will send an object to each component. One of the properties on that object will be `children`, which contains the child elements.

### Defining Component State

Next, you will use the State hook to define a variable that holds the state of the component, **and** a function to be used to modify that state.

Yes, this is weird, and yes, it's hard to understand when you first see it.

```js
const [locations, setLocations] = useState([])
```

Here's what the State hook is doing for you with a single line of code.

```js
// Define the variable which will hold the data.
let locations = []

// Define the function to be used to modify that state.
const setLocations = locationData => {
    if (locationData !== null && Array.isArray(locationData)) {
        locations = locationData
    }
}
```

There is more code on their end that goes into it, but that's the basic gist. Instead of you having to write that code for each component, you can now write it in one line.

```js
const [animals, setAnimals] = useState([])
```

### State Transition Functions

Just like in your vanilla provider, you need some functions that perform state transitions in your database, and then ensure that the application state stays in sync.

```js
    const getLocations = () => {
        return fetch("http://localhost:8088/locations")
            .then(res => res.json())
            .then(setLocations)
    }

    const addLocation = location => {
        return fetch("http://localhost:8088/locations", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(location)
        })
            .then(getLocations)
    }
```

### Returning the Context for Usage

Now you can define what this component will expose to other components. All you really need to worry about understanding in this block of code is the two variables in the value attribute.

With the following code, other components can access the array of objects being stored in the `locations` variable, and they can invoke the `addLocation` function. You will see the syntax for using these in the next chapter.

```jsx
return (
    <LocationContext.Provider value={{
        locations, addLocation, getLocations
    }}>
        {props.children}
    </LocationContext.Provider>
)
```