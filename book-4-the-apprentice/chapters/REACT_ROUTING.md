# Routing in React Applications

In a single page application, you are only rendering one DOM tree. You never request another HTML file, but simply create/destroy components in the one you have. If you have multiple views in your application, a universal design pattern is to have a navigation element at the top of the page for people to click on to see different views.

In React, you will use something called a Router to handle rendering different components when the user clicks on navigation items.

## Setup

Make sure you are in your `src` directory.

```sh
npm install react-router-dom
mkdir nav
touch nav/NavBar.js
touch nav/NavBar.css
```

Your `index.js` is going to change. Up to this point, you've rendered your component right onto the DOM, but this time, you will be rendering a [higher order component](http://bfy.tw/65MN) called **`App`**, which becomes the container for your entire application.

The **`App`** component will contain two child components.

1. **`NavBar`** which holds navigation elements to always be displayed.
1. **`ApplicationViews`** which will define all of the URLs that your application will support, and which views will be displays for each one.

Before we render our NavBar, let's make a component for it.

> nav/NavBar.js

```js
import React, { Component } from "react"
import { Link } from "react-router-dom"
import "./NavBar.css"


export default class NavBar extends Component {
    render() {
        return (
            <nav>
                <Link to="/">Locations</Link>
                <Link to="/animals">Animals</Link>
                <Link to="/employees">Employees</Link>
            </nav>
        )
    }
}
```

Notice the use of the new `<Link/>` component that you get from the React Router package you installed. It has an attribute named `to`. It will render a hyperlink in your DOM, and when clicked, it will change the URL in the browser to the value of the `to` attribute.

Now you can update your `index.js` and its root component must now be `<Router />` which gets imported from the React Router package. In that router, you place the `<App />` child component. What this tells React is that *"I will be placing Routes in my App component."*

> index.js

```js
import { BrowserRouter as Router } from "react-router-dom";
import App from "./App";


ReactDOM.render((
    <Router>
        <App />
    </Router>
), document.querySelector("#root"))
```

## Defining Routes

Now it's time to define the Routes that our application will respond to. You defined three link components that will navigation to the routes of.

* `/`
* `/animals`
* `/employees`

In the **`ApplicationViews`** component, you will define how your application will respond when the URL matches each of those patterns.

> ApplicationViews.js

```js
import { Route, Redirect } from 'react-router-dom'
import React, { Component } from "react"
import AnimalList from './AnimalList'
import LocationList from './LocationList'
import EmployeeList from './EmployeeList'


export default class ApplicationViews extends Component {
    render() {
        return (
            <React.Fragment>
                <Route exact path="/" component={LocationList} />
                <Route path="/animals" component={AnimalList} />
                <Route path="/employees" component={EmployeeList} />
            </React.Fragment>
        )
    }
}
```

`exact` is needed on the first route, otherwise it wil also match the other two routes. :shrug:


## Resources

* [Implementing an authentication mechanism with React Router](https://tylermcginnis.com/react-router-protected-routes-authentication/)

## Practice

Create a navigation bar for your application with three links in it.

1. Home
1. Projects
1. About Me

The home page should display the following information.

1. Your name
1. List of technologies you've learned so far

The projects page should list the name and a link to the repo for each group project that you've worked on so far.

The about me page should display any other interesting information about yourself that you want others to know.

1. Favorite frogs
1. Places you've traveled
1. Comic book collection

etc...