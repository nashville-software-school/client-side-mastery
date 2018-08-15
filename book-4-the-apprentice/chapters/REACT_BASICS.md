# React

React is a library that was open sourced by the development team at Facebook with the sole purpose of managing how data is displayed to the user. It doesn't care about the database, it doesn't care how data is retrieved, and doesn't care about how complex the rest of the application is.

You've already learned the vast majority of what React does for you when building the UI for your application.

1. Building components and child components
1. Modular code with Browserify modules
1. Updating the DOM with document elements or string templates
1. Setting the state of a component

## Installing React Developer Tools

You can install the React Developer Tools via the [Chrome Store](https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi). These tools are another panel the Chrome Developer panel that will help with debugging and inspecting your React applications.

## Getting Started with create-react-app

Visit the [create-react-app](https://github.com/facebook/create-react-app/) Github repo and follow the instructions for getting yourself set up with a simple React application.

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

The `class` keyword is simply a new way to define an object in JavaScript. Here's how the code would look with what you've learned so far.

```js
const Kennel = Object.create(Component, {
    render: {
        value: () => {
            return `
                <div>
                    <h3>Student Kennels</h3>
                    <h4>Nashville North Location</h4>
                    <h5>500 Puppy Way</h5>
                </div>
            `
        }
    }
})
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
import Kennel from "./components/Kennel"

ReactDOM.render(<Kennel />, document.querySelector("#root"));
```

## Practice

Right now, the kennel location information is JSX inside the **`Kennel`** component. The business wants to expand and open a new location. Your job is to make a new component named **`LocationList`**, and put the names and addresses of each location in that component's JSX.

This is another example of Single Responsibility Principle. Since we have multiple locations now, we should have a component whose sole responsibility is to render the location information.

Create two locations (you can use separate `section` elements if you like): **Nashville North** with a fictitious address, and **Nashville South** with a fictitious address.

Then put the **`LocationList`** component in the JSX for **`Kennel`**.
