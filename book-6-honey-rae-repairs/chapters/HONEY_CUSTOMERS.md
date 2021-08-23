# Honey Rae's Customers

## Video Walkthrough

Watch the [Honey Rae's Repairs - Listing Customers State](https://vimeo.com/568152084) video to see how the `useState()` and `useEffect()` functions _(a.k.a. hooks)_ are used to set up and update application state to be rendered as HTML.

## Documentation Walkthrough

As Honey Rae and her team's reputation grows, the number of people who come in for repairs starts to grow quickly. It quickly becomes too hard to track how many outstanding service orders they currently are working on, and the order in which they came in.

Honey Rae's team needs to have an application that tracks who is working on which service order, for which customer. They also need to track when the customers dropped off their electronics so they can be worked on in the right order.

The first step is to display all of the customers that have been helped. This will not only help with the current need of tracking their work, but will also allow Honey Rae to do marketing in the future to let people know if new services are being offered.

## Starter Code

The following `index.js` module can be copy pasta directly and then closed. You won't need to make any changes to it.

### Index Module

> #### `src/index.js`

```js
import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import { Repairs } from "./components/Repairs";
import reportWebVitals from './reportWebVitals';

ReactDOM.render(
  <React.StrictMode>
    <Repairs />
  </React.StrictMode>,
  document.getElementById('root')
);

reportWebVitals();
```

### Repairs Module

The **`Repairs.js`** module needs to remain open in your editor. While watching the video, you will need to make the appropriate changes to the code to make it work.

> #### `src/components/Repairs.js`

```js
import React, { useEffect, useState } from "react"

export const Repairs = () => {
    const [customers, assignCustomers] = useState([])

    useEffect(
        () => {
            fetch()
                .then(res => res.json())
                .then(
                    (customers) => { }
                )
        },
        []
    )

    return (
        <h1>Honey Rae's Repair Shop</h1>

        {
            customers.map(
                () => { }
            )
        }
    )
}
```
