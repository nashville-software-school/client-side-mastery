# React Logout Functionality on Navbar

1. When a user logs in, we should remove the login link and display a logout link.
1. When a user logs out, they should be directed to the home page.

**There are several parts that will need to be refactored for the logout to work.**

## Refactor Kennel

Where does the state of the user live? What components need access to the state? With the inclusion of a logout button on the navbar, `NavBar` and `ApplicationViews` will need access to state. 

Refactor the **`<Kennel>`** to `useState`. We will also write a function that will clear the user and update state. We will then pass `clearUser()` to the **`<NavBar>`** component.

>Kennel.js

```jsx
//refactor
import React, {useState} from "react"
import { NavBar } from "./nav/NavBar"
import { ApplicationViews } from "./ApplicationViews"
import "./Kennel.css"

export const Kennel = () => {
    const [isAuthenticated, setIsAuthenticated] = useState(sessionStorage.getItem("kennel_customer") !== null)

    const setAuthUser = (user) => {
        sessionStorage.setItem("kennel_customer", JSON.stringify(user))
        setIsAuthenticated(sessionStorage.getItem("kennel_customer") !== null)
    }

    const clearUser = () => {
        sessionStorage.clear();
        setIsAuthenticated(sessionStorage.getItem("kennel_customer") !== null)
      }

    return (
        <>
            <NavBar clearUser={clearUser} isAuthenticated={isAuthenticated}/>
            <ApplicationViews setAuthUser={setAuthUser} isAuthenticated={isAuthenticated}/>
        </>
    )
}

```

### Props of NavBar Component

* isAuthenticated (variable from state of Kennel)
* clearUser (function from Kennel)

## Refactor NavBar Component

When a user clicks on `logout`, we want to clear the user and direct to the home view. We can use react-router-dom's `history.push` method. Since **`<NavBar>`** is NOT part of a route, we will need to export it `withRouter`, which gives us access to the router props (history, location, and match).

Since we are going to perform two steps, it makes sense to create a `handleLogout` method that is triggered when the logout button is clicked.

We will also need to display the login/logout based on the user status. You can use a ternary statement and check for the user.

>Navbar.js

```jsx
import React from "react";
import { Link, useHistory } from "react-router-dom";
import "./NavBar.css"

export const NavBar = ({ clearUser, isAuthenticated }) => {
    const history = useHistory()

    const handleLogout = () => {
        clearUser();
        history.push('/');
    }

    return (
        <ul className="navbar">
            <li className="navbar__item">
                <Link className="navbar__link" to="/"> Home </Link>
            </li>
            {isAuthenticated
                ? <li className="navbar__item">
                    <Link className="navbar__link" to="/animals"> Animals </Link>
                </li>
                : null}
            <li className="navbar__item">
                <Link className="navbar__link" to="/locations"> Locations </Link>
            </li>
            {isAuthenticated
                ? <li className="navbar__item">
                    <Link className="navbar__link" to="/employees"> Employees </Link>
                </li>
                : null}
            {isAuthenticated
                ? <li className="navbar__item">
                    <Link className="navbar__link" to="/owners"> Owners </Link>
                </li>
                : null}
            {isAuthenticated
                ? <li className="navbar__item">
                    <span className="navbar__link" onClick={handleLogout}> Logout </span>
                </li>
                : <li className="navbar__item">
                    <Link className="navbar__link" to="/login">Login</Link>
                </li>}
        </ul>
    );
};

```
