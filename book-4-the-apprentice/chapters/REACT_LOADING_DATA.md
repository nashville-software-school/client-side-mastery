# Load Data from an API and initial State

At this point, you have a static application. Now it's time to implement realistic data. You will request it from your JSON API database.


## Populate the API

You are going to use `json-server` to create an API for your kennel application.

In the root directory of your project, create an `api` directory that is a sibling to `src`. Create a file in that directory named `kennel.json`.

```sh
mkdir api
touch api/kennel.json
```

Add animal data to the JSON file.

```json
{
    "animals": [
        { "id": 1, "name": "Doodles", "breed": "Poodle"},
        { "id": 2, "name": "Decker", "breed": "German Shepherd" },
        { "id": 3, "name": "Esme", "breed": "Pitbull" }
    ]
}
```

Open a new terminal window, and start your API with the following command.

```sh
json-server -p 5002 -w kennel.json
```


## Thinking in React and Querying Data from the API

Currently, this is the flow of code in your application:
1. `index.js` is invoked first and it renders the `<Router>` with `Kennel.js`
1. `Kennel.js` renders the `<NavBar>` and `<ApplicationViews>`
1. `<NavBar>` contains links to other views
1. `<ApplicationViews>` renders routes based on the URL.
1. When viewing the Animals section, `AnimalCard.js` will load up and invoke `render()`.
1. Our page displays.


## Querying the Data

As we have done before, let's create a module for database calls.

## Setup

1. Create a `src/modules` directory
1. In that directory, create a file named `AnimalManager.js`
1. Create a new component in a file named `src/components/animal/AnimalList.js` _**NOTE:** This file is being created in a folder called `animal`_.
1. For now the animal list should look like this:

    ```jsx
    import React from 'react';

    const AnimalList = () => {
        return (
            <div className="container-cards">
            We'll put some animals here eventually...
            </div>
        );
    };

    export default AnimalList
    ```

1. Update the `ApplicationViews` component so that the route now refers to the `AnimalList` instead of the `AnimalCard`. Don't forget to import the `AnimalList` component

    ```jsx
        <Route path="/animals" render={(props) => {
          return <AnimalList />
        }} />
    ```

## Single Responsibility Principle

Keeping the Single Responsibility Principle in mind, you are going to create a JavaScript module that contains the animal API calls. This provides flexibility for your application.

Other components, _in the future_, may need the ability to make their own API calls. You're going to eliminate the possibility of duplicate code by making a module whose sole responsibility is to interact with the API.

> src/modules/AnimalManager.js

```js
const remoteURL = "http://localhost:5002"

export default {
  get(id) {
    return fetch(`${remoteURL}/animals/${id}`).then(result => result.json())
  },
  getAll() {
    return fetch(`${remoteURL}/animals`).then(result => result.json())
  }
}
```

Our `AnimalCard` does a great job of rendering a single animal, but our database has more than one animal. That's where the `AnimalList` component will come in. By the time we're done, it will initiate the AnimalManager `getAll()` call, hold on to the returned data, and then render the **`<AnimalCard />`** component for each animal.

When the data is returned, we can hold on to it by placing it in the component's `state`. _More on `state` later._

## Fetching Data from a Component

Because interacting with an external API in a React application is a common need for most apps, the creators of React have given us a tool for just that purpose.

### useEffect()

`useEffect` is a function provided by React that gives us a place from which to access external data and resources (such as an API) from our component.

Because `useEffect` is provided by the React library, we must import it.
```js
import React, { useEffect } from 'react';
```

> **NOTE:** `useEffect` is a member of a family of tools that React broadly calls _"hooks"_. Hooks are a way to gain access to some of React's underlying functionality.

The `useEffect` hook accepts two parameters: a function and an array.

The function parameter is where you place the code that interacts with an external resource. The array parameter is used to control when the function parameter is executed.

Consider the following component:

```jsx
import React, { useEffect } from 'react';
import AnimalManager from '../../modules/AnimalManager';

const AnimalList = () => {
  const getAnimals = () => {
    return AnimalManager.getAll().then(animalsFromAPI => {
      // We'll do something more interesting with this data soon.
      console.log(animalsFromAPI);
    });
  };

  useEffect(() => {
    getAnimals();
  }, []);

  return (
    <div className="container-cards">
      We'll put some animals here eventually...
    </div>
  );
};

export default AnimalList
```

