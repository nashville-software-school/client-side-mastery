#!/bin/bash
set -u

mkdir ./src/components/auth
mkdir ./src/views

# Login.jsx
echo 'import React, { useState } from "react"
import { Link } from "react-router-dom"
import { useNavigate } from "react-router-dom"
import "./Login.css"
import { getUserByEmail } from "../../services/userService"

export const Login = () => {
  const [email, set] = useState("hpassfield7@netvibes.com")
  const navigate = useNavigate()

  const handleLogin = (e) => {
    e.preventDefault()

    getUserByEmail(email).then((foundUsers) => {
      if (foundUsers.length === 1) {
        const user = foundUsers[0]
        localStorage.setItem(
          "honey_user",
          JSON.stringify({
            id: user.id,
            isStaff: user.isStaff,
          })
        )

        navigate("/")
      } else {
        window.alert("Invalid login")
      }
    })
  }

  return (
    <main className="container-login">
      <section>
        <form className="form-login" onSubmit={handleLogin}>
          <h1>Honey Rae Repairs</h1>
          <h2>Please sign in</h2>
          <fieldset>
            <div className="form-group">
              <input
                type="email"
                value={email}
                onChange={(evt) => set(evt.target.value)}
                className="form-control"
                placeholder="Email address"
                required
                autoFocus
              />
            </div>
          </fieldset>
          <fieldset>
            <div className="form-group">
              <button className="login-btn btn-info" type="submit">
                Sign in
              </button>
            </div>
          </fieldset>
        </form>
      </section>
      <section>
        <Link to="/register">Not a member yet?</Link>
      </section>
    </main>
  )
}' >./src/components/auth/Login.jsx

# Register.jsx
echo 'import { useState } from "react"
import { useNavigate } from "react-router-dom"
import "./Login.css"
import { createUser, getUserByEmail } from "../../services/userService"

export const Register = (props) => {
  const [customer, setCustomer] = useState({
    email: "",
    fullName: "",
    isStaff: false,
  })
  let navigate = useNavigate()

  const registerNewUser = () => {
    createUser(customer).then((createdUser) => {
      if (createdUser.hasOwnProperty("id")) {
        localStorage.setItem(
          "honey_user",
          JSON.stringify({
            id: createdUser.id,
            staff: createdUser.isStaff,
          })
        )

        navigate("/")
      }
    })
  }

  const handleRegister = (e) => {
    e.preventDefault()
    getUserByEmail(customer.email).then((response) => {
      if (response.length > 0) {
        // Duplicate email. No good.
        window.alert("Account with that email address already exists")
      } else {
        // Good email, create user.
        registerNewUser()
      }
    })
  }

  const updateCustomer = (evt) => {
    const copy = { ...customer }
    copy[evt.target.id] = evt.target.value
    setCustomer(copy)
  }

  return (
    <main style={{ textAlign: "center" }}>
      <form className="form-login" onSubmit={handleRegister}>
        <h1>Honey Rae Repairs</h1>
        <h2>Please Register</h2>
        <fieldset>
          <div className="form-group">
            <input
              onChange={updateCustomer}
              type="text"
              id="fullName"
              className="form-control"
              placeholder="Enter your name"
              required
              autoFocus
            />
          </div>
        </fieldset>
        <fieldset>
          <div className="form-group">
            <input
              onChange={updateCustomer}
              type="email"
              id="email"
              className="form-control"
              placeholder="Email address"
              required
            />
          </div>
        </fieldset>
        <fieldset>
          <div className="form-group">
            <label>
              <input
                onChange={(evt) => {
                  const copy = { ...customer }
                  copy.isStaff = evt.target.checked
                  setCustomer(copy)
                }}
                type="checkbox"
                id="isStaff"
              />
              I am an employee{" "}
            </label>
          </div>
        </fieldset>
        <fieldset>
          <div className="form-group">
            <button className="login-btn btn-info" type="submit">
              Register
            </button>
          </div>
        </fieldset>
      </form>
    </main>
  )
}' >./src/components/auth/Register.jsx

# Login.css
echo '.container-login {
  text-align: center;
}

.container-login > section > a {
  text-decoration: underline;
  color: var(--secondary);
}

.form-login {
  width: 60%;
  margin: 2rem auto;
}

.form-login > h1 {
  font-size: 2.5rem;
  text-align: center;
}

.form-login > h2 {
  text-align: center;
  font-size: 1.5rem;
}

.form-login > fieldset > input[type="email"] {
  width: 25em;
}

.login-btn {
  align-self: flex-end;
}

.login-btn:focus {
  box-shadow: none;
  outline: 2px solid transparent;
  outline-offset: 2px;
}

/************* FORM STYLES *************/

form {
  margin: 3rem 5rem;
  border: 1px solid var(--outline);
  border-radius: 10px;
  padding: 1rem 0rem 0rem 1rem;
  box-shadow: 1px 2px 5px lightgray;
  background-color: var(--offWhite);
}

fieldset {
  min-width: 0;
  padding-bottom: 1.5rem;
  margin: 0;
  border: 0;
}

.form-control {
  height: calc(1.5em + 0.75rem + 2px);
  padding: 0.375rem 0.75rem;
  font-size: 1rem;
  border: 1px solid var(--outline);
  border-radius: 0.25rem;
}

.form-group {
  margin-right: 1rem;
  display: flex;
  flex-direction: column;
}

.form-btn {
  align-self: flex-end;
}

.form-btn:focus {
  box-shadow: none;
  outline: 2px solid transparent;
  outline-offset: 2px;
}' >./src/components/auth/Login.css

# userService.js
echo 'export const getUserByEmail = (email) => {
  return fetch(`http://localhost:8088/users?email=${email}`).then((res) =>
    res.json()
  )
}

export const createUser = (customer) => {
  return fetch("http://localhost:8088/users", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(customer),
  }).then((res) => res.json())
}' >>./src/services/userService.js

# Authorized.jsx
echo 'import { Navigate, useLocation } from "react-router-dom"

// We can access child components the same way we access props. Child components are passed to our props as a key/value pair where
// children is the key.

export const Authorized = ({ children }) => {
  let location = useLocation()

  // Check if user is logged in. If they are, render the CHILD components (in this case, the ApplicationViews component)
  if (localStorage.getItem("honey_user")) {
    return children
  }
  // If the user is NOT logged in, redirect them to the login page using the Navigate component from react-router-dom
  else {
    return <Navigate to={`/login`} state={{ from: location }} replace />
  }
}' >./src/views/Authorized.jsx

# ApplicationViews.jsx
echo 'export const ApplicationViews = () => {
  return <></>
}' >./src/views/ApplicationViews.jsx
