# Keeping a Treatment History for Animals

In this chapter, you are going to allow users to update the treatment history of an animal. The treatment history should be displayed on the animal detail view, not on the card in the animal list.

**WARNING:** Edit is hard. This chapter, and the component that is shown below, is _very complex_ for beginners to comprehend. We will do our best to walk through all the parts and the data flow, but be prepared to feel more confused than usual. There are several new concepts thrown at you.

## Controlled Components

> **React Documentation:** In HTML, form elements such as `<input>`, `<textarea>`, and `<select>` typically maintain their own state and update it based on user input. In React, mutable state is typically kept in the state property of components, and only updated with setState().
>
> We can combine the two by making the React state be the “single source of truth”. Then the React component that renders a form also controls what happens in that form on subsequent user input. An input form element whose value is controlled by React in this way is called a “controlled component”.


## Implementation

### Update Existing Data

Add a new property `treatment` to each of the animals in your database. The value should be just an empty string for now.

```json
{
    "id": 3,
    "name": "Frisbee",
    "breed": "Schnauzer",
    "customerId": 3,
    "locationId": 1,
    "treatment": ""
}
```

### Add PUT Method to Provider

Add the following function to your **`AnimalProvider`** component.

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

### Edit Button

Create a new button in the **`AnimalDetails`** component that redirects the user to the `/animals/edit/{id}` route so that the animal's details can be edited.

```jsx
<div className="animal__owner">Customer: {customer.name}</div>

<button onClick={() => {
    props.history.push(`/animals/edit/${animal.id}`)
}}>Edit</button>
```

### Editing Route

Add a new route in **`ApplicationViews`** beneath the animal detail route, for editing an animal.

```jsx
<Route path="/animals/:animalId(\d+)" render={
    props => <AnimalDetails {...props} />
} />
<Route path="/animals/edit/:animalId(\d+)" render={
    props => <AnimalForm {...props} />
} />
```

### Edit Form Component

Replace the current contents of the **`AnimalForm`** component with the following code. You will walk through all of this code with your instruction team. It won't make sense for a while. It just takes time, practice, and patience.

```js
import React, { useContext, useState, useEffect } from "react"
import { AnimalContext } from "./AnimalProvider"
import { LocationContext } from "../location/LocationProvider"


export const AnimalForm = (props) => {
    // Use the required context providers for data
    const { locations, getLocations } = useContext(LocationContext)
    const { addAnimal, animals, updateAnimal, getAnimals } = useContext(AnimalContext)

    // Component state
    const [animal, setAnimal] = useState({})

    // Is there a a URL parameter??
    const editMode = props.match.params.hasOwnProperty("animalId")

    const handleControlledInputChange = (event) => {
        /*
            When changing a state object or array, always create a new one
            and change state instead of modifying current one
        */
        const newAnimal = Object.assign({}, animal)
        newAnimal[event.target.name] = event.target.value
        setAnimal(newAnimal)
    }

    /*
        If there is a URL parameter, then the user has chosen to
        edit an animal.
            1. Get the value of the URL parameter.
            2. Use that `id` to find the animal.
            3. Update component state variable.
    */
    const getAnimalInEditMode = () => {
        if (editMode) {
            const animalId = parseInt(props.match.params.animalId)
            const selectedAnimal = animals.find(a => a.id === animalId) || {}
            setAnimal(selectedAnimal)
        }
    }

    // Get animals from API when component initializes
    useEffect(() => {
        getAnimals()
        getLocations()
    }, [])

    // Once provider state is updated, determine the animal (if edit)
    useEffect(() => {
        getAnimalInEditMode()
    }, [animals])


    const constructNewAnimal = () => {
        const locationId = parseInt(animal.locationId)

        if (locationId === 0) {
            window.alert("Please select a location")
        } else {
            if (editMode) {
                updateAnimal({
                    id: animal.id,
                    name: animal.name,
                    breed: animal.breed,
                    locationId: locationId,
                    treatment: animal.treatment,
                    customerId: parseInt(localStorage.getItem("kennel_customer"))
                })
                    .then(() => props.history.push("/animals"))
            } else {
                addAnimal({
                    name: animal.name,
                    breed: animal.breed,
                    locationId: locationId,
                    treatment: animal.treatment,
                    customerId: parseInt(localStorage.getItem("kennel_customer"))
                })
                    .then(() => props.history.push("/animals"))
            }
        }
    }

    return (
        <form className="animalForm">
            <h2 className="animalForm__title">{editMode ? "Update Animal" : "Admit Animal"}</h2>
            <fieldset>
                <div className="form-group">
                    <label htmlFor="name">Animal name: </label>
                    <input type="text" name="name" required autoFocus className="form-control"
                        proptype="varchar"
                        placeholder="Animal name"
                        defaultValue={animal.name}
                        onChange={handleControlledInputChange}
                    />
                </div>
            </fieldset>
            <fieldset>
                <div className="form-group">
                    <label htmlFor="breed">Animal breed: </label>
                    <input type="text" name="breed" required className="form-control"
                        proptype="varchar"
                        placeholder="Animal breed"
                        defaultValue={animal.breed}
                        onChange={handleControlledInputChange}
                    />
                </div>
            </fieldset>
            <fieldset>
                <div className="form-group">
                    <label htmlFor="locationId">Location: </label>
                    <select name="locationId" className="form-control"
                        proptype="int"
                        value={animal.locationId}
                        onChange={handleControlledInputChange}>

                        <option value="0">Select a location</option>
                        {locations.map(e => (
                            <option key={e.id} value={e.id}>
                                {e.name}
                            </option>
                        ))}
                    </select>
                </div>
            </fieldset>
            <fieldset>
                <div className="form-group">
                    <label htmlFor="treatment">Treatments: </label>
                    <textarea type="text" name="treatment" className="form-control"
                        proptype="varchar"
                        value={animal.treatment}
                        onChange={handleControlledInputChange}>
                    </textarea>
                </div>
            </fieldset>
            <button type="submit"
                onClick={evt => {
                    evt.preventDefault()
                    constructNewAnimal()
                }}
                className="btn btn-primary">
                {editMode ? "Save Updates" : "Make Reservation"}
            </button>
        </form>
    )
}
```