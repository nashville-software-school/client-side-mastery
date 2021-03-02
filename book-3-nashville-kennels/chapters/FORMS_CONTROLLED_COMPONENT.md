# Adding Animals with React

## Goal

In this chapter, you are going to write a component whose responsibility is to create a new animal record with a customer and location.

**You will need to have completed a `LocationProvider` and `CustomerProvider`** before this chapter.

## New Concepts

* Controlled component
* Inline event handlers
* `preventDefault()` for forms
* `useHistory` from react-router-dom

**Review:** Object Bracket Notation - [Working with Objects](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Working_with_Objects)

React state will be the “single source of truth” for the form inputs. The component will render the form based on state and then control what happens in that form on subsequent user input.

## Process
Refactor the AnimalList component to include an *Add Animal* button that will change the url and render a form component.

### Add the *Add Animal* button to the list component with an inline event handler

In React, we add event listeners directly on a button's `onClick` attribute.

`useHistory` is provided by react-router-dom. It contains a method, `push()` which we can use to change the URL. Be sure to import it at the top of the document.

> ##### `src/components/animal/AnimalList.js`

```jsx
const history = useHistory()

return (
    <>
        <h2>Animals</h2>
		<button onClick={() => {history.push("/animals/create")}}>
            Add Animal
        </button>
        <div className="animals">
        {
		Your map over all the animals goes here!
        }
        </div>
    </>
)
```


### Create the Route

Create the new route that will respond when the button click changes the URL to `/animals/create`.

**Consider: What data providers do you need?**

> ##### `src/components/ApplicationViews.js`

```jsx
<AnimalProvider>
  <CustomerProvider>
    <LocationProvider>
      <Route exact path="/animals">
         <AnimalList />
      </Route>
      <Route exact path="/animals/create">
        <AnimalForm />
      </Route>
    </LocationProvider>
  </CustomerProvider>
</AnimalProvider>

```

### Create the Form Component

When you add an animal, you immediately want to assign that animal to a location and customer. Therefore, you will want a dropdown list of all the locations and another list of the customers. To get the data, use the **`LocationProvider`** and **`CustomerProvider`** components along with the Context hooks for each.

> ##### `src/components/animal/AnimalForm.js`

```js
import React, { useContext, useEffect, useState } from "react"
import { LocationContext } from "../location/LocationProvider"
import { AnimalContext } from "../animal/AnimalProvider"
import { CustomerContext } from "../customer/CustomerProvider"
import "./Animal.css"
import { useHistory } from 'react-router-dom';

export const AnimalForm = () => {
    const { addAnimal } = useContext(AnimalContext)
    const { locations, getLocations } = useContext(LocationContext)
    const { customers, getCustomers } = useContext(CustomerContext)

    /*
    With React, we do not target the DOM with `document.querySelector()`. Instead, our return (render) reacts to state or props.

    Define the intial state of the form inputs with useState()
    */

    const [animal, setAnimal] = useState({
      name: "",
      locationId: 0,
      customerId: 0
    });

    const history = useHistory();

    /*
    Reach out to the world and get customers state
    and locations state on initialization.
    */
    useEffect(() => {
      getCustomers().then(getLocations)
    }, [])

    //when a field changes, update state. The return will re-render and display based on the values in state
    //Controlled component
    const handleControlledInputChange = (event) => {
      /* When changing a state object or array,
      always create a copy, make changes, and then set state.*/
      const newAnimal = { ...animal }
      /* Animal is an object with properties.
      Set the property to the new value
      using object bracket notation. */
      newAnimal[event.target.id] = event.target.value
      // update state
      setAnimal(newAnimal)
    }

    const handleClickSaveAnimal = (event) => {
      event.preventDefault() //Prevents the browser from submitting the form

      const locationId = parseInt(animal.locationId)
      const customerId = parseInt(animal.customerId)

      if (locationId === 0) {
        window.alert("Please select a location")
      } else {
        //invoke addAnimal passing animal as an argument.
        //once complete, change the url and display the animal list
        addAnimal(animal)
        .then(() => history.push("/animals"))
      }
    }

    return (
      <form className="animalForm">
          <h2 className="animalForm__title">New Animal</h2>
          <fieldset>
              <div className="form-group">
                  <label htmlFor="name">Animal name:</label>
                  <input type="text" id="name" onChange={handleControlledInputChange} required autoFocus className="form-control" placeholder="Animal name" value={animal.name}/>
              </div>
          </fieldset>
          <fieldset>
              <div className="form-group">
                  <label htmlFor="location">Assign to location: </label>
                  <select defaultValue={animal.locationId} name="locationId" id="locationId" className="form-control" >
                      <option value="0">Select a location</option>
                      {locations.map(l => (
                          <option key={l.id} value={l.id}>
                              {l.name}
                          </option>
                      ))}
                  </select>
              </div>
          </fieldset>
          <fieldset>
              <div className="form-group">
                  <label htmlFor="customerId">Customer: </label>
                  <select defaultValue={animal.customerId} name="customer" id="customerId" className="form-control" >
                      <option value="0">Select a customer</option>
                      {customers.map(c => (
                          <option key={c.id} value={c.id}>
                              {c.name}
                          </option>
                      ))}
                  </select>
              </div>
          </fieldset>
          <button className="btn btn-primary"
            onClick={handleClickSaveAnimal}>
            Save Animal
          </button>
      </form>
    )
}
```

### Provider Function to Save Animal

Now it is time for you to save your animal. First, create a function in your provider to perform the fetch operation.

```js
const addAnimal = animal => {
    return fetch("http://localhost:8088/animals", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(animal)
    })
    .then(response => response.json())
}
```

### Show All Animals on Save

Notice that once a new animal has been saved(handleClickSaveAnimal), the app is routed to `/animals`.

The `/animals` route renders the **`<AnimalsList >`** component which invokes `getAnimals`


## Practice: Hire Employee

Write a component whose responsibility is to hire a new employee and assign to a location.

### Create an EmployeeForm component.
* Create a route in ApplicationViews for /employees/create that renders an EmployeeForm.
* Add a button to the employee list labeled, "New Employee".
* When the button is clicked, show the employee form by using history.push() to change the route.
* The employee form should include an input for the name and a dropdown for the location.
* On `Save`, create a new employee object and POST it to the API. The employee object should include the locationId as a foreign key.
* Once the employee is saved, re-route the user to the list of employees.

## Practice: Open New locations
Write a component whose responsibility is to open a new location. This will follow a similar pattern.
