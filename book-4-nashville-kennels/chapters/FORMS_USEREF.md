# Adding Animals with React

## Goal

In this chapter, you are going to write a component whose responsibility is to create a new animal record with a location.

**You will need to have completed a `LocationProvider` and `CustomerProvider`** before this chapter.

## New Concepts

* useRef()
* Inline event handlers
* `preventDefault()` for forms
* `useHistory` from react-router-dom

## Process

### Add New Animal Button to List

In React, you can add the event listener directly on a button's `onClick` attribute instead of writing it as a separate function in the component module.

> ##### `src/components/animal/AnimalList.js`

```jsx
const history = useHistory()

return (
    <div className="animals">
        <h2>Animals</h2>
			<button onClick={() => {history.push("/animals/create")}}>
                Add Animal
        	</button>
         {
			animals.map(animal => {
				return <AnimalCard key={animal.id} animal={animal} />
			})
        }
    </div>
)
```

`useHistory` is provided by react-router-dom method contains a method `push()`. We can use it to change the URL. Be sure to import it at the top of the document.


### Create Route

Now you can create the route that will respond when the button click changes the URL to `/animals/create`.

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

When you add an animal, you immediately want to assign that animal to a location and customer. Therefore, you want a dropdown list for all of the locations and another list for the customers. To get all of the locations, you need to use the **`LocationProvider`** and **`CustomerProvider` components, and the Context hooks for each.

> ##### `src/components/animal/AnimalForm.js`

```js
mport React, { useContext, useRef, useEffect } from "react"
import { LocationContext } from "../location/LocationProvider"
import { AnimalContext } from "../animal/AnimalProvider"
import { CustomerContext } from "../customer/CustomerProvider"
import "./Animal.css"
import { useHistory } from 'react-router-dom';

export const AnimalForm = (props) => {
    const { addAnimal } = useContext(AnimalContext)
    const { locations, getLocations } = useContext(LocationContext)
    const { customers, getCustomers } = useContext(CustomerContext)

    /*
        Create references that can be attached to the input
        fields in the form. This will allow you to get the
        value of the input fields later when the user clicks
        the save button.

        No more `document.querySelector()` in React.
    */
    const name = useRef(null)
    const location = useRef(null)
    const customer = useRef(null)

    /*
        Get animal state and location state on initialization.
    */
    useEffect(() => {
       getCustomers().then(getLocations)
    }, [])

    const constructNewAnimal = () => {
        /*
            The `location` and `customer` variables below are
            the references attached to the input fields. You
            can't just ask for the `.value` property directly,
            but rather `.current.value` now in React.
        */
        const locationId = parseInt(location.current.value)
        const customerId = parseInt(customer.current.value)

        if (locationId === 0) {
            window.alert("Please select a location")
        } else {
            addAnimal({
                name: name.current.value,
                locationId,
                customerId
            })
            .then(() => history.push("/animals"))
        }
    }

	const history = useHistory();
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
            <button type="submit"
                onClick={evt => {
                    evt.preventDefault() // Prevent browser from submitting the form
                    constructNewAnimal()
                }}
                className="btn btn-primary">
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
        .then(getAnimals)
}
```

### Show All Animals on Save

Once a new animal has been saved, you will route the user to `/animals`.