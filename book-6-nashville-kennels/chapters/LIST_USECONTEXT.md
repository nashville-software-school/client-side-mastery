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
      {console.log("AnimalList: Render", animals)}
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

Now go back to the browser and you should see a list of animals appear.

### Breaking it Down

In the above component, you will notice a two new hooks: `useContext` and `useEffect`.

The `useContext` hook allows you to use data structures and functions that a parent provider component exposes.

To start, you need to import the context object you created in the provider component so that the Context hook can access the objects it exposes.

```js
import { AnimalContext } from "./AnimalProvider"
```

The `useEffect` hook allows the component to reach out into the world for anything that cannot be handled during render. In this case, it is the API call for the animals.


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

Be sure to import at the top
```js
import { AnimalProvider } from "./animal/AnimalProvider"
import { AnimalList } from "./animal/AnimalList"
```

Note that the <**AnimalList**> component is a child of the <**AnimalProvider**> component. It is crucial that you wrap components that need data with the provider component that exposes that data in JSX. You can wrap a component in as many providers as needed.
