# Updating Animal Details

In this chapter, you are going to allow users to update an animal's name, location and customer. The edit button is only available from a "detail" view.

**WARNING:** Edit is hard. This chapter, and the component shown below, is _very complex_. It will take time to understand. We will do our best to walk through all the parts and the data flow, but be prepared to feel more confused than usual. There are several new concepts here.

## Controlled Components

> **React Documentation:** In HTML, form elements such as `<input>`, `<textarea>`, and `<select>` typically maintain their own state and update it based on user input. We then use something like `querySelector()` to get the values.

> In React, mutable state is typically kept in the state property of components, and only updated with `setState()`.

Since we start with data from the API, our `render` displays values based on current state (or props). We need to always keep the current value of an input in the component's state. This allows for mutable state.

An input form element whose value is controlled by React in this way is called a “controlled component”.


## Implementation

### Add PUT Method to Provider

Add the following function to your **`AnimalProvider`** component.
> ##### `/src/components/animal/AnimalProvider.js`
```js
const updateAnimal = animal => {
  return fetch(`http://localhost:8088/animals/${animal.id}`, {
    method: "PUT",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify(animal)
  })
    .then(getAnimals)
}
```
Expose the method via the AnimalContext.
```js
<AnimalContext.Provider value={{
    animals, addAnimal, getAnimals, getAnimalById, releaseAnimal, updateAnimal
}}>
    {props.children}
</AnimalContext.Provider>
```


### Editing Route

Add a new route in **`ApplicationViews`** for editing an animal. Consider what providers you will need. What data will be editable? Can we re-use the **`AnimalForm`**?

> ##### `/src/components/ApplicationViews.js`
```jsx

<Route path="/animals/edit/:animalId(\d+)">
    <AnimalForm />
</Route>
```

### Edit Button

Create a new button in the **`AnimalDetails`** component that redirects the user to the `/animals/edit/{id}` route so that the animal's details can be edited.

> ##### `/src/components/animal/AnimalDetail.js`
```jsx
<button onClick={() => {
    history.push(`/animals/edit/${animal.id}`)
}}>Edit</button>
```


### Edit The Form Component

**Consider:** What is different when we add an animal vs. edit? In edit mode, we should have an animalId in the URL. Otherwise, it is a new animal.

### Here is the flow of the AnimalForm component:

1. Component loads and renders - Save button should be disabled since the data is not available yet.
1. `useEffect()` invoked. For the dropdowns get data for locations and customers.
1. Determine if this is an `edit` based on `animalId` in the URL. If true, invoke `getAnimalById()` and then `setAnimal` state
1. Render (display new state in DOM)
1. User makes changes. As changes are made, state is updated. **The DOM always displays what is in state.**
1. Select `Save`
1. Invoke `handleSaveAnimal()`. This functions determines if this is a new animal or edit, prepares an object with the animal data and invokes the appropriate provider method (`addAnimal` or `updateAnimal`).
1. The `handleSaveAnimal` method will also `setIsLoading(true)` - this ensures the user cannot repeatedly click the button while the API is being updated.
1. Once the API has updated, change the view to display updated data


This component will populate the input fields with the current values from the API. We will obtain all necessary values using a `useEffect()` hook.

Replace the current contents of the **`AnimalForm`** component with the following code. You will walk through all of this code with your instruction team.

```js
import React, { useContext, useEffect, useState } from "react"
import { LocationContext } from "../location/LocationProvider"
import { AnimalContext } from "../animal/AnimalProvider"
import { CustomerContext } from "../customer/CustomerProvider"
import "./Animal.css"
import { useHistory, useParams } from 'react-router-dom';

export const AnimalForm = () => {
    const { addAnimal, getAnimalById, updateAnimal } = useContext(AnimalContext)
    const { locations, getLocations } = useContext(LocationContext)
    const { customers, getCustomers } = useContext(CustomerContext)

    //for edit, hold on to state of animal in this view
    const [animal, setAnimal] = useState({})
    //wait for data before button is active
    const [isLoading, setIsLoading] = useState(true);

    const {animalId} = useParams();
	  const history = useHistory();

    //when field changes, update state. This causes a re-render and updates the view.
    //Controlled component
    const handleControlledInputChange = (event) => {
      //When changing a state object or array,
      //always create a copy make changes, and then set state.
      const newAnimal = { ...animal }
      //animal is an object with properties.
      //set the property to the new value
      newAnimal[event.target.name] = event.target.value
      //update state
      setAnimal(newAnimal)
    }

    const handleSaveAnimal = () => {
      if (parseInt(animal.locationId) === 0) {
          window.alert("Please select a location")
      } else {
        //disable the button - no extra clicks
        setIsLoading(true);
        if (animalId){
          //PUT - update
          updateAnimal({
              id: animal.id,
              name: animal.name,
              locationId: parseInt(animal.locationId),
              customerId: parseInt(animal.customerId)
          })
          .then(() => history.push(`/animals/detail/${animal.id}`))
        }else {
          //POST - add
          addAnimal({
              name: animal.name,
              locationId: parseInt(animal.locationId),
              customerId: parseInt(animal.customerId)
          })
          .then(() => history.push("/animals"))
        }
      }
    }

    // Get customers and locations. If animalId is in the URL, getAnimalById
    useEffect(() => {
      getCustomers().then(getLocations).then(() => {
        if (animalId){
          getAnimalById(animalId)
          .then(animal => {
              setAnimal(animal)
              setIsLoading(false)
          })
        } else {
          setIsLoading(false)
        }
      })
    }, [])

    //since state controlls this component, we no longer need
    //useRef(null) or ref

    return (
      <form className="animalForm">
        <h2 className="animalForm__title">New Animal</h2>
        <fieldset>
          <div className="form-group">
            <label htmlFor="animalName">Animal name: </label>
            <input type="text" id="animalName" name="name" required autoFocus className="form-control"
            placeholder="Animal name"
            onChange={handleControlledInputChange}
            defaultValue={animal.name}/>
          </div>
        </fieldset>
        <fieldset>
          <div className="form-group">
            <label htmlFor="location">Assign to location: </label>
            <select value={animal.locationId} name="locationId" id="animalLocation" className="form-control" onChange={handleControlledInputChange}>
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
            <select value={animal.customerId} name="customerId" id="customerAnimal" className="form-control" onChange={handleControlledInputChange}>
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
          disabled={isLoading}
          onClick={event => {
            event.preventDefault() // Prevent browser from submitting the form and refreshing the page
            handleSaveAnimal()
          }}>
        {animalId ? <>Save Animal</> : <>Add Animal</>}</button>
      </form>
    )
}
```
## Practice Locations and Employees
Allow user to edit Locations and Employees.
1. Write out the flow of an edit form component in "words".
1. Plan the steps
1. Write small chunks of code and test for desired results.
