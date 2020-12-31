# Adding Animals with React

## Goal

In this chapter, you are going to write a component whose responsibility is to create a new animal record with a customer and location.

**You will need to have completed a `LocationProvider` and `CustomerProvider`** before this chapter.

## New Concepts

* useRef()
* Inline event handlers
* `preventDefault()` for forms
* `useHistory` from react-router-dom

## Process

### Add New Animal Button to List

In React, we add the event listener directly on a button's `onClick` attribute instead of writing it as a separate function in a component module.

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
			animals.map(animal => {
				return <AnimalCard key={animal.id} animal={animal} />
			})
        }
        </div>
    </>
)
```


### Create Route

Now create the route that will respond when the button click changes the URL to `/animals/create`.

**Consider: what data providers do we need?**

> ##### `src/components/ApplicationViews.js`

```jsx
<AnimalProvider>
  <Route exact path="/animals">
      <AnimalList />
  </Route>

  <CustomerProvider>
    <LocationProvider>
      <Route exact path="/animals/create">
        <AnimalForm />
      </Route>
    </LocationProvider>
  </CustomerProvider>
</AnimalProvider>

```

### Create Component

When you add an animal, you immediately want to assign that animal to a location and customer. Therefore, you want a dropdown list for all of the locations and another list for the customers. To get the data, you need to use the **`LocationProvider`** and **`CustomerProvider`** components along with the Context hooks for each.

> ##### `src/components/animal/AnimalForm.js`

```js
import React, { useContext, useRef, useEffect } from "react"
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
    With React, we do not target the DOM with `document.querySelector()`. Instead, our return (render) reacts to state or props

    We can create references that can be attached to the input fields in the form. This allows us to get the value of the input fields later once the save button is clicked.
    */

    const name = useRef(null)
    const location = useRef(null)
    const customer = useRef(null)

    const history = useHistory();

    /*
    Reach out to the world and get customers state
    and locations state on initialization.
    */
    useEffect(() => {
      getCustomers().then(getLocations)
    }, [])

    const handleClickNewAnimal = (event) => {
    event.preventDefault() //Prevent browser from submitting the form
    /*
      The `location` and `customer` variables below are
      the references attached to the input fields.
      In React, use `.currentValue` instead of `.value`
    */
    const locationId = parseInt(location.current.value)
    const customerId = parseInt(customer.current.value)

    if (locationId === 0) {
      window.alert("Please select a location")
    } else {
      //the following properties match with the database
      addAnimal({
        name: name.current.value,
        locationId,
        customerId
      })
        .then(() => history.push("/animals"))
      }
    }

    return (
      <form className="animalForm">
          <h2 className="animalForm__title">New Animal</h2>
          <fieldset>
              <div className="form-group">
                  <label htmlFor="animalName">Animal name: </label>
                  <input type="text" id="animalName" ref={name} required autoFocus className="form-control" placeholder="Animal name" />
              </div>
          </fieldset>
          <fieldset>
              <div className="form-group">
                  <label htmlFor="location">Assign to location: </label>
                  <select defaultValue="" name="location" ref={location} id="animalLocation" className="form-control" >
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
                  <label htmlFor="customer">Customer: </label>
                  <select defaultValue="" name="customer" ref={customer} id="customerAnimal" className="form-control" >
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
            onClick={handleClickNewAnimal}>
            Save Animal
          </button>
      </form>
    )
}
```
### Wrap it in the Provider Component

You should immediately see the following error.

```html
TypeError: Cannot read property 'locations' of undefined
```

This is because you imported the **`LocationProvider`** component and used the Context hook to get the data, but you forgot to make the **`EmployeeForm`** component a child of the **`LocationProvider`** component. Open **`ApplicationViews`** and make the change.

> ##### `src/components/ApplicationViews.js`

```jsx
<EmployeeProvider>
    <LocationProvider>
        <Route exact path="/employees" render={
            props => <EmployeeList {...props} />
        } />
        
        <Route exact path="/employees/create" render={
            props => <EmployeeForm {...props} />
            
    </LocationProvider>
</EmployeeProvider>
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
    .then(getAnimals)
}
```

### Show All Animals on Save

Once a new animal has been saved, you will route the user to `/animals`.



## Practice: Hire Employee

Write a component whose responsibility is to hire a new employee, assigned to a location.


### Create an EmployeeForm component.
* Create a route in ApplicationViews for /employees/create that renders an EmployeeForm.
* Add a button to the employee list labeled, "New Employee".
* When the button is clicked, show the employee form by using history.push() to change the route.
* The employee form should include an input for the name and a dropdown for the location.
* On `Save`, create a new employee object and POST it to the API. The employee object should include the locationId as a foreign key.
* Once the employee is saved, re-route the user to the list of employees.

### Practice: Open New locations
Write a component whose responsibility is to open a new location. This will follow a similar pattern.
