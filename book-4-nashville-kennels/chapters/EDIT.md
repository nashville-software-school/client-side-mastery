# Editing Animal Details

In this chapter, you are going to allow users to update the details of an animal.

## Controlled Components

> **React Documentation:** In HTML, form elements such as `<input>`, `<textarea>`, and `<select>` typically maintain their own state and update it based on user input. In React, mutable state is typically kept in the state property of components, and only updated with setState().
>
> We can combine the two by making the React state be the “single source of truth”. Then the React component that renders a form also controls what happens in that form on subsequent user input. An input form element whose value is controlled by React in this way is called a “controlled component”.


## Update Animal in Provider

In the animal provider component, add a new function that is responsible for sending an updated animal to the API. You can see that there is a method of PUT on the request. This is the HTTP method to be used when an existing resource needs to be replaced with one with different state.

> ##### `src/components/animal/AnimalProvider.js`

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

Make sure you expose this function to any children.

```jsx
<AnimalContext.Provider value={{
    animals, addAnimal, releaseAnimal, updateAnimal
}}>
    {props.children}
</AnimalContext.Provider>
```

## Edit Modal

Add a new modal to the search results component.

> ##### `src/components/search/SearchResults.js`

```jsx
<Modal isOpen={editModal} toggle={toggleEdit}>
    <ModalHeader toggle={toggleEdit}>
        { selectedAnimal.animal.name }
    </ModalHeader>
    <ModalBody>
        <AnimalForm key={selectedAnimal.animal.id} toggleEdit={toggleEdit} {...selectedAnimal} />
    </ModalBody>
</Modal>
```

Then add a new toggler function for the modal since you have two now.

```js
const [editModal, setEditModal] = useState(false)
const toggleEdit = () => setEditModal(!editModal)
```

## Animal Editing Form

Now you need a new form for editing an animal.

> ##### `src/components/animal/AnimalForm.js`

```jsx
import React, { useContext, useState } from "react"
import { AnimalContext } from "./AnimalProvider"
import { LocationContext } from "../location/LocationProvider"


export const AnimalForm = ({ animal, customer, toggleEdit }) => {
    const { locations } = useContext(LocationContext)
    const { updateAnimal } = useContext(AnimalContext)

    // Separate state variable to track the animal as it is edited
    const [ updatedAnimal, setAnimal ] = useState(animal)

    /*
        When changing a state object or array, always create a new one
        and change state instead of modifying current one
    */
    const handleControlledInputChange = (event) => {
        const newAnimal = Object.assign({}, updatedAnimal)
        newAnimal[event.target.name] = event.target.value
        setAnimal(newAnimal)
    }

    const editAnimal = () => {
        const locationId = parseInt(updatedAnimal.locationId)

        if (locationId === 0) {
            window.alert("Please select a location")
        } else {
            updateAnimal({
                id: updatedAnimal.id,
                name: updatedAnimal.name,
                breed: updatedAnimal.breed,
                locationId: locationId,
                customerId: parseInt(localStorage.getItem("kennel_customer"))
            })
                .then(toggleEdit)
        }
    }

    return (
        <form className="animalForm">
            <fieldset>
                <div className="form-group">
                    <label htmlFor="name">Animal name: </label>
                    <input type="text" name="name" required autoFocus className="form-control"
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
                        defaultValue={animal.locationId}
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
                    <label htmlFor="customer">Customer:</label>
                    <input type="text" name="customer" disabled className="form-control"
                        defaultValue={customer.name}
                    />
                </div>
            </fieldset>
            <button type="submit" className="btn btn-primary"
                onClick={evt => {
                    evt.preventDefault()
                    editAnimal()
                }}>
                Save Updates
            </button>
        </form>
    )
}
```

## Practice: Edit Employees

Sometimes employees move, or change their names, or transfer to another location. Your job is to provide the ability to edit an employee's details.

1. Add an edit affordance to an employee HTML representation.
1. Then that button is clicked, show a modal with the employee's name, address, and current office location. Provide a Save button.
1. When the save button is clicked, update the employee resource in the API.

