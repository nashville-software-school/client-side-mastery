# Searching Animals

Right now, the list of animals just displays the entire  animals collection currently stored in your application. In this chapter, you are going to be introduced to working with component state, which may be different than the application state or the API state.

You are going to implement a search feature where you can type in letters into a **`SearchBar`** component, and a sibling **`SearchResults`** component will display any animals that contain the letters you enter in. This means that the state of the **`SearchResults`** component will be different than the state of the application or API. It could only display 2 animals, whereas there are 20 animals total.

## New State for Animal Provider

Right now, the only state in your animal provider is **all** of the animals. The array of animals is currently being stored in the `animals` state variable.

```js
const [ animals, setAnimals ] = useState([])
```

Since the goal of this code is to search the animals for specific ones, and what the user is going to type into a search field is considered state, then the animal provider is a place to store that state. Add the state variable below to your animal provider.

```js
const [ searchTerms, setTerms ] = useState("")
```

## Create a Search Bar Component

A search feature on any site can easily be considered its own component, so you will create a new component whose sole responsibility is to capture the text from the user. As the user types, you must immediately update the `searchTerms` state variable in the parent component.

##### **`src/components/animal/AnimalSearch.js`**

```jsx
import React, { useContext } from "react"
import { AnimalContext } from "./AnimalProvider"
import "./Animals.css"

export const AnimalSearch = (props) => {
    const { setSearch } = useContext(AnimalContext)

    return (
        <>
            Animal search:
            <input type="text"
                className="input--wide"
                onKeyUp={
                    (keyEvent) => setSearch(keyEvent.target.value)
                }
                placeholder="Search for an animal... " />
        </>
    )
}
```

## Update AnimalList

Since the animal list needs to react when the user types something into the search field, you need to do two things:

1. Get the `searchTerms` state from the provider.
2. Implement a `useEffect()` hook the will filter the animals to ones that match what the user typed in.

##### **`src/components/animals/AnimalList.js`**

```jsx
import React, { useState, useContext, useEffect } from "react"
import { AnimalContext } from "./AnimalProvider"
import { Animal } from "./Animal"
import "./Animals.css"

export const AnimalList = ({ history }) => {
    const { animals, searchTerms } = useContext(AnimalContext)

    /*
        Since you are no longer ALWAYS going to be displaying all animals
    */
    const [ filteredAnimals, setFiltered ] = useState([])

    /*
        This effect hook function will run when the following two state changes happen:
            1. The animal state changes. First when it is created, then once you get the animals from the API
            2. When the search terms change, which happens when the user types something in the AnimalSearch component
    */
    useEffect(() => {
        if (searchTerms !== "") {
            // If the search field is not blank, display matching animals
            const subset = animals.filter(animal => animal.name.toLowerCase().includes(searchTerms))
            setFiltered(subset)
        } else {
            // If the search field is blank, display all animals
            setFiltered(animals)
        }
    }, [searchTerms, animals])

    return (
        <>
            <h1>Animals</h1>

            <button onClick={() => history.push("/animals/create")}>
                Make Reservation
            </button>
            <div className="animals">
                {
                    filteredAnimals.map(animal => {
                        return <Animal key={animal.id} animal={animal} />
                    })
                }
            </div>
        </>
    )
}
```

## Update ApplicationViews to Include Search

Now, when the application URL is http://localhost:3000/animals, you will render both the animal search component **and** animal list component.

##### **`src/components/ApplicationViews.js`**

```jsx
import { AnimalSearch } from "./animal/AnimalSearch"


<Route exact path="/animals" render={
    props => <>
        <AnimalSearch />
        <AnimalList {...props} />
    </>
} />
```

## Epilogue: How Can Sibling Components Communicate?

Unlike in vanilla JavaScript, you can't dispatch a custom message from one component and have a sibling component listen for that event and react to it. In the React library, all communication between sibling component **must go through their common ancestor**.

What is the common ancestor of the animal search component and the animal list component?

```jsx
<AnimalProvider>
    <LocationProvider>
        <CustomerProvider>
            <Route exact path="/animals" render={
                props => {
                    return <>
                        <AnimalSearch />
                        <AnimalList {...props} />
                    </>
                }
            } />
            <Route exact path="/animals/create" render={
                props => <AnimalForm {...props} />
            } />
            <Route path="/animals/:animalId(\d+)" render={
                props => <AnimalDetails {...props} />
            } />
            <Route path="/animals/edit/:animalId(\d+)" render={
                props => <AnimalForm {...props} />
            } />
        </CustomerProvider>
    </LocationProvider>
</AnimalProvider>
```

It's **`Route`**!

It's also **`CustomerProvider`**!

And **`LocationProvider`**!

They are also children of **`AnimalProvider`**!

Don't forget about **`ApplicationViews`**!

So which parent component should contain the state that its two children will use?

It depends.

In this specific case, the animal provider makes the most sense since that component has the responsibiity of maintaining animal state already. This is just a different kind of state about animals - the one the user is searching for.
