# Lift State And Passing Props Down

The Kennel owner has decided that only part of the app should be visible when a user is **not** logged in. Anyone should be able to view `Home` and `Locations` in the navbar while the other areas are only available to logged in users. Also, only the location name, phone number, and address should be displayed unless the user is logged in. This means that **`<ApplicationViews>`** and _`Navbar`_ need to know the state of the user. Since the **`<Kennel>`** is the common parent component it will become the owner of `user state`.

Remember:

1. State can only be passed down
1. Only the component that owns state can change state
1. State can only be changed by calling a `setXXX()`
1. Within a component, props cannot be changed (however, new variables can be defined)
1. Functions can be passed to children components.

_Thinking in React_: I need to move the state of the user to a common parent component. I can then pass the state of user as props to **`<ApplicationViews>`** and **`<Navbar>`**. Based on the props of the user, I can show different components. Also, the **`<Kennel>`** is the only place that can change the user state so I need a function to `updateUser`.

## Refactor the Kennel Component

1. Move `isAuthenticated()` from **`<ApplicationViews>`** to **`<Kennel>`**.
1. Add `state` for the user to **`<Kennel>`**
1. Add a `useEffect()` to **`<Kennel>`**. This should invoke `isAuthenticated` and use a `setUser` function to add the user to state.
1. Move the functionality of setting a user to the **`<Kennel>`**. This will also `setUser` to update a user.
1. Pass the `hasUser` from **`<Kennel>`** to **`<ApplicationViews>`** and **`<NavBar>`**
1. Pass the `setUser` function to the needed components. You will need to pass this as a prop to children (grand-children) components in order to invoke a change in the **`<Kennel>`** state.

> Kennel.js

```jsx
import React, { useState } from "react";
import NavBar from "./nav/NavBar";
import ApplicationViews from "./ApplicationViews";
import "./Kennel.css";

const Kennel = () => {
  const isAuthenticated = () => sessionStorage.getItem("credentials") !== null;

  const [hasUser, setHasUser] = useState(isAuthenticated());

  const setUser = user => {
    sessionStorage.setItem("credentials", JSON.stringify(user));
    setHasUser(isAuthenticated());
  };

  return (
    <>
      <NavBar hasUser={hasUser} />
      <ApplicationViews hasUser={hasUser} setUser={setUser} />
    </>
  );
};

export default Kennel;
```

## Refactor NavBar Component

Display the nav links based on the user status. You can use a ternary statement and check for the user.

> Navbar.js

```jsx
import React from "react";
import { Link } from "react-router-dom";
import "./NavBar.css";

const NavBar = props => {
  return (
    <header>
      <h1 className="site-title">
        Student Kennels
        <br />
        <small>Loving care when you're not there.</small>
      </h1>
      <nav>
        <ul className="container">
          <li>
            <Link className="nav-link" to="/"> Home </Link>
          </li>
          {props.hasUser
            ? <li>
                <Link className="nav-link" to="/animals"> Animals </Link>
              </li>
            : null}
          <li>
            <Link className="nav-link" to="/locations"> Locations </Link>
          </li>
          {props.hasUser
            ? <li>
                <Link className="nav-link" to="/employees"> Employees </Link>
              </li>
            : null}
          {props.hasUser
            ? <li>
                <Link className="nav-link" to="/owners"> Owners </Link>
              </li>
            : null}
          {!props.hasUser
            ? <li>
                <Link className="nav-link" to="/login"> Login </Link>
              </li>
            : null}
        </ul>
      </nav>
    </header>
  );
};

export default NavBar;
```

## Refactor Routes in Application Views

Since the `isAuthenticated` method has been moved to the **`<Kennel>`** and we are passing the user as props to **`<ApplicationViews>`** we need to modify the routes based on the user props.

Also, we need to pass the `setUser` function to the **`<Login>`** component as a prop. This will allow us to call the function and change the state of user in the **`<Kennel>`**.

> ApplicationViews.js

```js
const ApplicationViews = (props) => {
  const hasUser = props.hasUser;
  const setUser = props.setUser;

// ... code omitted for brevity...

  //check for the user
  <Route exact path="/animals" render={props => {
    if (hasUser) {
      return <AnimalList {...props} />
    } else {
      return <Redirect to="/login" />
    }
  }} />

// ... code omitted for brevity...

  //pass the `setUser` function to Login component.
  <Route path="/login" render={props => {
    return <Login setUser={setUser} {...props} />
  }} />
```

Remember to update the `handleLogin()` function in the `<Login>` component to use the `setUser()` function.

### Spread Syntax

Allows an object expression to be expanded in places where zero or more key-value pairs (for object literals) are expected.[MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax)

Makes a copy of all the props on the parent into the component.
`{...props}`
