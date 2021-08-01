# Editing Single Tickets

Since a ticket is automatically assigned to the employee with a primary key of 1, you need a way to reassign the ticket. Surely, the first employee in the database won't be working on all the tickets.

## View a Single Ticket

The first step is to view a single ticket after clicking on it in the list. To do this, you will use the `<Link>` component to make the descriptions into hyperlinks. Open the ticket list component and update the code to the following.

```jsx
<Link to={`/tickets/${ticket.id}`}>{ticket.description}</Link>
```

Verify that each description is now a hyperlink.

<img src="./images/honey-rae-ticket-links.png" width="600px" alt="List of tickets with descriptions as hyperlinks" />


## Single Ticket Component

The next step is to create a new component in the `serviceTickets` directory which will be responsible for showing the details of a single ticket, which can then be used to modify it.

This component will also use the `useParams()` hook function from the `react-router-dom` library. It allows your code to read a route parameter from the URL.

> In the following URL, `5` is the route parameter
>
>   http://localhost:5000/animals/5

Create the following module and add the code.

> #### `/src/components/serviceTickets/Ticket.js`

```jsx
import React, { useEffect, useState } from "react"
import { useParams } from "react-router-dom"

export const Ticket = () => {
    const [ticket, set] = useState({})  // State variable for current ticket object
    const [employees, syncEmployees] = useState([])  // State variable for array of employees
    const { ticketId } = useParams()  // Variable storing the route parameter

    // Function to fetch a single ticket, with customer and employee embedded
    const fetchTicket = () => {
        return fetch(`http://localhost:8088/serviceTickets/${ticketId}?_expand=customer&_expand=employee`)
            .then(res => res.json())
            .then(set)
    }

    // Invoke fetchTicket() when the parameter value changes
    useEffect(
        () => {
            fetchTicket()
        },
        [ ticketId ]  // Above function runs when the value of ticketId change
    )

    // Fetch all employees
    useEffect(
        () => {
            fetch(`http://localhost:8088/employees`)
                .then(res => res.json())
                .then(syncEmployees)
        },
        []  // Empty dependency array only reacts to JSX initial rendering
    )

    // Function to invoke when an employee is chosen from <select> element
    const updateTicket = (evt) => {

        // Construct a new object to replace the existing one in the API
        const updatedTicket = {
            customerId: ticket.customerId,
            employeeId: parseInt(evt.target.value),
            description: ticket.description,
            emergency: ticket.emergency,
            dateCompleted: new Date().toLocaleDateString("en-US")
        }

        // Perform the PUT HTTP request to replace the resource
        fetch(`http://localhost:8088/serviceTickets/${ticketId}`, {
            method: "PUT",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(updatedTicket)
        })
            .then(() => {
                fetchTicket()
            })
    }

    return (
        <>
            <section className="ticket">
                <h3 className="ticket__description">{ticket.description}</h3>
                <div className="ticket__customer">Submitted by {ticket.customer?.name}</div>
                <div className="ticket__employee">Assigned to
                    <select
                        value={ ticket.employeeId }
                        onChange={ updateTicket }>
                        {
                            employees.map(e => <option key={`employee--${e.id}`} value={e.id}>{e.name}</option>)
                        }
                    </select>
                </div>
            </section>
        </>
    )
}
```

## Create a Dynamic Route

A dynamic route component is one that matches a pattern. Notice the route that renders **`Ticket`** component. The `ticketId` is a parameter specified in the URL.

```js
<Route exact path="/tickets/:ticketId(\d+)">
    <Ticket />
</Route>
```

It has `:ticketId(\d+)` at the end of the URL. If the URL is http://localhost:3000/tickets/3, the value of 3 will be stored in a variable named `ticketId`. The variable can then be used inside **`Ticket`** component.

Look back at the code you put in the detail component.

See the `const { ticketId } = useParams();`

This is how you access the number 3 inside the component. It's part of the routing package (react-router-dom) you installed. Don't worry, that one's tricky. We'll help you remember it.

## View a Ticket Detail



## Practice: Employees

Make ech emplyee's name a hyperlink. When the name is clicked display that single employee's details.
