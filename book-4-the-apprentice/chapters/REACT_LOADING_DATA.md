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
        { "id": 2, "name": "Decker", "breed": "German Sheperd" },
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
1. When viewing the Animals section, AnimalCard.js will load up and invoke `render()`.
1. Our page displays.


## Querying the Data

As we have done before, let's create a module for database calls.

## Setup

1. Create a `src/modules` directory
2. In that directory, create a file named `AnimalManager.js`

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

Our `AnimalCard` does a great job of rendering a single animal. So, let's make a new file that will initiate the AnimalManager `getAll()` call, hold on to the returned data, and then render the **`<AnimalCard />`** component for each animal.

When the data is returned, we can hold on to it by placing it in the component's `state`.

## What is State?
A component's state is an object that can be modified over time in response to user actions, network responses, and anything. State determines how a component renders and behaves.

State is initialized by defining `state` at the top of a class definition and then it is automatically included in the construction of the component. Once the data is returned from the AnimalManager, we invoke a React method `setState()` which allows us to update/hold the values and when state is updated, React automatically invokes the render method, again.

Create the AnimalList file.

```sh
touch src/components/animal/AnimalList.js
```

The following code snippets should look familiar.
Get all of the animals from the API:

```js
    AnimalManager.getAll()
    .then(animalResults => {
        console.log("animals", animalResults);
    })
```

Render each animal with an **`<AnimalCard>`** component.

```js
    allAnimals.map(animal => <AnimalCard />)
```
For each animal in allAnimals, return an **`<AnimalCard>`** component.


`render()` is a built in method of React. Another built in method is `componentDidMount()`. Once a component is loaded and after render is called, `componentDidMount()` is invoked.


Let's build the **`<AnimalList >`** component.

> src/components/animal/AnimalList.js

```js
    import React, { Component } from 'react'
    //import the components we will need
    import AnimalCard from './AnimalCard'
    import AnimalManager from '../../modules/AnimalManager'

    class AnimalList extends Component {
        //define what this component needs to render
        state = {
            animals: [],
        }

    componentDidMount(){
        console.log("ANIMAL LIST: ComponentDidMount");
        //getAll from AnimalManager and hang on to that data; put it in state
        AnimalManager.getAll()
        .then((animalResults) => {
            this.setState({
                animals: animalResults
            })
        })
    }

    render(){
        console.log("ANIMAL LIST: Render");

        return(
            <div className="container-cards">
                {this.state.animals.map(animal => <AnimalCard />)}
            </div>
        )
    }
}

export default AnimalList


```

Modify `ApplicationViews.js` route for animals to load the **`<AnimalList />`** instead of **`<AnimalCard />`**.

Also, update the import statement. You will need the `AnimalList` instead of the `AnimalCard`.


```js
import AnimalList from './animal/AnimalList'

class ApplicationViews extends Component {

  render() {
    return (

    ...

        <Route path="/animals" render={(props) => {
          return <AnimalList />
        }} />

    ...

    )
  }
}

export default ApplicationViews
```

Run the code. We have 3 cards displaying (and an error message. We will fix the error and display the correct data in the next chapter.). Take a look at the console. This is the order of the code running:

```
AnimalList: Render
AnimalList: ComponentDidMount
AnimalList: Render
```

In React, retrieving state from a remote API works in, what seems like, a counterintuitive way. React must first render the component to the DOM without any existing data (held in state), then you request the data, `setState()`, and then the component will invoke render again.

One of the lifecycle methods available to every React component is [componentDidMount](https://reactjs.org/docs/react-component.html#the-component-lifecycle). Straight from their docs (emphasis mine):

> `componentDidMount()` is invoked immediately after a component is mounted. Initialization that requires DOM nodes should go here. _If you need to load data from a remote endpoint, this is a good place to instantiate the network request._

The `componentDidMount()` lifecycle hook runs after the component output has been rendered to the DOM, so if your component needs API data, this is the place to do it.


## Component LifeCycle

* [Component Lifecycle Hooks Documentation](https://reactjs.org/docs/react-component.html)
* [Lifecycle Hooks Diagram](http://projects.wojtekmaj.pl/react-lifecycle-methods-diagram/)

## Resources

* [React App Requests to JSON API](https://www.youtube.com/watch?v=vwWPM7za3Pk&list=PLhScwEnhQ-bmroyHFduwgOZ1KrdDvk_44) video series
* [React for Everyone](https://www.youtube.com/playlist?list=PLLnpHn493BHFfs3Uj5tvx17mXk4B4ws4p) video series

## Practice - NSS Kennels API

1. Create modules to query the database for employees, locations, and owners from your API.
2. Create list components to handle calling the database modules.
3. Display a static *designed* card for each section. We will get to displaying the correct data next.


> **Pro tip:** Remember to use your network tab in the Chrome Developer Tools to watch your network requests and preview the responses.

**Note**
* Owners should have the `id`, `phoneNumber`, and `name` properties.

![](./images/eB9CCcrUHy.gif)
