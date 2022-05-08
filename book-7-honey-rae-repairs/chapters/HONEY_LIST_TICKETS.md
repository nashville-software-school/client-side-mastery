# Fetch API Data and Update State

```js
import { useEffect, useState } from "react"

export const TicketList = () => {
    const [tickets, setTickets] = useState([])

    useEffect(
        // Step 2: Get API state after initial state established
        () => {
            fetch("http://localhost:8088/serviceTickets")
                .then(response => response.json())
                .then((ticketArray) => {
                    setTickets(ticketArray)
                })
        },
        [] // Step 1: Wait for initial state to be done
    )

    useEffect(
        // Step 2: Output current state to console
        () => {
            console.log("The new state of tickets is", tickets)
        },
        [tickets]  // Step 1: Observe `tickets` component state
    )

    /*
        JSX is re-evaluated EVERY time ANY state changes
        (including initial state)
    */
    return <>
        <h2>List of Tickets</h2>

        {
            tickets.map(
                (ticket) => {
                    <section className="ticket">
                        <header>{ ticket.description }</header>>
                        <footer>Emergency: { ticket.emergency }</footer>>
                    </section>
                }
            )
        }
    </>
}
```