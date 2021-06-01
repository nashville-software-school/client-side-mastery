# Listing Animals from the Database

Now it's time to get the animals data from the API and build the JSX for representing each animal object as HTML.

## Animal List

First, you need to define the animal list component. Note that the `AnimalContext` is imported from the **`AnimalProvider`** component.

> ##### `src/components/animal/AnimalList.js`

```jsx
import React, { useContext, useEffect } from "react"
import { AnimalContext } from "./AnimalProvider"
import "./Animal.css"

export const AnimalList = () => {
  // This state changes when `getAnimals()` is invoked below
  const { animals, getAnimals } = useContext(AnimalContext)

  //useEffect - reach out to the world for something
  useEffect(() => {
    console.log("AnimalList: useEffect - getAnimals")
    getAnimals()
  }, [])


  return (
    <section className="animals">
      {
        animals.map(animal => {
          return (
            <div className="animal" id={`animal--${animal.id}`}>
              <div className="animal__name">
                Name: { animal.name }
              </div>
              <div className="animal__breed">
                Breed: { animal.breed }
              </div>
            </div>
          )
        })
      }
    </section>
  )
}
```

## Breaking it Down

In the above component, you will notice a two new functions - special ones called "hooks" by the Facebook development team - `useContext()` and `useEffect()`.

### useContext Hook

The `useContext()` hook allows you to use data structures and functions that a parent provider component exposes.

```jsx
<Provider>  <-- Parent: Creates the data context
    <Layout>  <-- Child: Can use the data in the context
      <SideNav />  <-- Grandchild: Can use the data in the context
      <Content />  <-- Grandchild: Can use the data in the context
      <Footer />   <-- Grandchild: Can use the data in the context
    </Layout>
</Provider>
```

To start, you need to import the context object you created in the provider component so that the `useContext()` hook can access the objects it exposes.

```js
import { AnimalContext } from "./AnimalProvider"
```

Take a look at what your context returns again. It has three key/value pairs on the object is exposes to its children.

1. `animals` whose value will be an array of animal objects
1. `getAnimal` whose value is a function
1. `addAnimal` whose value is a function

```js
<AnimalContext.Provider value={{
    animals, getAnimals, addAnimal
}}>
    {props.children}
</AnimalContext.Provider>
```

You can then use the `useContext()` function in **any** descendant code - chid, grandchild, great-grandchild, etc. - to directly gain access to any of those keys.

If a descendant only wanted to display animal state, it would extract the function to get the animals from the API, and also the state variable.

```js
const { getAnimals, animals } = useContext(AnimalContext)
```

If another descendant had a form and button to add a new animal, it would extract only the function to create the new state in the API.

```js
const { addAnimal } = useContext(AnimalContext)
```

### useEffect Hook

The `useEffect()` hook allows the component to reach out into the world for anything that cannot be handled during render. In this case, it is the API call for the animals.


```js
useEffect(() => {
	getAnimals()
}, [])
```

 #### What is that empty array bracket?
 The **dependency array**.
 Logic within functions only occur when a function is invoked. Within a React component, `useEffect` is a function. After the return, `useEffect` is automatically invoked and since the dependency array is empty, it only runs the first time the component renders.

 You can include dependencies in the array to cause the useEffect to run additional times.

Be careful setting state within the `useEffect`. State changes cause a re-render. Re-render can invoke `useEffect` (depending on the dependency array values). This would result in an infinate loop.


Use the `.map()` array method to iterate the array of animals and generate HTML for each one.

```js
animals.map(animal => {
  return (
    <div className="animal" id={`animal--${animal.id}`}>
      <div className="animal__name">
        Name: { animal.name }
      </div>
      <div className="animal__breed">
        Breed: { animal.breed }
      </div>
    </div>
  )
})
```

## Wrap the AnimalList with Data

Now you need to refactor the **`Kennels`** component to use live data. Replace the animals route with the following.

> ##### `src/components/Kennels.js`
```jsx
<AnimalProvider>
    <AnimalList />
</AnimalProvider>
```

Be sure to import the required modules at the top of the file.

```js
import { AnimalProvider } from "./animal/AnimalProvider"
import { AnimalList } from "./animal/AnimalList"
```

Note that the <**AnimalList**> component is a child of the <**AnimalProvider**> component. It is crucial that you wrap components that need data with the provider component that exposes that data in JSX. You can wrap a component in as many providers as needed.
