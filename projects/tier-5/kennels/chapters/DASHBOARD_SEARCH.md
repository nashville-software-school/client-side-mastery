# Searching Animals

Right now, the list of animals displays the entire animals collection currently stored in your application. In this chapter, you are going to be introduced to working with component state, which may be different than the application state or the API state.

You are going to implement a search feature where you can type in letters into a **`SearchBar`** component, and a sibling **`SearchResults`** component will display any animals that contain the letters you enter in. This means that the state of the **`SearchResults`** component will be different than the state of the application or API. It could only display 2 animals, whereas there are 20 animals total.

## New State for Animal Provider

Right now, the only state in your animal provider is **all** of the animals. The array of animals is currently being stored in the `animals` state variable.

```js
const [ animals, setAnimals ] = useState([])
```

Since the goal of this code is to search the animals for specific ones, and what the user types into a search field is considered state, the **common component** is the animal provider and is therefore the place to store the search state. Add the state variable to your animal provider.

```js
const [ searchTerms, setSearchTerms ] = useState("")
```
Be sure to expose these methods via the AnimalContext.

Make sure to modify your return statement to include the new state variable and function.

```js
return (
    <AnimalContext.Provider value={
      {
      animals, addAnimal, getAnimals, getAnimalById, searchTerms, setSearchTerms
      }
    }>
      {props.children}
    </AnimalContext.Provider>
  )
```

## Create a Search Bar Component

A search feature on any site can easily be considered its own component. You will create a new component whose sole responsibility is to capture the text from the user. As the user types, you must immediately update the `searchTerms` state variable in the parent component.

##### **`src/components/animal/AnimalSearch.js`**

```jsx
import React, { useContext } from "react"
import { AnimalContext } from "./AnimalProvider"
import "./Animal.css"

export const AnimalSearch = () => {
  const { setSearchTerms } = useContext(AnimalContext)

  return (
    <>
      Animal search:
      <input type="text"
        className="input--wide"
        onKeyUp={(event) => setSearchTerms(event.target.value)}
        placeholder="Search for an animal... " />
    </>
  )
}
```

## Update AnimalList

Since the animal list needs to react when the user types something into the search field, two things must happen:

1. Get the `searchTerms` state from the provider.
2. Implement a `useEffect()` hook that will filter the animals to the ones that match what the user typed in.

##### **`src/components/animals/AnimalList.js`**

```jsx
import React, { useContext, useEffect, useState } from "react"
import { AnimalContext } from "./AnimalProvider"
import { AnimalDetail } from "./AnimalDetail"
import "./Animal.css"
import { useHistory } from "react-router-dom"

export const AnimalList = () => {
  const { animals, getAnimals, searchTerms } = useContext(AnimalContext)

  // Since you are no longer ALWAYS displaying all of the animals
  const [ filteredAnimals, setFiltered ] = useState([])
  const history = useHistory()

  // Empty dependency array - useEffect only runs after first render
  useEffect(() => {
      getAnimals()
  }, [])

  // useEffect dependency array with dependencies - will run if dependency changes (state)
  // searchTerms will cause a change
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
          return <AnimalDetail key={animal.id} animal={animal} />
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


<Route exact path="/animals">
    <AnimalSearch />
    <AnimalList />
</Route>
```

## Epilogue: How Can Sibling Components Communicate?

Unlike in vanilla JavaScript, you can't dispatch a custom message from one component and have a sibling component listen for the event and react to it. In the React library, all communication between sibling component **must go through their common ancestor**.

What is the common ancestor of the animal search component and the animal list component?

```jsx
<AnimalProvider>
  <Route exact path="/animals">
    <AnimalSearch />
    <AnimalList />
  </Route>
</AnimalProvider>
```

It's **`Route`**!

They are also children of **`AnimalProvider`**!

Don't forget about **`ApplicationViews`**!

So which parent component should contain the state that its two children will use?

It depends.

In this specific case, the AnimalProvider is a good choice since it already maintains `animals` state.
