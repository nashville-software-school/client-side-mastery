# Creating Service Tickets

## Goal

In this chapter, you are going to write a component whose responsibility is to create a new service ticket.

![](./images/honey-rae-new-ticket.gif)

## Video Walkthrough

Watch the video that shows you how to use a form in React to [create a new service ticket](https://vimeo.com/573652033) and then immediately show the user the new list of tickets.

## React to User Input

Below is some boilerplate code that you can start with in your **`TicketForm`** component. After watching the video, your job is to do the following tasks.

1. Create the initial state for the service ticket with the `useState()` hook function.
1. Implement the `onChange` event listener on each form field to update the state when the user interacts with the form.
1. Write the logic in the `saveTicket()` function to perform the POST operation to save a new service ticket to permanent state in the API. Once the operation is complete, use the history mechanism to redirect the user to the list of service tickets.
1. Implement the `onClick` event listener on the submit ticket button.

> ##### `src/components/serviceTickets/TicketForm.js`

```jsx
import { useState } from "react"

export const TicketForm = () => {
    const [ticket, update] = useState();

    const saveTicket = (event) => {
        event.preventDefault()
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
                        onChange={} />
                </div>
            </fieldset>
            <fieldset>
                <div className="form-group">
                    <label htmlFor="name">Emergency:</label>
                    <input type="checkbox"
                        onChange={} />
                </div>
            </fieldset>
            <button className="btn btn-primary" onClick={saveTicket}>
                Submit Ticket
            </button>
        </form>
    )
}
```

## Button to Show the Form

Add a button to the top of your ticket list that will change the browser URL in order to show the ticket form.

```jsx
<div>
    <button onClick={() => history.push("/ticket/create")}>Create Ticket</button>
</div>
```

Make sure you import `useHistory()` into the component to make this work. This is a hook provided by the React Router DOM library that you installed. It grants you the ability to programtically manipulate the browser URL instead of waiting for a user to click on a `<Link>` component.

```js
const history = useHistory()
```

## Create the Route

Create the new route that will respond when the button click changes the URL to `/ticket/create`.

> ##### `src/components/ApplicationViews.js`

```jsx
<Route path="/ticket/create">
    <TicketForm />
</Route>
```

You should now be able to add new support tickets. If something doesn't work, check your code for spelling errors, and talk to your teammates.

If you still can't make it work, reach out to your instruction team immediately.

## Practice: Hire Employee

Write a component whose responsibility is to hire a new employee and assign to a location.

<img src="./images/honey-rae-employee-form.gif" width="600px" alt="Animation of employee creation form" />

### Create an Employee Form

* Create a route in ApplicationViews for `/employee/create` that renders an EmployeeForm.
* Add a button to the employee list labeled, "Hire Employee".
* When the button is clicked, show the employee form by using `history.push()` to change the route.
* The employee form should include an input for the person's name, their repair specialty, and a button at the end labeled "Finish Hiring".
* When the "Finish Hiring" button is clicked on the form, create a new employee object and POST it to the API.
* Once the employee is saved, re-route the user to the list of employees.

Do your best on your own and with teammates to get the form working. If you get truly stuck, you can grab some [boilerplate code](./scripts/EmployeeForm.js) to get started.