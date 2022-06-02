# Getting Started with Kennels

```sh
cd ~/workspace
npx create-react-app kennels
```

Once complete, get rid of the boilerplace component modules to start building your own.

```sh
cd kennels/src
rm App*
```

### Getting Setup

Before we grow this application, let's create a meaningful directory structure.

1. Inside your `src` directory, `mkdir` a `components` sub-directory.
2. `cd` into the `components` directory.
3. `touch` `Kennel.js` and `Kennel.css`.
4. Within components, `mkdir` a `location` directory
5. `cd` into the `location` directory.
6. `touch Location.js`

```sh
- src
    - components
        - location
            LocationList.js
        Kennel.js
        Kennel.css
  index.js

```

## Starter Code

> #### `src/index.js`

```js
import React from "react"
import ReactDOM from "react-dom"
import { Kennel } from "./components/Kennel"

ReactDOM.render(
  <React.StrictMode>
    <Kennel />
  </React.StrictMode>,
  document.getElementById('root')
);
```

> ##### `src/components/location/LocationList.js`

```jsx
import React from "react"

export const LocationList = () => (
    <article className="locations">
        <h2>List of Locations</h2>
    </article>
)
```

> #### `src/components/Kennel.js`

```jsx
import React from "react"
import { LocationList } from "./location/LocationList.js"
import "./Kennel.css"

export const Kennel = () => (
    <>
        <h2>Nashville Kennels</h2>
        <LocationList />
    </>
)
```

## Starting Your React Application

In your terminal, make sure you are in the top-level project directory, and not in the `public` or `src` sub-directory, and type the following command.

```sh
npm start
```

