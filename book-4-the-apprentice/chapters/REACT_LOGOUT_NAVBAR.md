# React Logout Functionality on Navbar

1. When a user logs in, we should remove the login link and display a logout link.
1. When a user logs out, they should be directed to the home page.

**There are several parts that will need to be refactored for the logout to work.**

## Refactor Kennel

Since the state of user is held in **`<Kennel>`**, we need to write a function that will clear the user and update state. We will then pass `clearUser()` to the **`<NavBar>`** component.

>Kennel.js

```jsx
const clearUser = () => {
  sessionStorage.clear();
  setHasUser(isAuthenticated());
}


//------------------
//pass `clearUser()` as props to the **`<NavBar>`** component
<NavBar hasUser={hasUser} clearUser={clearUser} />
```

### Props of NavBar Component

* hasUser (variable from state of Kennel)
* clearUser (function from Kennel)

## Refactor NavBar Component

When a user clicks on `logout`, we want to clear the user and direct to the home view. We can use react-router-dom's `history.push` method. Since **`<NavBar>`** is NOT part of a route, we will need to export it `withRouter`, which gives us access to the router props (history, location, and match).

Since we are going to perform two steps, it makes sense to create a `handleLogout` method that is triggered when the logout button is clicked.

We will also need to display the login/logout based on the user status. You can use a ternary statement and check for the user.

>Navbar.js

```jsx
import React from "react";
import { withRouter } from 'react-router-dom';
import { Link } from "react-router-dom";
import "./NavBar.css";

const NavBar = props => {
  const handleLogout = () => {
    props.clearUser();
    props.history.push('/');
  }

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
          {props.hasUser
            ? <li>
                <span className="nav-link" onClick={handleLogout}> Logout </span>
              </li>
            : <li>
                <Link className="nav-link" to="/login">Login</Link>
              </li>}
        </ul>
      </nav>
    </header>
  );
};

export default withRouter(NavBar);
```
