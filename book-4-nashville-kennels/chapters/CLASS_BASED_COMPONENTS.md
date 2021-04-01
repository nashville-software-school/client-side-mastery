# Class-based Components

If you work in React after graduation, you are sure to encounter an alternative style of React components - components built with [JavaScript classes](https://www.w3schools.com/Js/js_classes.asp).

The components we've built in this course have been functions that return JSX to be rendered to the DOM. These functions use React _hooks_ to store data in a component's state and to make API calls.
Class based components have different mechanisms for rendering, state and interacting with an API.

## Example

The following components are equivalent.

> Function Component

```jsx
import React, { useState, useEffect } from 'react';
import AnimalManager from '../../modules/AnimalManager';
import './AnimalDetail.css'

const AnimalDetail = props => {
  const [animal, setAnimal] = useState({ name: "", breed: "" });

  useEffect(() => {
    AnimalManager.get(props.animalId)
      .then(animal => {
        setAnimal({
          name: animal.name,
          breed: animal.breed,
        });
      });
  }, []);

  return (
    <div className="card">
      <div className="card-content">
        <picture>
          <img src={require('./dog.svg')} alt="My Dog" />
        </picture>
        <h3>Name: <span style={{ color: 'darkslategrey' }}>{animal.name}</span></h3>
        <p>Breed: {animal.breed}</p>
      </div>
    </div>
  );
}

export default AnimalDetail;
```

> Class Component

```jsx
import React, { Component } from 'react';
import AnimalManager from '../../modules/AnimalManager';
import './AnimalDetail.css'

class AnimalDetail extends Component {

  state = {
      name: "",
      breed: "",
  }

  componentDidMount(){
    AnimalManager.get(this.props.animalId)
    .then(animal => {
      this.setState({
        name: animal.name,
        breed: animal.breed
      });
    });
  }

  render() {
    return (
      <div className="card">
        <div className="card-content">
          <picture>
            <img src={require('./dog.svg')} alt="My Dog" />
          </picture>
            <h3>Name: <span style={{ color: 'darkslategrey' }}>{this.state.name}</span></h3>
            <p>Breed: {this.state.breed}</p>
        </div>
      </div>
    );
  }
}

export default AnimalDetail;
```

## Class-based Components...

* Store state in a special property that must be called `state`. `state` is a single object that contains all the data the component needs to manage. State is initialized at the top of the component.
* Access state using the `this` keyword. (e.g. `this.state.animal.name`)
* Change state using the special `this.setState()` method.
* Access `props` via a special property called `this.props` (e.g. `this.props.animalId`)
* Contain several _"lifecycle methods"_ that React will execute at different times during the component's lifetime. For example, `componentDidMount` is called after the component is rendered for the first time. It is common to make API calls in `componentDidMount`.
  * [Lifecycle Methods Documentation](https://reactjs.org/docs/react-component.html)
  * [Lifecycle Methods Diagram](http://projects.wojtekmaj.pl/react-lifecycle-methods-diagram/)
* Contain a special method called `render()` that returns the JSX to be rendered to the DOM.

## But Why?

Since the introduction of _hooks_ in early 2019, the React team's recommendation is to create function-based components. However, prior to hooks, class-based components were the only option for a component that needed to store state. That means there is a lot of code in the world that uses class-based components.
