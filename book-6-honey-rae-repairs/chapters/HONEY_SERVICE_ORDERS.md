# Displaying Open Tech Repair Orders


The first step is to display all of the customers that have been helped. This will not only help with the current need of tracking their work, but will also allow Honey Rae to do marketing in the future to let people know if new services are being offered.

## Starter Code

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

## Video: Active Service Tickets

Watch the [Honey Rae's Repairs - Listing Customers State](https://vimeo.com/568152084) video to see how the `useState()` and `useEffect()` functions _(a.k.a. hooks)_ are used to set up and update application state to be rendered as HTML.
