# Mock Authentication and Custom Hooks

In this chapter, you are going to create a very simple login screen where a customer can enter in their name, email address, street address and a password. This is not going to be a real authentication system. Real authentication systems are vastly more secure, complex, and robust.

## Login Form Component

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

input[name="remember"] {
    margin: 1em 0.5em 0 0;
}
```

### Starter Component

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
        fetch(`http://localhost:5002/customers?email=${email.current.value}`)
        .then(_ => _.json())
        .then(user => {
            if (user) {
                return user
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

                    props.history.push({
                        pathname: "/locations"
                    })
                } else if (!exists) {
                    fetch("http://localhost:5002/customers", {
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

                        props.history.push({
                            pathname: "/locations"
                        })
                    })
                }
            })


    }

    return (
        <main style={{textAlign:"center"}}>
            <form className="form--login" onSubmit={handleLogin}>
                <h1 className="h3 mb-3 font-weight-normal">Please sign in</h1>
                <fieldset>
                    <label htmlFor="customerName"> Your name </label>
                    <input ref={customerName} type="text"
                        name="customerName"
                        className="form-control"
                        placeholder=""
                        value="Seamus Flannigan"
                        required autoFocus />
                </fieldset>
                <fieldset>
                    <label htmlFor="inputEmail"> Email address </label>
                    <input ref={email} type="email"
                        name="inputEmail"
                        className="form-control"
                        placeholder="Email address"
                        value="seamus@gmail.com"
                        required />
                </fieldset>
                <fieldset>
                    <label htmlFor="address"> Street Address </label>
                    <input ref={address} type="text"
                        name="address"
                        className="form-control"
                        placeholder="Your address"
                        value="1000 Universal Court"
                        required />
                </fieldset>
                <fieldset>
                    <label htmlFor="inputPassword"> Password </label>
                    <input ref={password} type="password"
                        id="password"
                        className="form-control"
                        placeholder="Password"
                        required />
                </fieldset>
                <fieldset>
                    <button type="submit">
                        Sign in
                    </button>
                </fieldset>
            </form>
        </main>
    )
}
 export default withRouter(Login)
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
        if (localStorage.getItem("kennel_token") !== null) {
            return <EmployeeList {...props} />
        } else {
            return <Login />
        }
    }
} />
```