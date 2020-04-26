#!/bin/bash
set -u

mkdir -p ./src/components/auth && cd $_

echo 'import React, { useRef } from "react"


export const Register = (props) => {
    const firstName = useRef()
    const lastName = useRef()
    const email = useRef()
    const password = useRef()
    const verifyPassword = useRef()

    const existingUserCheck = () => {
        return fetch(`http://localhost:8088/customers?email=${email.current.value}`)
            .then(_ => _.json())
            .then(user => {
                if (user.length) {
                    return true
                }
                return false
            })
    }

    const handleRegister = (e) => {
        e.preventDefault()

        if (password.current.value === verifyPassword.current.value) {
            existingUserCheck()
                .then(() => {
                    fetch("http://localhost:8088/customers", {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json"
                        },
                        body: JSON.stringify({
                            email: email.current.value,
                            password: password.current.value,
                            name: `${firstName.current.value} ${lastName.current.value}`
                        })
                    })
                        .then(_ => _.json())
                        .then(createdUser => {
                            if (createdUser.hasOwnProperty("id")) {
                                localStorage.setItem("kennel_customer", createdUser.id)
                                props.toggle()
                            }
                        })
                })
        } else {
            window.alert("Passwords do not match")
        }
    }

    return (
        <div className="container--login">
            <form className="form--register" onSubmit={handleRegister}>
                <h4 className="darkgray">If you are not a customer yet, please register a new account</h4>
                <fieldset>
                    <label htmlFor="firstName"> First Name </label>
                    <input ref={firstName} type="text"
                        name="firstName"
                        className="form-control"
                        placeholder="First name"
                        required  />
                </fieldset>
                <fieldset>
                    <label htmlFor="lastName"> Last Name </label>
                    <input ref={lastName} type="text"
                        name="lastName"
                        className="form-control"
                        placeholder="Last name"
                        required />
                </fieldset>
                <fieldset>
                    <label htmlFor="inputEmail"> Email address </label>
                    <input ref={email} type="email"
                        name="email"
                        className="form-control"
                        placeholder="Email address"
                        required />
                </fieldset>
                <fieldset>
                    <label htmlFor="inputPassword"> Password </label>
                    <input ref={password} type="password"
                        name="password"
                        className="form-control"
                        placeholder="Password"
                        required />
                </fieldset>
                <fieldset>
                    <label htmlFor="verifyPassword"> Verify Password </label>
                    <input ref={verifyPassword} type="password"
                        name="verifyPassword"
                        className="form-control"
                        placeholder="Verify password"
                        required />
                </fieldset>
                <fieldset>
                    <button type="submit">
                        Register
                    </button>
                </fieldset>
            </form>
        </div>
    )
}
' >> ./Register.js

echo 'import React, { useRef } from "react"


export const Login = (props) => {
    const email = useRef()
    const password = useRef()

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

    const handleLogin = (e) => {
        e.preventDefault()

        existingUserCheck()
            .then(exists => {
                if (exists && exists.password === password.current.value) {
                    localStorage.setItem("kennel_customer", exists.id)
                    props.toggle()
                } else if (exists && exists.password !== password.current.value) {
                    window.alert("Password does not match")
                } else if (!exists) {
                    window.alert("User account does not exist")
                }
            })
    }

    return (
        <div className="container--login">
            <form className="form--login" onSubmit={handleLogin}>
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
        </div>
    )
}
' >> ./Login.js

echo '.darkgray {
    color: #747678;
}

.authContainer {
    display: flex;
    padding: 0 10rem;
    flex-direction: row;
    flex-wrap: wrap;
    justify-content: space-evenly;
}

.h1, h1 {
    font-size: 2.5rem;
}

fieldset {
    min-width: 0;
    padding: 1rem 0;
    margin: 0;
    border: 0;
}

input[type="email"],
input[type="password"] {
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
    flex: 1;
    flex-basis: 33%;
}

.form--login {
    font-size: 1.25rem;
    background-position-x: right;
    z-index: 1;
    min-height: 25rem;
    min-width: 35rem;
    background-color: hsla(0,0%,100%,0.40);
    background-blend-mode: overlay;
    display: inline-block;
    margin: 0 auto;
    text-align: left;

}

.form--register {
    background-position-x: right;
    z-index: 1;
    min-height: 25rem;
    width: 45rem;
    background-color: hsla(0,0%,100%,0.40);
    background-blend-mode: overlay;
    background-repeat: no-repeat;
    display: inline-block;
    margin: 0 auto;
    text-align: left;
}
' >> ./Auth.css

echo 'import React from "react"
import { Login } from "./Login"
import { Register } from "./Register"
import "./Auth.css"


export const Auth = ({toggle}) => {
    return (
        <>
            <h1 className="welcome">Welcome to Nashville Kennels</h1>
            <div className="authContainer">
                <Login toggle={toggle} />
                <Register toggle={toggle} />
            </div>
        </>
    )
}' >> ./Auth.js

curl https://raw.githubusercontent.com/nashville-software-school/client-side-mastery/cohort-37/book-4-nashville-kennels/chapters/images/logo.png > logo.png






