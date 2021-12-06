# Mock Authentication

> **Instructor Note:** Authentication is not a learning objective of your time here at NSS. The code in this chapter is intended to be copied and used, but not understood for now. Your job is still to render UI components using related data.

In this chapter, you are going to enable two things:

1. A login form where a customer can enter in their email address. (We'll be skipping password authentication for now)
1. A registration form where the user can enter their name and email.

This is not going to be a real authentication system. Real authentication systems are vastly more secure, complex, and robust.

The best part about this chapter is that you don't need to understand **any of it**. Follow the instructions, verify that registration and login works, or talk to your instructors if it doesn't so they can fix it.

Here's the process that this code follows.

1. When the application first renders, it checks for a `kennel_customer` item in local storage.
1. If the item is there, the user is authenticated and the application renders.
1. If the item is not there, render the Login form instead.
1. When the user fills out the form and clicks the submit button, query the API to see if a user with the specified email already exists.
1. If the user already exists, set the `kennel_customer` item in local storage, and display the Dashboard.
1. If the user does not exist, alert that fact to the user.

## Requiring User to Login

What determines if a user has authenticated? It's the `kennel_customer` key that you set in local storage. If that key exists, the user is authenticated. If it does not exist, the user is not authenticated and should be presented with the login component.

Open your **`Kennel`** component and place the following code in it. Replace what is currently there. This is exactly what your **`KandyKorner`** component will look like in that application. All you will change is the local storage key to something like "kandy_customer".

```js
import React, { useState } from "react";
import { NavBar } from "./nav/NavBar";
import { ApplicationViews } from "./ApplicationViews";
import "./Kennel.css";
import { Routes, Route, Navigate } from "react-router";
import { Login } from "./auth/Login";
import { Register } from "./auth/Register";

export const Kennel = () => {
  const [loggedin, setLoggedin] = useState(false);

  const changeState = (bool) => setLoggedin(bool);

  if (localStorage.getItem("kennel_customer")) {
    return (
      <>
        <NavBar />
        <ApplicationViews />
      </>
    );
  } else {
    return (
      <Routes>
        <Route path="/" element={<Navigate to="login" />} />
        <Route path="/login" element={<Login setLoggedin={changeState} />} />
        <Route path="/register" element={<Register setLoggedin={changeState} />} />
      </Routes>
    );
  }
};
```

## Add Authentication Components

Now you can add the mock authentication components into your application.

1. In components create an auth folder

1. Create the following files in the auth directory.
   1. `Register.js`
   
```
import React, { useRef } from "react"
import { useNavigate } from "react-router-dom"
import "./Login.css"

export const Register = (props) => {
    const firstName = useRef()
    const lastName = useRef()
    const email = useRef()
    const verifyPassword = useRef()
    const conflictDialog = useRef()
    const navigate = useNavigate()

    const existingUserCheck = () => {
        return fetch(`http://localhost:8088/customers?email=${email.current.value}`)
            .then(res => res.json())
            .then(user => !!user.length)
    }

    const handleRegister = (e) => {
        e.preventDefault()


        existingUserCheck()
            .then((userExists) => {
                if (!userExists) {
                    fetch("http://localhost:8088/customers", {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json"
                        },
                        body: JSON.stringify({
                            email: email.current.value,
                            name: `${firstName.current.value} ${lastName.current.value}`
                        })
                    })
                        .then(res => res.json())
                        .then(createdUser => {
                            if (createdUser.hasOwnProperty("id")) {
                                localStorage.setItem("kennel_customer", createdUser.id)
                                props.setLoggedin(true)
                                navigate("/")
                            }
                        })
                }
                else {
                    conflictDialog.current.showModal()
                }
            })

    }

    return (
        <main style={{ textAlign: "center" }}>

            <dialog className="dialog dialog--password" ref={conflictDialog}>
                <div>Account with that email address already exists</div>
                <button className="button--close" onClick={e => conflictDialog.current.close()}>Close</button>
            </dialog>

            <form className="form--login" onSubmit={handleRegister}>
                <h1 className="h3 mb-3 font-weight-normal">Please Register for NSS Kennels</h1>
                <fieldset>
                    <label htmlFor="firstName"> First Name </label>
                    <input ref={firstName} type="text" name="firstName" className="form-control" placeholder="First name" required autoFocus />
                </fieldset>
                <fieldset>
                    <label htmlFor="lastName"> Last Name </label>
                    <input ref={lastName} type="text" name="lastName" className="form-control" placeholder="Last name" required />
                </fieldset>
                <fieldset>
                    <label htmlFor="inputEmail"> Email address </label>
                    <input ref={email} type="email" name="email" className="form-control" placeholder="Email address" required />
                </fieldset>
                <fieldset>
                    <button type="submit"> Sign in </button>
                </fieldset>
            </form>
        </main>
    )
}

    ```
   3. `Login.js`
   ```
   import React, { useRef } from "react"
