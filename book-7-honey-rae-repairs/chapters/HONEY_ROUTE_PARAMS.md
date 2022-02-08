# Viewing Single Tickets

## Video Walkthrough

The content in this chapter is meant to augment the [Honey Rae Repairs - Dynamic Routing](https://vimeo.com/581824615) video which shows you the implementation of Link and Router components, along with the `useParams()` hook, to implement a single resouce view in React.

## Documentation Walkthrough

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
    const { ticketId } = useParams()  // Variable storing the route parameter

    useEffect(
        () => {
            fetch(`http://localhost:8088/serviceTickets/${ticketId}?_expand=customer&_expand=employee`)
                .then(res => res.json())
                .then(set)
        },
        [ ticketId ]  // Above function runs when the value of ticketId change
    )

    return (
        <>
            <section className="ticket">
                <h3 className="ticket__description">{ticket.description}</h3>
                <div className="ticket__customer">Submitted by {ticket.customer?.name}</div>
                <div className="ticket__employee">Assigned to {ticket.employee?.name}</div>
            </section>
        </>
    )
}
```

| | |
|:---:|:---|
| <h1>&#x270e;</h1> |  _The `ticket.customer?.name` code may still look weird. Remember that [optional chaining](https://www.geeksforgeeks.org/javascript-optional-chaining/) is highly useful when you are trying to access properties of properties._ |

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
