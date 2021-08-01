# Editing Single Tickets

Since a ticket is automatically assigned to the employee with a primary key of 1, you need a way to reassign the ticket. Surely, the first employee in the database won't be working on all the tickets.

## Editing a Single Ticket

Replace all of the code in your ticket detail component with the following code.

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

