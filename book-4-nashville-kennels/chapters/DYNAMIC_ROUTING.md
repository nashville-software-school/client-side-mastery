# Viewing Details in Modal

In this chapter, you will be learning how to use modals to display information. It could be details of a resource or a form for creating/editing something.

So far you are listing all employees, all animals, all customers, and all locations. By the end of the chapter, you will be able to click on one of the cards in the list view and only view the details of a specific item.

You are going to start with animals.

```js
import React from "react"
import { Button, Modal, ModalHeader, ModalBody, ModalFooter } from 'reactstrap';
import "./Animals.css"


export default ({ animal }) => (
    <>
        <section className="animal">
            <h3 className="animal__name"> { animal.name } </h3>
            <div className="animal__breed">{ animal.breed }</div>
            <button
                onClick={() => showAnimalDetails(animal)}
                >Details</button>
        </section>

        <Modal isOpen={modal} toggle={toggle} className={className}>
            <ModalHeader toggle={toggle}>
                { animal.name }
            </ModalHeader>
            <ModalBody>
                <div className="animal__breed">{ animal.breed }</div>
                <div className="animal__location">Location: { location.name }</div>
                <div className="animal__owner">Customer: { customer.name }</div>
            </ModalBody>
            <ModalFooter>
            <Button color="primary" onClick={toggle}>Do Something</Button>{' '}
            <Button color="secondary" onClick={toggle}>Cancel</Button>
            </ModalFooter>
        </Modal>
    </>
)
```

## Refactor Animal List

Since the specific details of an animals are no longer being displayed in the list view, you can remove the import of the customer and location data.

> ##### `/src/components/animal/AnimalList.js`

```js
// Remove these
import { LocationContext } from "../location/LocationProvider"
import { CustomerContext } from "../customer/CustomerProvider"
```

Then remove the context hooks to get the data arrays.

> ##### `/src/components/animal/AnimalList.js`

```js
// Remove these
const { locations } = useContext(LocationContext)
const { customers } = useContext(CustomerContext)
```

Remove the code that joined the data.

> ##### `/src/components/animal/AnimalList.js`

```js
// Remove these
const owner = customers.find(c => c.id === animal.customerId)
const clinic = locations.find(l => l.id === animal.locationId)
```

And remove the properties that you were sending to the **`Animal`** component. It should look like this now.

> ##### `/src/components/animal/AnimalList.js`

```js
animals.map(animal => {
    return <Animal key={animal.id} animal={animal} />
})
```

## New Animal Details Component

Create a new component in the animal directory which will be responsible for showing all the details of the animal. This information will be displayed in a modal.

> ##### `/src/components/animal/AnimalDetail.js`

```js
import React, { useContext, useState } from "react"
import { CustomerContext } from "../customer/CustomerProvider"
import { LocationContext } from "../location/LocationProvider"
import { AnimalContext } from "./AnimalProvider"
import { Button, Modal, ModalHeader, ModalBody, ModalFooter } from 'reactstrap';
import "./Animals.css"

export default (props) => {
    const { animals } = useContext(AnimalContext)
    const { locations } = useContext(LocationContext)
    const { customers } = useContext(CustomerContext)
    const [modal, setModal] = useState(false)

    const toggle = () => setModal(!modal)

    /*
        This line of code will be explained in the next
        section of the chapter.
    */
    const chosenAnimalId = parseInt(props.match.params.animalId, 10)

    const animal = animals.find(a => a.id === chosenAnimalId) || {}
    const customer = customers.find(c => c.id === animal.customerId) || {}
    const location = locations.find(l => l.id === animal.locationId) || {}

    return (
        <div>
            <Button color="danger" onClick={toggle}>{buttonLabel}</Button>
            <Modal isOpen={modal} toggle={toggle} className={className}>
                <ModalHeader toggle={toggle}>
                    { animal.name }
                </ModalHeader>
                <ModalBody>
                    <div className="animal__breed">{ animal.breed }</div>
                    <div className="animal__location">Location: { location.name }</div>
                    <div className="animal__owner">Customer: { customer.name }</div>
                </ModalBody>
                <ModalFooter>
                <Button color="primary" onClick={toggle}>Do Something</Button>{' '}
                <Button color="secondary" onClick={toggle}>Cancel</Button>
                </ModalFooter>
            </Modal>
        </div>
    )
}
```

## Create a New Dynamic Route

A dynamic route component is one that matches a pattern, instead of a static route.

> ##### `/src/components/ApplicationViews.js`

```js
<Route path="/animals/:animalId(\d+)" render={
    props => <AnimalDetails {...props} />
} />
```

This route will match any of the following URIs in the browser.

* `http://localhost:3000/animals/1`
* `http://localhost:3000/animals/42`
* `http://localhost:3000/animals/8`
* `http://localhost:3000/animals/70021`
* `http://localhost:3000/animals/319`

Notice the `:animalId` in the `path` attribute? What that does is capture the 1, 42, 8, 70021, 319, or **whatever number** is at the end of the route. The **`AnimalDetails`** component is the child component of this route, so by using this technique, that component now can access the number with the following property.

```js
const chosenAnimalId = props.match.params.animalId
```

## Try it Out

Now when you click on an animal's name in the list view, you should see your new animal detail view.

![image of animal detail view](./images/animal-details.gif)

## Practice: Locations

Your next task is to refactor your location components. On your location list, display the location name, the number of animals currently being treated, and the number of employees.

When you click the name of a location, you should be taken to a detail view that lists the names of all animals currently being treated, and the names of all employees working there.

> **Tip:** You don't need all of the fancy styling like you see below. Just get the information displayed.

![animation of location list and location details](./images/location-details.gif)