# Individual Items with Nested Data

In this chapter, you are going to use one of the features of `json-server` to get nested data back from the API.

You are going to do this with animals.

## Getting the Nested Data

Since the animal detail component is responsible for showing data, and related data about an individual animal, you need a method in your provider to get all of that information for a single animal.

Add the following method to the animal provider. It allows any component to get a single animal, but with the location and customer objects embedded inside the response.

> ##### `/src/components/animal/AnimalProvider.js`

```js
const getAnimalById = (id) => {
    return fetch(`http://localhost:8088/animals/${id}?_expand=location&_expand=customer`)
    .then(res => res.json()) // note we don't set anything on state here. Why?
}
```
Be sure to include this method in the export of the provider
```js
<AnimalContext.Provider value={{
    animals, addAnimal, getAnimals, getAnimalById
    }}>
        {props.children}
</AnimalContext.Provider>
```

The response for an animal will include objects for the location and customer information.

```json
{
  "id": 2,
  "name": "Snickers",
  "breed": "Beagle",
  "locationId": 2,
  "treatment": "React Hook useEffect has a missing dependency: 'setDefaults'. Either include it or",
  "customerId": 4,
  "location": {
    "id": 2,
    "name": "Nashville South",
    "address": "209 Emory Drive"
  },
  "customer": {
    "email": "steve@stevebrownlee.com",
    "name": "Steve Brownlee",
    "id": 4
  }
}
```

The server (API) did the work for you!!

In fact, while we are at it, let's go ahead and refactor the GET for all animals to have it do the same nesting of the related data for us. 

```js
// adding an _expand for each animal's customer, like we just did for getting a single animal
const getAnimals = () => {
    return fetch("http://localhost:8088/animals?_expand=location&_expand=customer")
    .then(res => res.json())
    .then(setAnimals)
  }
```
Does this mean what you did back in the Multiple Resources chapter was wrong or useless? Not at all. It's a vital skill to be able to use JavaScript for extracting related data from different collections like that. But, since json-server gives us a way to make such comprehensive queries with `_expand`, why not make our lives easier?  

Just remember that in other situations ( like in the server side portion of NSS, or on the job ) you might not have a library like json-server. For that reason, knowing how to do the job with vanilla JS is key.

## AnimalCard inside of AnimalList Refactor

Now that we've refactored our animal get methods, we can change AnimalList to its more streamlined look from the first couple of chapters. 

> ##### `/src/components/animal/AnimalList.js`

```jsx
import React, { useContext, useEffect } from "react"
import { useHistory } from 'react-router-dom';
import { AnimalContext } from "./AnimalProvider"
import { AnimalCard } from "./AnimalCard"
import "./Animal.css"

export const AnimalList = () => {

    const { getAnimals, animals } = useContext(AnimalContext)
    const history = useHistory()

    // Initialization effect hook -> Go get animal data
    useEffect(()=>{
        getAnimals()
    }, [])

    return (
      <>
        <h1>Animals</h1>

        <button onClick={() => history.push("/animals/create")}>
          Add Animal
        </button>
        <div className="animals">
          {
            animals.map(animal => {
              return <AnimalCard key={animal.id} animal={animal} />
            })
          }
        </div>
      </>
    )
}
```
Change the AnimalCard to display animal names as hyperlinks. When you click on one animal name, an animal detail component will render.

Also refactor it to work with a single animal object instead of an animal, location, and customer. Now that we will have a detail view for an animal, we can wait to display the location and owner info there.

> ##### `/src/components/animal/Animal.js`

```jsx
import React from "react"
import "./Animal.css"
import { Link } from "react-router-dom"

export const AnimalCard = ({ animal }) => (
    <section className="animal">
        <h3 className="animal__name">
          <Link to={`/animals/detail/${animal.id}`}>
            { animal.name }
          </Link>
        </h3>
        <div className="animal__breed">{ animal.breed }</div>
    </section>
)
```

## New Animal Details Component

Create a new component in the animal directory which will be responsible for showing all the details of an animal. Consider the flow of a React component. What will you need to store as state? Will you need `useEffect`?

We will also include `useParams` from react-router-dom allowing the app to read a parameter from the URL.

> ##### `/src/components/animal/AnimalDetail.js`

```jsx
import React, { useContext, useEffect, useState } from "react"
import { AnimalContext } from "./AnimalProvider"
import "./Animal.css"
import { useParams } from "react-router-dom"

export const AnimalDetail = () => {
  const { getAnimalById } = useContext(AnimalContext)

	const [animal, setAnimal] = useState({})

	const {animalId} = useParams();

  useEffect(() => {
    console.log("useEffect", animalId)
    getAnimalById(animalId)
    .then((response) => {
      setAnimal(response)
    })
  }, [])

  return (
    <section className="animal">
      <h3 className="animal__name">{animal.name}</h3>
      <div className="animal__breed">{animal.breed}</div>
      {/* What's up with the question mark???? See below.*/}
      <div className="animal__location">Location: {animal.location?.name}</div>
      <div className="animal__owner">Customer: {animal.customer?.name}</div>
    </section>
  )
}
```
Immediate properties of an empty object will not break, however nested properties of an empty object will. Use [Optional chaining (?.)](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Optional_chaining) operator to prevent nested values from breaking the code. Try with and without the `?.`

## Create a New Dynamic Route

A dynamic route component is one that matches a pattern. Notice the route that renders **`AnimalDetail`**. The `animalId` is a parameter passed on the URL.

```js
<Route exact path="/animals/detail/:animalId(\d+)">
    <AnimalDetail />
</Route>
```

It has `:animalId(\d+)` at the end of the URL. If the URL is http://localhost:3000/animals/detail/3, the value of 3 will be stored in a variable named `animalId`. The variable can then be used inside **`AnimalDetail`**.

Look back at the code you put in the detail component.

See the `const {animalId} = useParams();`

This is how you access the number 3 inside the component. It's part of the routing package (react-router-dom) you installed. Don't worry, that one's tricky. We'll help you remember it.


Within ApplicationViews, add the route for animal details within the **AnimalProvider** component. You will need to support a route like the following.

http://localhost:3000/animals/7

> ##### `/src/components/ApplicationViews.js`

```js
<AnimalProvider>
   <Route exact path="/animals/detail/:animalId(\d+)">
		<AnimalDetail />
	</Route>
</AnimalProvider>
```
Hey, why isn't this wrapped in the customer and location providers, too? When you arrive at an answer to that, it will raise additional questions about why the other components ( AnimalList and AnimalCard ) _are_ nested in those providers. Do they need to be? Didn't we specifically set them up that way in earlier chapters? If so, why are we now questioning how we wrote the code earlier? Life's full of tough questions, innit?
As mentioned before, these questions get to the core of understanding how routing, nested components and data flow work in React. Don't hand wave this stuff. Ask anyone you can find to talk it out with you!

## Try it Out

Now when you click on an animal's name in the list view, you should see your new animal detail view.

![image of animal detail view](./images/animal-details.gif)

## Practice: Employees

Refactor your employee components. Start with a list of employee names that when clicked, displays the full details about an employee.

## Practice: Locations
Refactor your location components. Start with your location list and display the location name, the number of employees, and the number of animals currently being boarded for each location.

When you click the name of a location, you should be taken to a detail view that lists the names of all animals currently being boarded, and the names of all employees working there. You can use the json-server feature: `_embed`.

Your starting API call will look similar to this:

```js
http://localhost:8088/locations?_embed=employees_embed=animals

```

How do you return the information about one location?

> **Tip:** You don't need all of the fancy styling like you see below. Just get the information displayed.

![animation of location list and location details](./images/location-details.gif)
