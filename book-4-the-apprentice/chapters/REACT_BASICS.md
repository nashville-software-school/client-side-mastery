# React

React is a library that was open sourced by the development team at Facebook with the sole purpose of managing how data is displayed to the user. It doesn't care about the database, it doesn't care how data is retrieved, and doesn't care about how complex the rest of the application is.

You've already learned the vast majority of what React does for you when building the UI for your application.

1. Building components and child components
1. Modular code with Browserify modules
1. Updating the DOM with document fragments and appendChild
1. Setting the state of a component

## Key Terms

1. **JSX** — Allows us to write HTML like syntax which gets
transformed to lightweightJavaScript objects.

1. **render** (method) — Describes what the UI will look like for the particular component.

1. **Virtual DOM** — A JavaScript representation of the actual DOM.

1. **state** — The internal data store (object) of a component.

1. **setState** — A helper method used for updating the state of a component and re-rendering the UI

1. **React.Component** — The way in which you create a new component.

1. **ReactDOM.render** — Renders a React component to a DOM node.

1. **constructor** (this.state) - The way in which you establish the initial state of a component.

1. **props** — The data which is passed to the child component from the parent component.

1. **propTypes** — Allows you to control the presence, or types of certain props passed to the child component.

1. **defaultProps** — Allows you to set default props for your component.

## Component LifeCycle

![component lifecycle](./images/react-component-lifecycle.png)

## Getting Started with create-react-app

Visit the [create-react-app](https://github.com/facebook/create-react-app/) Github repo and follow the instructions for getting yourself set up with a simple React application.

## Resources

* [A Comprehensive Guide to learning React.js in 2018](https://tylermcginnis.com/reactjs-tutorial-a-comprehensive-guide-to-building-apps-with-react/)
* [React Tutorial Series](https://www.youtube.com/watch?v=MhkGQAoc7bc&list=PLoYCgNOIyGABj2GQSlDRjgvXtqfDxKm5b)
* [The Beginner's Guide to React
](https://egghead.io/courses/the-beginner-s-guide-to-react)

## Getting Started with Components

Your instructor will walk through this code with you as you build up your initial React application.

### Single Component

Here's the simplest of examples for building a React component. In your `index.js` file, place the following code that building a `<Kennel />` component that renders information about a kennel business.

```js
import ReactDOM from 'react-dom';
import React, { Component } from 'react';

class Kennel extends Component {
    render() {
        return (
            <div>
                <h3>Student Kennels</h3>
                <h4>Nashville North Location</h4>
                <h5>500 Puppy Way</h5>
            </div>
        );
    }
}

ReactDOM.render(<Kennel />, document.querySelector("#root"));
```

### Child Component

After the information about the company, I want to list all of the employees. I **could** just hard code them right inside my kennel component, but as a good developer, I try to adhere to the *Single Responsibility Principle* whenever I can.

Therefore, I'm going to create another component for displaying employees. Just copy pasta this code into `index.js` right below the **`Kennel`** class.

```js
class EmployeeList extends Component {
    render() {
        return (
            <article>
                <h1>Employee List</h1>
                <section>Jessica Younker</section>
                <section>Jordan Nelson</section>
                <section>Zoe LeBlanc</section>
                <section>Blaise Roberts</section>
            </article>
        );
    }
}
```

Then I can include that component as a child of the **`Kennel`** component. Look at the code below and notice that there's a very strange looking HTML element called `<EmployeeList />`. JSX interprets this as a component and will render the class you defined.

Update your **`Kennel`** component to match.

```js
class Kennel extends Component {
    render() {
        return (
            <div>
                <h3>Student Kennels</h3>
                <h4>Nashville North Location</h4>
                <h5>500 Puppy Way</h5>
                <EmployeeList />
            </div>
        );
    }
}
```

> **Note:** Each React component's render method can only have a single component defined in it. Notice that each of my simple components above only define a single `<div>` with child elements.

### Component Files

Before we grow this application any further, we need to separate each component into its own JavaScript file.

1. Inside your `src` directory, create a `components` sub-directory.
1. Then create a file named `Kennel.js` in that directory.
1. Remove the `Kennel` class from the `index.js` file.
1. Paste the following code into `Kennel.js`.

> Kennel.js

```js
import React, { Component } from 'react'
import EmployeeList from "./employee/EmployeeList"  // Import EmployeeList component


export default class Kennel extends Component {
    render() {
        return (
            <div>
                <h3>Student Kennels</h3>
                <h4>Nashville North Location</h4>
                <h5>500 Puppy Way</h5>
                <EmployeeList />
            </div>
        );
    }
}
```

Next, create a directory to hold employee components and create an `EmployeeList.js` file in it.

```sh
mkdir src/components/employee
touch src/components/employee/EmployeeList.js
```

Then copy the following code into that file.

> EmployeeList.js

```js
import React, { Component } from 'react'


export default class EmployeeList  extends Component {
    render() {
        return (
            <article>
                <h1>Employee List</h1>
                <section>Jessica Younker</section>
                <section>Jordan Nelson</section>
                <section>Zoe LeBlanc</section>
                <section>Blaise Roberts</section>
            </article>
        );
    }
}
```

Finally, import the **`Kennel`** component into `index.js`.

> index.js

```js
import ReactDOM from "react-dom"
import React from 'react'
import Kennel from "./Kennel"

ReactDOM.render(<Kennel />, document.querySelector("#root"));
```

## Practice

Right now, the kennel location information is hard-coded inside the **`Kennel`** component. The business wants to expand and open a new location. Your job is to make a new component named **`LocationList`**, and put the name, addresses of each location in that component's JSX.

Create two locations: **Nashville North** with a fictitious address, and **Nashville South** with a fictitious address.

Then put the **`LocationList`** component in the JSX for **`Kennel`**.
