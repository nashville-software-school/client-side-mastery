# Mock Authentication

In this chapter, you are going to create a very simple login screen where a customer can enter in their name, email address, street address and a password. This is not going to be a real authentication system. Real authentication systems are vastly more secure, complex, and robust.

The best part about this chapter is that you don't need to understand **any of it**. Just copy pasta the code into your application, verify it works, talk to your instructors if it doesn't so they can fix it, and then move on.

Here's the process that this code follows.

1. When the user clicks on the "Employees" item in the navigation bar, check for a `kennel_customer` item in local storage.
1. If the item is there, the user is authenticated. Re-route to root URL.
1. If the item is not there, render the Login form instead of the employee list.
1. When the user fills out the form and clicks the submit button, query the API to see if a user with the specified email already exists.
1. If the user already exists, and the passwords match, set the `kennel_customer` item in local storage, and re-route user to root URL.
1. If the user exists, but the passwords don't match, display and alert about that to the user.
1. If the user does not exist, create the new customer resource in the API, set the `kennel_customer` item in local storage, and re-route user to root URL.
1. Only display the "Logout" item in the navigation bar if the user is authenticated.

## Login Form Component

> ##### `src/components/auth/Login.css`

### Styling

```css
.form--login {
    display: inline-block;
    margin: 0 auto;
    text-align: left;
}

.form--login > fieldset > input[type="email"],
.form--login > fieldset > input[type="password"] {
    width: 25em;
}

.label--login {
    width: 8rem;
    display: inline-block;
}

.form-control {
    width: 72%;
}
```

### Starter Component

> ##### `src/components/auth/Login.js`

```jsx
import React, { useRef } from "react"
import { withRouter } from "react-router-dom"
import "./Login.css"

const Login = props => {
    const email = useRef()
    const password = useRef()
    const customerName = useRef()
    const address = useRef()

    const existingUserCheck = () => {
        return fetch(`http://localhost:8088/customers?email=${email.current.value}`)
            .then(_ => _.json())
            .then(user => {
                if (user.length) {
                    return user[0]
                }
                return false
            })
    }

    // Simplistic handler for login submit
    const handleLogin = (e) => {
        e.preventDefault()

        existingUserCheck()
            .then(exists => {
                if (exists && exists.password === password.current.value) {
                    localStorage.setItem("kennel_customer", exists.id)
                    props.history.push("/")
                } else if (exists && exists.password !== password.current.value) {
                    window.alert("Password does not match")
                } else if (!exists) {
                    fetch("http://localhost:8088/customers", {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json"
                        },
                        body: JSON.stringify({
                            email: email.current.value,
                            password: password.current.value,
                            name: customerName.current.value,
                            address: address.current.value
                        })
                    })
                        .then(_ => _.json())
                        .then(response => {
                            localStorage.setItem("kennel_customer", response.id)

                            props.history.push("/locations")
                        })
                }
            })
    }

    return (
        <main style={{ textAlign: "center" }}>
            <form className="form--login" onSubmit={handleLogin}>
                <h1 className="h3 mb-3 font-weight-normal">Please sign in</h1>
                <fieldset className="fieldset--login">
                    <label className="label--login" htmlFor="customerName"> Your name </label>
                    <input ref={customerName} type="text"
                        name="customerName"
                        className="form-control"
                        placeholder=""
                        defaultValue="Seamus Flannigan"
                        required autoFocus />
                </fieldset>
                <fieldset className="fieldset--login">
                    <label className="label--login" htmlFor="inputEmail"> Email address </label>
                    <input ref={email} type="email"
                        name="inputEmail"
                        className="form-control"
                        placeholder="Email address"
                        defaultValue="seamus@gmail.com"
                        required />
                </fieldset>
                <fieldset className="fieldset--login">
                    <label className="label--login" htmlFor="address"> Street Address </label>
                    <input ref={address} type="text"
                        name="address"
                        className="form-control"
                        placeholder="Your address"
                        defaultValue="1000 Universal Court"
                        required />
                </fieldset>
                <fieldset className="fieldset--login">
                    <label className="label--login" htmlFor="inputPassword"> Password </label>
                    <input ref={password} type="password"
                        id="password"
                        className="form-control"
                        placeholder="Password"
                        required />
                </fieldset>
                <button type="submit">
                    Sign in
                </button>
            </form>
        </main>
    )
}

export default Login
```

## Requiring User to Login

Open **`ApplicationViews`** and now you need to write some conditions for when a component should be rendered. You decide to make your application not show **anything** to the user unless she can logged in.

What determines if a user has authenticated? It's the `kennel_customer` key that you set in local storage. If that key exists, the user is authenticated. If it does not exist, the user is not authenticated and should be presented with the login component.

> ##### `src/components/ApplicationViews.js`

First, import the login component.

```js
import Login from "./auth/Login"
```

Then put the condition in the route. If the user is authenticated, return the corresponding component. If the user is not authenticated, return the login component.

```js
<Route exact path="/employees" render={
    props => {
        if (localStorage.getItem("kennel_customer") !== null) {
            return <EmployeeList {...props} />
        }
        return <Login {...props} />
    }
} />
```

## Logout Link

> ##### `src/components/nav/NavBar.js`

```jsx
<li className="navbar__item">
    <Link className="navbar__link" to="/employees">Employees</Link>
</li>

{
    localStorage.getItem("kennel_customer")
        ? <li className="navbar__item">
            <Link className="navbar__link"
                to=""
                onClick={e => {
                    e.preventDefault()
                    localStorage.removeItem("kennel_customer")
                    props.history.push("/")
                }}
            >Logout</Link>
        </li>
        : ""
}
```

## Allow NavBar to use History

> ##### `src/components/Kennel.js`

```jsx
export default () => (
    <>
        <Route render={props => <NavBar {...props} />} />
        <Route render={props => <ApplicationViews {...props} />} />
    </>
)
```

## Practice: Protect All Routes

Update your **`ApplicationViews`** component so that user cannot see any view without authenticating first.

