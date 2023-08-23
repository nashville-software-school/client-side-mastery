# Routing in React Applications

In a single page application, you are only rendering one DOM tree. You never request another HTML file but create/destroy components in the one you have. If you have multiple views in your application, a universal design pattern is to have a navigation element on the page for users to select and see different views.

In React, you will use something called a Router to handle the rendering of different components when the user clicks on navigation items. This also allows users to bookmark specific places within a single page app.

## Setup

Make sure you are in your project's root directory. First, we need to install `react-router-dom`. Then we will create an additional file to handle the routing and create a navbar.

```sh
npm i --save react-router-dom@5.3
touch src/components/ApplicationViews.js
mkdir src/components/nav
touch src/components/nav/NavBar.js
touch src/components/nav/NavBar.css
```

## Video Walkthrough

Before implementing the code yourself with the instructions below, watch the [Honey Rae Repairs - Routing](https://vimeo.com/568650908) video to see the implementation and get some context around what is happening.

## Starter Component Code

Here's what we are about to do:

1. Create the **`NavBar`** component for the constant navigation elements
1. Create the **`ApplicationViews`** component. This will define all of the URLs your application will support and which views will be displayed for each one.
1. Change the **`Repairs`** component to display two child components.
1. Update the **`index.js`** to utilize `react-router-dom`.

### NavBar Component

Use this code for your navigation bar and the following CSS.

> ##### `src/components/nav/NavBar.js`

```js
import React from "react"
import { Link } from "react-router-dom"
import "./NavBar.css"

export const NavBar = (props) => {
    return (
        <ul className="navbar">
            <li className="navbar__item active">
                <Link className="navbar__link" to="/customers">Customers</Link>
            </li>
        </ul>
    )
}
```

> ##### `src/components/nav/NavBar.css`

```css
.navbar {
    display: flex;
    flex-wrap: nowrap;
    justify-content: left;
}

.navbar__item {
    flex-basis: 20%;
    list-style-type: none;
}
```

Notice the use of the `<Link/>` component. This comes from the React Router package you installed. It has an attribute named `to`. It will render a hyperlink in your DOM, and when clicked, it will change the URL in the browser to the value of the `to` attribute.

Your job is to add two more `<Link>` components for employees and tickets that will change the browser URL to an appropriate URL.

### Defining the Routes of the Application

Now it's time to define the Routes for our application. In **`NavBar`**, you defined three **`<Link />`** components that will navigate to the routes of...

* `/employees`
* `/customers`
* `/tickets`

In the **`ApplicationViews`** component, you will define how your application will respond when the URL matches each of those patterns. When a user clicks on one of the hyperlinks in the navigation bar, this code dictates which component should be rendered.


> ##### `src/components/ApplicationViews.js`

```jsx
import React from "react"
import { Route } from "react-router-dom"

export const ApplicationViews = () => {
    return (
        <>
            <Route path="/customers">
                <CustomerList />
            </Route>
        </>
    )
}
```

The `<Link/>` and the `<Route/>` JSX elements are complementary to each other. If you add a new **`Link`** element in your application with a new URL, then you must create a matching **`Route`** element.

Your job is to now add a corresponing `<Route>` component for each of the `<Link>` components that you implemented in the nav bar module. Each one should have the appropriate child component that lists the correct data when the user clicks on a link in the nav bar.

### Updating the Repairs Component

As mentioned above, **`Repairs`** is a container component. It renders no HTML itself. It simply *contains* other components that are responsible for the presentation and behavior of the application. In the case of our Kennel, it contains two different kinds of components.

1. **`NavBar`**: This is a _Presentation Component_. Directly expresses HTML.
2. **`ApplicationViews`**: This is a _Controller Component_. Its only responsibility to to control the behavior of the system and maps URLs to components.

> ##### `src/components/Repairs.js`

```js
import React from "react"
import { NavBar } from "./nav/NavBar";
import { ApplicationViews } from "./ApplicationViews";

export const Repairs = () => {
    return (
        <>
            <NavBar />
            <h1>Honey Rae's Repair Shop</h1>
            <ApplicationViews />
        </>
    )
}
```

Now update your `index.js` by adding a new parent  **`<BrowserRouter>`** component for Repairs. This tells React *"I will be placing Routes in my Repairs component."*

> ##### `src/index.js`

```js
import React from "react"
import ReactDOM from "react-dom"
import { BrowserRouter } from "react-router-dom"
import { Repairs } from "./components/Repairs.js"
import "./index.css"

ReactDOM.render(
    <React.StrictMode>
        <BrowserRouter>
            <Repairs />
        </BrowserRouter>
    </React.StrictMode>,
    document.getElementById("root")
)
```

With code in place, you should be able to navigate between multiple views and display different HTML representations.
