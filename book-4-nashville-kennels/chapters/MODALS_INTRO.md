# Viewing Details in Modal

In this chapter, you will be learning how to use modals to display information. It could be details of a resource or a form for creating/editing something.

## Setup

Visit the [Reactstrap homepage](https://reactstrap.github.io/) and follow the instructions to get it installed for your project.

## Using the Modal

So far you are listing all employees, all animals, all customers, and all locations. By the end of the chapter, you will be able to click on one of the cards in the list view and only view the details of a specific item.

You are going to start with animals.

In the code below, you will notice that a new `<button>` element has been added to the animal section. The `onClick` attribute specifies that the `toggle()` function will be invoked when the user clicks on it.

Then the ReactStrap `<Modal>` component will display because the `modal` state will be changed from `false` to `true` when the button is clicked.

```js
import React, { useState } from "react"
import { Button, Modal, ModalHeader, ModalBody, ModalFooter } from 'reactstrap'

export default ({ animal, customer, location }) => {
    const [modal, setModal] = useState(false)
    const toggle = () => setModal(!modal)

    return (
        <>
            <section className="animal">
                <h3 className="animal__name">{animal.name}</h3>
                <button onClick={toggle}>Details</button>
            </section>

            <Modal isOpen={modal} toggle={toggle}>
                <ModalHeader toggle={toggle}>
                    {animal.name}
                </ModalHeader>
                <ModalBody>
                    <div className="animal__breed">
                        <label className="label--animal">Breed:</label> {animal.breed}
                    </div>
                    <div className="animal__location">
                        <label className="label--animal">Location:</label> {location.name}
                    </div>
                    <div className="animal__owner">
                        <label className="label--animal">Customer:</label> {customer.name}
                    </div>
                </ModalBody>
                <ModalFooter>
                    <Button color="secondary" onClick={toggle}>Close</Button>
                </ModalFooter>
            </Modal>
        </>
    )
}
```

## Practice: Employees

In the list of employees, only show the employee name with a details button. When the user clicks on the button, display the employee's home address and kennel at which the employee works.

## Challenge: Locations

Your next task is to refactor your location components. On your location list, display the location name, the number of animals currently being treated, and the number of employees.

When the user click the detail button of a location, then the names of all animals currently being treated, and the names of all employees working there should be displayed in a modal.
