#!/bin/bash
set -u

rm ./src/App*
mkdir -p ./src/components/nav
mkdir -p ./src/components/auth
mkdir -p ./src/components/tickets
mkdir -p ./src/components/views

echo 'import { Repairs } from "./components/Repairs"
import { createRoot } from "react-dom/client"
import "./index.css"
import { BrowserRouter } from "react-router-dom"

const container = document.getElementById("root")
const root = createRoot(container)
root.render(
    <BrowserRouter>
        <Repairs />
    </BrowserRouter>
)
' > ./src/index.js


echo 'export const TicketList = () => {
    return <h2>List of Tickets</h2>
}
' > ./src/components/tickets/TicketList.js

echo 'import { Navigate, useLocation } from "react-router-dom"

export const Authorized = ({ children }) => {
    const location = useLocation()

    if (localStorage.getItem("honey_user")) {
        return children
    }
    else {
        return <Navigate
            to={`/login/${location.search}`}
            replace
            state={{ location }} />
    }
}
' > ./src/components/views/Authorized.js

echo 'import { Route, Routes } from "react-router-dom"
import { Authorized } from "./views/Authorized"
import { ApplicationViews } from "./views/ApplicationViews"
import { NavBar } from "./nav/NavBar"
import { Login } from "./auth/Login"
import { Register } from "./auth/Register"
import "./Repairs.css"


export const Repairs = () => {
	return <Routes>
		<Route path="/login" element={<Login />} />
		<Route path="/register" element={<Register />} />

		<Route path="*" element={
			<Authorized>
				<>
					<NavBar />
					<ApplicationViews />
				</>
			</Authorized>

		} />
	</Routes>
}
' > ./src/components/Repairs.js

echo '/* Import the google web fonts you want to use */
@import url("https://fonts.googleapis.com/css?family=Comfortaa|Patua+One");

/*Typography
--------------------------------------------------------------*/
body,
button,
input,
select,
textarea {
  color: #404040;
  font-family: "Comfortaa", Arial, sans-serif;
  font-size: 14px;
  line-height: 1.5;
}

body {
    padding: 0 3rem;
}

h1, h2, h3, h4, h5, h6 {
  font-family: "Patua One", serif;
  letter-spacing: 2px;
}

p {
  margin-bottom: 1.5em;
}

.title--main {
  margin-block-end: 0;
}
' > ./src/components/Repairs.css

echo 'import { Link, useNavigate } from "react-router-dom"
import "./NavBar.css"

export const NavBar = () => {
    const navigate = useNavigate()

    return (
        <ul className="navbar">
            <li className="navbar__item active">
                <Link className="navbar__link" to="/tickets">Tickets</Link>
            </li>
            {
                localStorage.getItem("honey_user")
                    ? <li className="navbar__item navbar__logout">
                        <Link className="navbar__link" to="" onClick={() => {
                            localStorage.removeItem("honey_user")
                            navigate("/", {replace: true})
                        }}>Logout</Link>
                    </li>
                    : ""
            }
        </ul>
    )
}
' > ./src/components/nav/NavBar.js

echo '.navbar {
    display: flex;
    flex-wrap: nowrap;
    justify-content: left;
}

.navbar__item {
    flex-basis: 20%;
    list-style-type: none;
}

.navbar__logout {
    margin-left: auto;
}
' > ./src/components/nav/NavBar.css


echo 'export const ApplicationViews = () => {
	return <>
		<h1 className="title--main">Honey Rae Repairs</h1>
		<div>Your one-stop shop for repairing your tech</div>
	</>
}
' > ./src/components/views/ApplicationViews.js

echo 'import { useState } from "react"
import { useNavigate } from "react-router-dom"
import "./Login.css"

export const Register = (props) => {
    const [customer, setCustomer] = useState({
        email: "",
        fullName: "",
        isStaff: false
    })
    let navigate = useNavigate()

    const registerNewUser = () => {
        return fetch("http://localhost:8088/users", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(customer)
        })
            .then(res => res.json())
            .then(createdUser => {
                if (createdUser.hasOwnProperty("id")) {
                    localStorage.setItem("honey_user", JSON.stringify({
                        id: createdUser.id,
                        staff: createdUser.isStaff
                    }))

                    navigate("/")
                }
            })
    }

    const handleRegister = (e) => {
        e.preventDefault()
        return fetch(`http://localhost:8088/users?email=${customer.email}`)
            .then(res => res.json())
            .then(response => {
                if (response.length > 0) {
                    // Duplicate email. No good.
                    window.alert("Account with that email address already exists")
                }
                else {
                    // Good email, create user.
                    registerNewUser()
                }
            })
    }

    const updateCustomer = (evt) => {
        const copy = {...customer}
        copy[evt.target.id] = evt.target.value
        setCustomer(copy)
    }

    return (
        <main style={{ textAlign: "center" }}>
            <form className="form--login" onSubmit={handleRegister}>
                <h1 className="h3 mb-3 font-weight-normal">Please Register for Honey Rae Repairs</h1>
                <fieldset>
                    <label htmlFor="fullName"> Full Name </label>
                    <input onChange={updateCustomer}
                           type="text" id="fullName" className="form-control"
                           placeholder="Enter your name" required autoFocus />
                </fieldset>
                <fieldset>
                    <label htmlFor="email"> Email address </label>
                    <input onChange={updateCustomer}
                        type="email" id="email" className="form-control"
                        placeholder="Email address" required />
                </fieldset>
                <fieldset>
                    <input onChange={(evt) => {
                        const copy = {...customer}
                        copy.isStaff = evt.target.checked
                        setCustomer(copy)
                    }}
                        type="checkbox" id="isStaff" />
                    <label htmlFor="email"> I am an employee </label>
                </fieldset>
                <fieldset>
                    <button type="submit"> Register </button>
                </fieldset>
            </form>
        </main>
    )
}
' > ./src/components/auth/Register.js

echo 'import React, { useState } from "react"
import { Link } from "react-router-dom";
import { useNavigate } from "react-router-dom"
import "./Login.css"

export const Login = () => {
    const [email, set] = useState("hpassfield7@netvibes.com")
    const navigate = useNavigate()

    const handleLogin = (e) => {
        e.preventDefault()

        return fetch(`http://localhost:8088/users?email=${email}`)
            .then(res => res.json())
            .then(foundUsers => {
                if (foundUsers.length === 1) {
                    const user = foundUsers[0]
                    localStorage.setItem("honey_user", JSON.stringify({
                        id: user.id,
                        staff: user.isStaff
                    }))

                    navigate("/")
                }
                else {
                    window.alert("Invalid login")
                }
            })
    }

    return (
        <main className="container--login">
            <section>
                <form className="form--login" onSubmit={handleLogin}>
                    <h1>Honey Rae Repairs</h1>
                    <h2>Please sign in</h2>
                    <fieldset>
                        <label htmlFor="inputEmail"> Email address </label>
                        <input type="email"
                            value={email}
                            onChange={evt => set(evt.target.value)}
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
' > ./src/components/auth/Login.js

echo '.h1, h1 {
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

.form--login > fieldset > input[type="email"] {
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
' > ./src/components/auth/Login.css
