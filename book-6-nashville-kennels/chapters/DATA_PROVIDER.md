# Data Providers in React

Your data providers have so far been fairly simple modules. They have a module-scoped data structure that contains the raw data for a resource used within the application. They also include a few methods: get, create, edit, or delete data from the API.

Here's an example vanilla JavaScript module for a data provider.

> **This is example VanillaJS code. Do not make this file in your app.**

> ##### `scripts/animal/AnimalProvider.js`

```js
const animals = []

const useAnimals = () => animals.slice()

export const getAnimals = () => {
    return fetch("http://localhost:8088/animals?_expand=location")
        .then(res => res.json())
        .then(parsedAnimals => animals = parsedAnimals)
}

export const addAnimal = animalObj => {
    return fetch("http://localhost:8088/animals", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(animalObj)
    })
    .then(getAnimals)
}
```

## Data Providers in React

In the React library, there is a feature called the Context API. This API provides you with two critical functions.

1. `createContext()` - Create the context to be used by other components that need data.
1. `useContext()` - Used by UI components that need data stored in the context, and exposed by the provider component.

The following React data provider component serves the exact same purpose as the vanilla one above. However, there are plenty of new keywords and statements that will be explained.

> ##### `src/components/animal/AnimalProvider.js`

```js
import React, { useState, createContext } from "react"

// The context is imported and used by individual components that need data
export const AnimalContext = createContext()

// This component establishes what data can be used.
export const AnimalProvider = (props) => {
    const [animals, setAnimals] = useState([])

    const getAnimals = () => {
        return fetch("http://localhost:8088/animals?_expand=location")
        .then(res => res.json())
        .then(setAnimals)
    }

    const addAnimal = (animalObj) => {
        return fetch("http://localhost:8088/animals", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(animalObj)
        })
        .then(getAnimals)
    }

    /*
        You return a context provider which has the
        `animals` state, `getAnimals` function,
        and the `addAnimal` function as keys. This
        allows any child elements to access them.
    */
    return (
        <AnimalContext.Provider value={{
            animals, getAnimals, addAnimal
        }}>
            {props.children}
        </AnimalContext.Provider>
    )
}
```

## Breaking it Down

### Importing React Functions

This code imports the main React library, and two functions that it exports.

```js
import React, { useState, createContext } from "react"
```
We will `useState` to hold and set the array of animals.


### Defining a Data Context

A context stores a certain kind of data to be used in your application. Therefore, when you create a data provider component in React, you need to create a context.

```js
export const AnimalContext = createContext()
```

Nothing is stored in the context when it's defined. At this point, it's just an empty warehouse waiting to be filled.

### Data Provider Component

Now that the required functions are imported, and an empty context is created, it's time to define the data provider component that will allow other components to use the data in the context.

```js
export const AnimalProvider = (props) => {

}
```

You define a single property for each provider defined in your system. This is because the components that uses the data must be defined as children components _(more about this in the next chapter)_, and React will send an object to each component. One of the properties on that object will be `children`, which contains the child elements.

### Defining State Within a Component

Next, you will use the `useState()` hook to define a variable that holds the state of the component, **and** a function that updates it.

```js
const [animals, setAnimals] = useState([])
```


Here's what the State hook is doing for you with a single line of code.

```js
// Define the variable which will hold the data.
let animals = []

// Define the function to be used to modify that state.
const setAnimals = animalsData => {
    if (animalsData !== null && Array.isArray(animalsData)) {
        animals = animalsData
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
    const getAnimals = () => {
        return fetch("http://localhost:8088/animals?_expand=location")
        .then(res => res.json())
        .then(setAnimals)
    }

    const addAnimal = animalObj => {
        return fetch("http://localhost:8088/animals", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(animalObj)
        })
        .then(getAnimals)
    }
```

### Returning the Context for Usage

Now you define what this component will expose to other components. All you need to worry about understanding in this block of code are the variables in the value attribute.

With the following code, other components can access the array of objects being stored in the `animals` variable, and they can invoke the, `getAnimal` and `addAnimal` functions. You will see the syntax for using these in an upcoming chapter.

```jsx
return (
    <AnimalContext.Provider value={{
        animals, getAnimals, addAnimal
    }}>
        {props.children}
    </AnimalContext.Provider>
)
```