import { Link } from "react-router-dom";
import { useNavigate } from "react-router-dom"
import "./Login.css"


export const Login = (props) => {
    const email = useRef()
    const password = useRef()
    const existDialog = useRef()
    const navigate = useNavigate() //now needs to be navigate and useNaviagte()

    const existingUserCheck = () => {
        return fetch(`http://localhost:8088/customers?email=${email.current.value}`)
            .then(res => res.json())
            .then(user => user.length ? user[0] : false)
    }

    const handleLogin = (e) => {
        e.preventDefault()

        existingUserCheck()
            .then(exists => {
                if (exists) {
                    localStorage.setItem("kennel_customer", exists.id)
                    props.setLoggedin(true)
                    navigate("/") // change to navigate("/")
                } else {
                    existDialog.current.showModal()
                }
            })
    }

    return (
        <main className="container--login">
            <dialog className="dialog dialog--auth" ref={existDialog}>
                <div>User does not exist</div>
                <button className="button--close" onClick={e => existDialog.current.close()}>Close</button>
            </dialog>

            <section>
                <form className="form--login" onSubmit={handleLogin}>
                    <h1>Nashville Kennels</h1>
                    <h2>Please sign in</h2>
                    <fieldset>
                        <label htmlFor="inputEmail"> Email address </label>
                        <input ref={email} type="email"
                            id="email"
                            className="form-control"
                            placeholder="Email address"
                            required autoFocus />
                    </fieldset>
                    <fieldset>
                        <button type="submit">
                            Sign in
                        </button>
                    </fieldset>
                </form>
            </section>
            <section className="link--register">
                <Link to="/register">Not a member yet?</Link>
            </section>
        </main>
    )
}


   ```
   5. `Login.css`
   ```
   .h1, h1 {
    font-size: 2.5rem;
}

fieldset {
    min-width: 0;
    padding: 1rem 0;
    margin: 0;
    border: 0;
}

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
    display: block;
    width: 94%;
    height: calc(1.5em + .75rem + 2px);
    padding: .375rem .75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: .25rem;
    -webkit-transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}

.container--login {
    text-align: center;
}

.form--login {
    background-position-x: right;
    
    z-index: 1;
    min-height: 25rem;
    min-width: 45rem;
    background-color: hsla(0,0%,100%,0.40);
    background-blend-mode: overlay;
    background-repeat: no-repeat;
}

.button--close {
    position: relative;
    bottom: -2rem;
}

.dialog {
    min-width: 15rem;
    min-height: 5rem;
}


   ```
   7. `logo.png`

**Check for react-router-dom useHistory()** You may need to import the `useHistory` into your Login and Register components and then invoke it.

## Register an Account

Once you have made all these changes, you should be presented with the Register/Login view. Create an account by filling out the registration form. When you complete that, you will immediately see your main view.

You will also now see a new entry in your local storage.

**NOTE ABOUT A "USER ALREADY EXISTS" ERROR:** If you're seeing this message the first time registering a user, try going into your database json file and adding an `email` to any objects in the `customers` array
