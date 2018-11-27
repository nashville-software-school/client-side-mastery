# Routing in React Applications

In a single page application, you are only rendering one DOM tree. You never request another HTML file, but simply create/destroy components in the one you have. If you have multiple views in your application, a universal design pattern is to have a navigation element at the top of the page for people to click on to see different views.

In React, you will use something called a Router to handle rendering different components when the user clicks on navigation items.

## Setup

Make sure you are in your project's root directory.

```sh
npm install react-router-dom bootstrap
cd src/components
touch ApplicationViews.js
mkdir nav
touch nav/NavBar.js
touch nav/NavBar.css
```

## Making Your Components

Your `index.js` is also going to change. Up to this point, you've rendered your component right onto the DOM, but this time, you will be rendering the container component called **`Kennel`**. It is a container component because it does not render any HTML itself, but rather has child components that render HTML.

Don't worry if that doesn't make any sense right now. Let's look at an example to help clarify it.

The **`Kennel`** component will contain two child components.

1. **`NavBar`** which holds navigation elements to always be displayed.
1. **`ApplicationViews`** which will define all of the URLs that your application will support, and which views will be displayed for each one.

Let's make the child components and then build the container component in which they will live.

### Navigation Bar

Use this code for your navigation bar. It uses Bootstrap styling so that you have some basic, good styling.

> components/nav/NavBar.js

```js
import React, { Component } from "react"
import { Link } from "react-router-dom"
import "bootstrap/dist/css/bootstrap.min.css"


class NavBar extends Component {
    render() {
        return (
            <nav className="navbar navbar-light fixed-top light-blue flex-md-nowrap p-0 shadow">
                <ul className="nav nav-pills">
                    <li className="nav-item">
                        <Link className="nav-link" to="/">Locations</Link>
                    </li>
                    <li className="nav-item">
                        <Link className="nav-link" to="/animals">Animals</Link>
                    </li>
                    <li className="nav-item">
                        <Link className="nav-link" to="/employees">Employees</Link>
                    </li>
                </ul>
            </nav>
        )
    }
}

export default NavBar
```

Notice the use of the new `<Link/>` component that you get from the React Router package you installed. It has an attribute named `to`. It will render a hyperlink in your DOM, and when clicked, it will change the URL in the browser to the value of the `to` attribute.

### Defining Routes in **ApplicationViews**

Now it's time to define the Routes that our application will respond to. In **`NavBar`**, you defined three link components that will navigation to the routes of...

* `/`
* `/animals`
* `/employees`

In the **`ApplicationViews`** component, you will define how your application will respond when the URL matches each of those patterns. When a user clicks on one of the hyperlinks in the navigation bar, this  code dictates which component should be rendered.

In the example code below, you will notice the use of `<React.Fragment />`. That is simply a React wrapper around your old friend `document.createDocumentFragment()`. What this does is prevent unnecessary `<div>`, `<article>`, or `<section>` tags from being created.

> ApplicationViews.js

```js
import { Route } from 'react-router-dom'
import React, { Component } from "react"
import AnimalList from './animal/AnimalList'
import LocationList from './location/LocationList'
import EmployeeList from './employee/EmployeeList'


class ApplicationViews extends Component {
    employeesFromAPI = [
        { id: 1, name: "Jessica Younker" },
        { id: 2, name: "Jordan Nelson" },
        { id: 3, name: "Zoe LeBlanc" },
        { id: 4, name: "Blaise Roberts" }
    ]

    locationsFromAPI = [
        { id: 1, name: "Nashville North", address: "500 Circle Way" },
        { id: 2, name: "Nashville South", address: "10101 Binary Court" }
    ]

    animalsFromAPI = [
        { id: 1, name: "Doodles" },
        { id: 2, name: "Jack" },
        { id: 3, name: "Angus" },
        { id: 4, name: "Henley" },
        { id: 5, name: "Derkins" },
        { id: 6, name: "Checkers" }
    ]

    state = {
        employees: this.employeesFromAPI,
        locations: this.locationsFromAPI,
        animals: this.animalsFromAPI
    }

    render() {
        return (
            <React.Fragment>
                <Route exact path="/" render={(props) => {
                    return <LocationList locations={this.state.locations} />
                }} />
                <Route path="/animals" render={(props) => {
                    return <AnimalList animals={this.state.animals} />
                }} />
                <Route path="/employees" render={(props) => {
                    return <EmployeeList employees={this.state.employees} />
                }} />
            </React.Fragment>
        )
    }
}

export default ApplicationViews
```

`exact` is needed on the first route, otherwise it will also match the other two routes, and the **`LocationList`** will be the only component rendered, no matter what the URL is.

The `<Link/>` and the `<Route/>` JSX elements are complementary to each other. If you add a new **`Link`** element in your application with a new URL, then you must create a matching **`Route`** element.

### Updating the Kennel Component

Like was mentioned above, **`Kennel`** is simply a container component. It renders no HTML itself, as you'll see. It simply *contains* other components that actually are responsible for the presentation and behavior of the application. In the case of **`KennelCompany`**, it contains two different kinds of components.

1. **`Navbar`**: This is a _Presentation Component_. Directly expresses HTML.
1. **`ApplicationViews`**: This is a _Controller Component_. Its only responsibility to to control the behavior of the system. It maps URLs to components.

> Kennel.js

```js
import React, { Component } from "react"
import NavBar from "./nav/NavBar"
import ApplicationViews from "./ApplicationViews"

import "./Kennel.css"
import "bootstrap/dist/css/bootstrap.min.css"


class Kennel extends Component {
    render() {
        return (
            <React.Fragment>
                <NavBar />
                <ApplicationViews />
            </React.Fragment>
        )
    }
}

export default Kennel
```

Now you can update your `index.js` and its root component must now be `<Router />` which gets imported from the React Router package. In that router, you place the `<Kennel />` child component. What this tells React is that *"I will be placing Routes in my Kennel component."*

> index.js

```js
import React from 'react'
import ReactDOM from 'react-dom'
import { BrowserRouter as Router } from "react-router-dom"
import Kennel from './components/Kennel'

import './index.css'

ReactDOM.render(
    <Router>
        <Kennel />
    </Router>
    , document.getElementById('root'))

```

Once all of this is in place, you will have the base of a single page application.

![single page app example](./images/UIJHNFcxRa.gif)

## Resources

* [Leveling Up With React: Container Components](https://css-tricks.com/learning-react-container-components/)
* [React Container Components](https://medium.com/@learnreact/container-components-c0e67432e005)
* [Implementing an authentication mechanism with React Router](https://tylermcginnis.com/react-router-protected-routes-authentication/)
* [React Component Patterns by Michael Chan](https://www.youtube.com/watch?v=YaZg8wg39QQ)
* [Advanced React Component Patterns](https://egghead.io/courses/advanced-react-component-patterns)

## Practice: Owners List

If you haven't created the `owners` array in your state yet, please go ahead and create it now, and populate it with 4 owners. Each owners should have the `id`, `phoneNumber`, and `name` properties.

1. Create a link in your navigation bar that links to `/owners` path.
1. Create a route for `/owners` that renders the `<OwnerList>` component and sends the corresponding state property.
1. Add the code in `<OwnerList>` to display all the items in the array.
