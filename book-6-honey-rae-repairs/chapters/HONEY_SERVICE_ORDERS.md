# Displaying Open Tech Repair Orders

## Video Walkthrough

Watch the [Honey Rae Repairs - Service Ticket List](https://vimeo.com/568512492) video to see how to use the `_expand` feature of JSON Server to embed related resources in the HTTP response. This reduced the chattiness of your application by getting all of the information you need in one HTTP request instead of three.

## Documentation Walkthrough

To finish out the process of displaying all of the state from the API, you are going to make a new component that will display information about the service tickets that your employees work on for customers. It will display the following information for each ticket.

1. Description of the service ticket
1. Name of the customer
1. Name of the employee doing the repair

## Starter Code

> #### `src/components/serviceTickets/TicketList.js`

```js
import React, { useEffect, useState } from "react"

export const TicketList = () => {
    const [] = useState([])

    useEffect(
        () => {

        },
        []
    )

    return (
        <>

        </>
    )
}
```