The function argument to `useEffect` tells React to call the `getAnimals()` function (that will fetch data from our API). The empty array argument tells React to call the function on the **_first render_** of the component.

```jsx
  useEffect(() => {
    getAnimals();
  }, []);
```

Why do we need to specify an action to be performed _only_ on the first render? It turns out that React components repeatedly re-render throughout the lifetime of an application (often at surprising times). It would be a waste to make an API request each time the component re-renders. Instead we can save the data after the first render and simply use that saved data when we need it.

> **NOTE:** We'll see more complex uses of the array parameter later, but for now it's ok to pass an empty array.

## Component State

A component's state is mechanism for storing data that is modified over time in response to user actions, network responses, and anything. State determines how a component renders and behaves.

A few points about **state**

* State is a way of storing data in a component.
* State must be given an initial value.
* The data stored in state can change over time.
* When state is changed the component will re-render.

### useState()

State is accessed by calling a function named `useState`. Like `useEffect` this function is another _hook_ supplied by React and must be imported.

```js
import React, { useState } from 'react';
```

Here's an example of calling `useState`.

```js
const [animals, setAnimals] = useState([]);
```

Let's break this down.

The empty array passed to `useState` is the **_initial value_** of the state.

`useState(`**[ ]**`)`

`useState` returns an array. The first element in the array is the **_current value_** of the state.

`const [`**animals**`, setAnimals]`

Remember the value of state can change over time, so the current value is probably not the same as the initial value.

The second element in the array is a function that gives us access to change the state.

`const [animals,`**setAnimals**`]`

We can call `setAnimals` when we need to change the value of the animals stored in state.

`setAnimals(someNewAnimalsArray);`

Let's incorporate state into the `AnimalList` component.

```jsx
import React, { useState, useEffect } from 'react';
//import the components we will need
import AnimalCard from './AnimalCard';
import AnimalManager from '../../modules/AnimalManager';

const AnimalList = () => {
  // The initial state is an empty array
  const [animals, setAnimals] = useState([]);

  const getAnimals = () => {
    // After the data comes back from the API, we
    //  use the setAnimals function to update state
    return AnimalManager.getAll().then(animalsFromAPI => {
      setAnimals(animalsFromAPI)
    });
  };

  // got the animals from the API on the component's first render
  useEffect(() => {
    getAnimals();
  }, []);

  // Finally we use map() to "loop over" the animals array to show a list of animal cards
  return (
    <div className="container-cards">
      {animals.map(animal => <AnimalCard />)}
    </div>
  );
};
export default AnimalList
```

`useState` should be called at the top of the component's definition and then it is automatically included in the construction of the component. Once the data is returned from the AnimalManager, we invoke the `setAnimals()` function to save the animals in the component's state. After `setAnimals()` executes, the component re-renders and displays the animals.

## Rendering and Re-rendering

What do we mean when we say a component "renders"? Rendering happens when a component returns HTML and then React puts that HTML onto the DOM.

A component re-renders any time it's state changes. Re-rendering essentially means React calls the component function again,  takes whatever HTML it returns, and places it on the DOM.

## Using Components within Components

Take another look at the `AnimalList` component, you'll notice we are importing the `AnimalCard` component and using it in the JSX code. This _composability_ is one of the amazing benefits of components.

> **NOTE:** Notice that, although we have three instances of the animal card (matching the three records in the database), we do NOT see the data from our database. Don't worry, we'll take care of this in the next chapter.

## Practice - NSS Kennels API

1. Add some example data for employees, locations and owners to `api/kennel.json`.
1. Create modules to query the database for employees, locations, and owners from your API.
1. Create list components to handle calling the database modules.
1. Display a static *designed* card for each section. We will get to displaying the correct data next.


> **Pro tip:** Remember to use your network tab in the Chrome Developer Tools to watch your network requests and preview the responses.

**Note**
* Owners should have the `id`, `phoneNumber`, and `name` properties.

![](./images/eB9CCcrUHy.gif)
