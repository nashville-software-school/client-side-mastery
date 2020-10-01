# Listing Animals from the Database

Now it's time to get the animal data from the API and then refactor the **`AnimalCard`** component to display the live data instead of it being hard-coded.

## Animal List

First, you need to define the animal list component. Note that the `AnimalContext` is imported from the **`AnimalProvider`** component.

> ##### `src/components/animal/AnimalList.js`

```js
import React, { useContext, useEffect } from "react"
import { AnimalContext } from "./AnimalProvider"
import { AnimalCard } from "./AnimalCard"
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
		<div className="animals">
		    {console.log("AnimalList: Render")}
        {
			animals.map(animal => {
				return <AnimalCard key={animal.id} location={animal.location.name} animal={animal} />
			})
        }
        </div>
    )
}
```

### Breaking it Down

In the above component, you will notice a new hook being imported from React - the Context hook. This hook allows you to use data structures and functions that a parent provider component exposes. 

To start, you need to import the context object you created in the provider component so that the Context hook can access the objects it exposes.

```js
import { AnimalContext } from "./AnimalProvider"
```

Define useEffect() to get the API data, which in turn updates state, and then re-renders the component.

```js
useEffect(() => {
		getAnimals()	
    }, [])
```

Use the `.map()` array method to iterate the array of animals and generate HTML for each one by invoking the **`AnimalCard`** component function.

```js
{
    animals.map(animal => <AnimalCard key={animal.id} animal={animal} />)
}
```

Note that even though it looks like you are specifying an HTML component, you are actually invoking a function. Also, the `key` and `animal` arguments look like HTML attributes here, but they actually become properties on an object that gets passed as an argument.

It is the equivalent of writing the following code.

```js
const properties = {
    key: animal.id,
    animal: animal
}

Animal(properties)
```

In React, that gets shortened to the following JSX.

```jsx
<AnimalCard key={animal.id} animal={animal} />
```

## Wrap the AnimalList with Data

Now you need to refactor the `AppicationViews` component to use live data. Replace the animals route with the following.

> ##### `src/components/ApplicationViews.js`
```js
<AnimalProvider>
    <Route exact path="/animals">
        <AnimalList />
    </Route>
</AnimalProvider> 
```

Be sure to import at the top
```js
import { AnimalProvider } from "./animal/AnimalProvider"
import { AnimalList } from "./animal/AnimalList"
```

Note that the <**AnimalList**> component is a child of the <**AnimalProvider**> component. It is crucial that you wrap components that need data with the provider component that exposes that data in JSX. You can wrap a component in as many providers as needed.


## AnimalCard

Refactor your **`AnimalCard`** component to use the data provided by the parent component of **`AnimalList`**.

> ##### `src/components/animal/AnimalCard.js`

```js
import React from "react"
import "./animal.css"

export const AnimalCard = ({ animal }) => (
    <section className="animal">
        <h3 className="animal__name">{animal.name}</h3>
        <address className="location__address">{animal.location.name}</address>
    </section>
)
```

Once all three of the components are complete, you should see the HTML representations of the animals in your API database.