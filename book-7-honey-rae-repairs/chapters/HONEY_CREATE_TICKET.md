# Creating Service Tickets

## Goal

In this chapter, you are going to write a component whose responsibility is to create a new service ticket.

![](./images/honey-rae-new-ticket.gif)

## Video Walkthrough

Watch the [create a new service ticket](https://watch.screencastify.com/v/g4Ta9Xf8QjV79CtwGbJ5) video that shows you how to implement a form for customer's to submit service tickets. Then follow the instructions below, and implement all of the code.

## Service Ticket Form

Below is some boilerplate code that you can start with in your **`TicketForm`** component. After watching the video, your job is to do the following tasks.

1. Copy pasta the code into the specified module.
1. Scroll down and implment the new ticket button.
1. Scroll down and implment the required `<Route>`.
1. Open `TicketForm` again and implement the following code.
    1. Create the initial state for the service ticket with the `useState()` hook function.
    1. Implement the `onChange` event listener on each form field to update the state when the user interacts with the form.
    1. Write the logic in the `handleSaveButtonClick()` function to perform the POST operation to save a new service ticket to permanent state in the API. Once the operation is complete, redirect the customer to the list of their service tickets.
    1. Implement the `onClick` event listener on the submit ticket button.

> ##### `src/components/serviceTickets/TicketForm.js`

```jsx
import { useState } from "react"
import { useNavigate } from "react-router-dom"

export const TicketForm = () => {
    /*
        TODO: Add the correct default properties to the
        initial state object
    */
    const [ticket, update] = useState({

    })
    /*
        TODO: Use the useNavigation() hook so you can redirect
        the user to the ticket list
    */

    const localHoneyUser = localStorage.getItem("honey_user")
    const honeyUserObject = JSON.parse(localHoneyUser)

    const handleSaveButtonClick = (event) => {
        event.preventDefault()

        // TODO: Create the object to be saved to the API


        // TODO: Perform the fetch() to POST the object to the API
    }

    return (
        <form className="ticketForm">
            <h2 className="ticketForm__title">New Service Ticket</h2>
            <fieldset>
                <div className="form-group">
                    <label htmlFor="description">Description:</label>
                    <input
                        required autoFocus
                        type="text"
                        className="form-control"
                        placeholder="Brief description of problem"
                        value={ticket.description}
                        onChange={} />
                </div>
            </fieldset>
            <fieldset>
                <div className="form-group">
                    <label htmlFor="name">Emergency:</label>
                    <input type="checkbox"
                        value={ticket.emergency}
                        onChange={} />
                </div>
            </fieldset>
            <button className="btn btn-primary">
                Submit Ticket
            </button>
        </form>
    )
}
```

## Button to Show the Form

Add a button to the top of your ticket list that will change the browser URL in order to show the ticket form. Make sure this button only displays when a customer is logged in.

```jsx
<button onClick={() => navigate("/ticket/create")}>Create Ticket</button>
```

## Create the Route

Create the new route that will display the ticket form when the browser URL changes.

> ##### `src/components/views/ApplicationViews.js`

```jsx
<Route path="ticket/create" element={ <TicketForm /> } />
```

You should now be able to add new support tickets. If something doesn't work, check your code for spelling errors, and talk to your teammates.
