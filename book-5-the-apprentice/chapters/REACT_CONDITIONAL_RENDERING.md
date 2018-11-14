# Conditional Route Rendering

In this chapter, you are going to learn how to configure a `<Route>` to conditionally render one component or another.

## Checking for Simple Authentication

**Note:** The example code below contains an extremely simplified login process. This is not a guide to proper authentication. The login used here is only to demonstrate rendering components based on a user's status

### Login Component

Make a new component directory called `authentication`. In it add a file called `Login.js`.

> Login.js

```js
import React, { Component } from "react"


export default class Login extends Component {

    // Set initial state
    state = {
        email: "",
        password: ""
    }

    // Update state whenever an input field is edited
    handleFieldChange = (evt) => {
        const stateToChange = {}
        stateToChange[evt.target.id] = evt.target.value
        this.setState(stateToChange)
    }

    // Simplistic handler for login submit
    handleLogin = (e) => {
        e.preventDefault()

        /*
            For now, just store the email and password that
            the customer enters into local storage.
        */
        sessionStorage.setItem(
            "credentials",
            JSON.stringify({
                email: this.state.email,
                password: this.state.password
            })
        )
    }

    render() {
        return (
            <form onSubmit={this.handleLogin}>
                <h1 className="h3 mb-3 font-weight-normal">Please sign in</h1>
                <label htmlFor="inputEmail">
                    Email address
                </label>
                <input onChange={this.handleFieldChange} type="email"
                       id="email"
                       placeholder="Email address"
                       required="" autoFocus="" />
                <label htmlFor="inputPassword">
                    Password
                </label>
                <input onChange={this.handleFieldChange} type="password"
                       id="password"
                       placeholder="Password"
                       required="" />
                <button type="submit">
                    Sign in
                </button>
            </form>
        )
    }
}
```

### Route to Show Login

Import this new component into **`ApplicationViews`**.

```js
import Login from './authentication/Login'
```

Update your import statement for `react-router-dom` to get the `<Redirect>` component.

```js
import { Route, Redirect } from "react-router-dom"
```

Then refactor **`ApplicationViews`** by adding a function to check if there is an item in local storage named `credentials`.

```js
export default class ApplicationViews extends Component {

    // Check if credentials are in local storage
    isAuthenticated = () => sessionStorage.getItem("credentials") !== null

    ...
}
```

Then configure a new route that will render the login component.

```js
<Route path="/login" component={Login} />
```

Go to your browser, navigate to the `http://localhost:3000/login` route, fill out the form, then submit it. You should see the object appear in your local storage.

![simple login](./images/alRdBjtuxG.gif)

## Conditional Rendering

Now it's time to implement conditional rendering. You will start with the employees view. The following route configuration will only render the **`EmployeeList`** component if the user is authenticated. If the user is not authenticated (i.e. the `credentials` key does not exist in local storage), then the browser is redirected to `/login` and the login form is rendered.

```js
<Route exact path="/employees" render={props => {
    if (this.isAuthenticated()) {
        return <EmployeeList deleteEmployee={this.deleteEmployee}
                             employees={this.state.employees} />
    } else {
        return <Redirect to="/login" />
    }
}} />
```

1. Replace the code that handles `/employees` in your current route with the above code.
1. Remove the `credentials` item from local storage.
1. Visit `http://localhost:3000/employees`
1. You should be presented with the login screen

User is unable to view list of employees until she logs in.

1. Now fill out the form to put the item back in local storage.
1. Click on the `Employees` item in your nav bar.
1. You should now see the list of employees.

![working conditional routing](./images/kfst2FfzcO.gif)

## Practice: No Content for You!

Ensure that customers can't access locations, animals, or employees unless they submit a login.

## Fun Challenge: Remember Me

1. Add a checkbox beneath the login form labeled _Remember Me_.
1. When the customer logs in and the checkbox is not checked, then save their information to session storage
1. When the customer logs in and the checkbox is checked, then save their information to local storage

![session versus local](./images/WwftJ1Ds2R.gif)
