# Fetch API Data and Update State

```js
import { useEffect, useState } from "react"
import "./Tickets.css"

export const TicketList = () => {
    const [tickets, setTickets] = useState([])

    useEffect(
        () => {
            fetch("http://localhost:8088/serviceTickets")
                .then(response => response.json())
                .then((ticketArray) => {
                    setTickets(ticketArray)
                })
        },
        []
    )

    useEffect(
        () => {
            console.log("The new state of tickets is", tickets)
        },
        [tickets]  // Observe changes to ticket state variable
    )

    return <>
        <h2>List of Tickets</h2>

        <article className="tickets">
            {
                tickets.map(
                    (ticket) => {
                        return <section className="ticket">
                            <header>{ticket.description}</header>
                            <footer>Emergency: {ticket.emergency ? "🧨" : "No"}</footer>
                        </section>
                    }
                )
            }
        </article>
    </>
}
```