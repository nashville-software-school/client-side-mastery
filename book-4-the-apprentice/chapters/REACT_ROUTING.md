# Routing in React Applications

In a single page application, you are only rendering one DOM tree. You never request another HTML file but create/destroy components in the one you have. If you have multiple views in your application, a universal design pattern is to have a navigation element on the page for users to select and see different views.

In React, you will use something called a Router to handle the rendering of different components when the user clicks on navigation items. This also allows users to bookmark specific places within a single page app.

## Setup

Make sure you are in your project's root directory. First, we need to install react-router-dom. Then we will create an additional file to handle the routing and create a navbar.

```sh
npm install react-router-dom
cd src/components
touch ApplicationViews.js
mkdir home
touch home/Home.js
mkdir nav
touch nav/NavBar.js
touch nav/NavBar.css
```

## Making Your Components
Here's what we are about to do:
1. Create the **`Home`** component with a default view - `Hello World`.
1. Create the **`NavBar`** component for the constant navigation elements
1. Create the **`ApplicationViews`** component. This will define all of the URLs your application will support and which views will be displayed for each one.
1. Change the **`Kennel`** component to display two child components.
1. Update the **`index.js`** to utilize `react-router-dom`.

### Home Component

> components/home/Home.js

``` js

import React, { Component } from 'react'

class Home extends Component {
  render() {
    return (
      <address>
        Visit Us at the Nashville North Location
        <br />500 Puppy Way
      </address>
    )
  }
}

export default Home

```

### NavBar Component

Use this code for your navigation bar and the following CSS.

> components/nav/NavBar.js

```js
import React, { Component } from 'react';
import { Link } from "react-router-dom"
import './NavBar.css'

class NavBar extends Component {

  render(){

    return (
      <header>
        <h1 className="site-title">Student Kennels<br />
          <small>Loving care when you're not there.</small>
        </h1>
        <nav>
          <ul className="container">
            <li><Link className="nav-link" to="/">Home</Link></li>
            <li><Link className="nav-link" to="/animals">Animals</Link></li>
            <li>Locations</li>
            <li>Employees</li>
            <li>Owners</li>
          </ul>
        </nav>
      </header>
    )
  }
}

export default NavBar;
```

NavBar CSS
> components/nav/Navbar.css

```css
small {
  font-size: 75%;
}

header {
  background-color:darkblue;
  border: cornflowerblue solid 3px;
}

.site-title {
  color: ghostwhite;
  text-align: center;
}

nav .container {
  display: flex;
  padding: 0;
  margin-bottom: 0;
}

nav .container li {
  flex: 1;
  padding: 10px;
  text-align: center;
  font-size: 1.5em;
  color: cornsilk;
  box-sizing: border-box;
  background-color: cornflowerblue;
  list-style-type: none;
}

nav .container a {
  color: cornsilk;
}

nav .container a:hover {
  color: maroon;
}
```

Notice the use of the `<Link/>` component. This comes from the React Router package you installed. It has an attribute named `to`. It will render a hyperlink in your DOM, and when clicked, it will change the URL in the browser to the value of the `to` attribute.

### **ApplicationViews** - includes the Kennel application routes

Now it's time to define the Routes for our application. In **`NavBar`**, you defined two **`<Link />`** components that will navigate to the routes of...

* `/`
* `/animals`

In the **`ApplicationViews`** component, you will define how your application will respond when the URL matches each of those patterns. When a user clicks on one of the hyperlinks in the navigation bar, this code dictates which component should be rendered.

In the example code below, you will notice the use of `<React.Fragment />`. That is simply a React wrapper around your old friend `document.createDocumentFragment()`. Using a fragment prevents unnecessary `<div>`, `<article>`, or `<section>` tags from being created. This can be written with a shortcut `<>` and then closed `</>.

> components/ApplicationViews.js

```js
import { Route } from 'react-router-dom'
import React, { Component } from 'react'
import Home from './home/Home'
import AnimalCard from './animal/AnimalCard'
//only include these once they are built - previous practice exercise
import LocationCard from './location/LocationCard'
import EmployeeCard from './employee/EmployeeCard'
import OwnerCard from './owner/OwnerCard'


class ApplicationViews extends Component {

  render() {
    return (
      <React.Fragment>
        <Route exact path="/" render={(props) => {
          return <Home />
        }} />
        <Route path="/animals" render={(props) => {
          return <AnimalCard />
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

As mentioned above, **`Kennel`** is a container component. It renders no HTML itself. It simply *contains* other components that are responsible for the presentation and behavior of the application. In the case of our Kennel, it contains two different kinds of components.

1. **`Navbar`**: This is a _Presentation Component_. Directly expresses HTML.
2. **`ApplicationViews`**: This is a _Controller Component_. Its only responsibility is to control the behavior of the system and maps URLs to components.

> Kennel.js

```js
import React, { Component } from "react"
import NavBar from "./nav/NavBar"
import ApplicationViews from "./ApplicationViews"

import "./Kennel.css"

class Kennel extends Component {
  render() {
    return (
      <>
        <NavBar />
        <ApplicationViews />
      </>
    )
  }
}

export default Kennel
```

Now update your `index.js` by adding a root component of `<Router />` which gets imported from the React Router package. Within **`<Router>`**, place the `<Kennel />` child component. This tells React *"I will be placing Routes in my Kennel component."*

> index.js

```js
import React from 'react'
import ReactDOM from 'react-dom'
import { BrowserRouter as Router } from "react-router-dom"
import Kennel from './components/Kennel'

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

## Practice: Kennel Routes

1. Create links in your navigation bar for `/locations`, `/employees`, and `/owners` paths.
1. Have each route render the respective component.
