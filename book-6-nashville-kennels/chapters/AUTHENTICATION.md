# Ch 13: Authentication and Conditional Rendering

> **Instructor Note:** Authentication is not a learning objective of your time here at NSS. The code in this chapter is intended to be copied and used, but not understood for now. Your job is still to render UI components using related data.

In this chapter, you are going to enable two things:

1. A login form where a customer can enter in their email address. (We'll be skipping password authentication for now)
1. A registration form where the user can enter their name and email.

This is not going to be a real authentication system. Real authentication systems are vastly more secure, complex, and robust.

The best part about this chapter is that you don't need to understand **any of it**. Follow the instructions, verify that registration and login works, or talk to your instructors if it doesn't so we can fix it.

Here's the process this code follows.

1. When the application first renders, it checks for a `kennel_customer` item in session storage.
1. If the item is there, the user is authenticated and the application renders.
1. If the item is not there, render the Login form instead.
1. When the user fills out the form and clicks the submit button, query the API to see if a user with the specified email already exists.
1. If the user already exists, set the `kennel_customer` item in session storage, and display the Dashboard.
1. If the user does not exist, alert that fact to the user.

## Installing Authentication Components

Now install the mock authentication components into your application.

1. In the terminal, make sure you are in the `kennels` directory.
1. Run the following command in that directory.

    ```sh
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nashville-software-school/client-side-mastery/blob/evening-cohort-17/book-6-nashville-kennels/chapters/scripts/auth.sh"
    ```
1. Go to Visual Studio Code and you will see a new `src/components/auth` directory with 4 new files in it.
   1. `Register.js`
   1. `Login.js`
   1. `Login.css`
   1. `logo.png`

## Requiring User to Login

What determines if a user has authenticated? It's the `kennel_customer` key that you set in session storage. If the key exists, the user is authenticated. If it does not exist, the user is not authenticated and should be presented with the login component.

The entry point of our app is in `kennel.js`. At our entry point, we need to determine if the user is already authenticated, create a method to set the authentication (login) and a method to remove the authentication (logout).  Finally, we need to pass the appropriate props to `NavBar` and`ApplicationViews`.

> kennel.js
```js 
import React, {useState} from "react"
import { NavBar } from "./nav/NavBar"
import { ApplicationViews } from "../ApplicationViews"
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
            <ApplicationViews 
                setAuthUser={setAuthUser}
                isAuthenticated={isAuthenticated}
                setIsAuthenticated={setIsAuthenticated}
            />
        </>
    )
}
```

Refactor `ApplicationViews` to pass in the state value of `isAuthenticated` and the method `setIsAuthenticated` as props.


> ApplicationViews.js
```js
export const ApplicationViews = ({ isAuthenticated, setIsAuthenticated }) => {
```


Next add the conditional logic checking the value of `isAuthenticated`. If there is not a user in session storage, users should be redirected to the login. To get started with this, we are going to define two new functions for checking and setting the authentication.

Add the follwing code to your `ApplicationViews.js`, just below the definition.

```js
const PrivateRoute = ({ children }) => {
        return isAuthenticated ? children : <Navigate to="/login" />;
    }
  
    const setAuthUser = (user) => {
      sessionStorage.setItem("kennel_customer", JSON.stringify(user))
      setIsAuthenticated(sessionStorage.getItem("kennel_customer") !== null)
    }
```
You will not be expected to fully understand the above code piece, only that it is necessary for authentication routes.  Briefly, `PrivateRoute` is redirecting users to `/login` if `isAuthenticated` is false and allowing users to the route if `isAuthenticated` is true.  

The `?` syntax is a ternary (shortened sytax for an if statement).  The `setAuthUser` is where the user gets set in sessionStorage (in the browser) to be marked as authenticated whenever a new route is requested. 

Continue to update `ApplicationViews.js` by adding routes for `/login` and `/register`.

Remember these Routes need to be added between your `<Routes>` and `</Routes>` tags.

> ApplicationViews.js
```js
 <Route exact path="/login" element={<Login setAuthUser={setAuthUser} />} />
<Route exact path="/register" element={<Register />} />
```

Finally, you will need to define which routes are private.  You do this by wrapping `<PrivateRoute>` tags around the component you are rendering.  For example in ApplicationViews.js your `/animals route should now look like:

```js
<Route excat path="/animals" element={
    <PrivateRoute>
        <AnimalList />
    </PrivateRoute>
} />
```
## Check your DATA
Each customer will need an email property.


**Check for react-router-dom useNavigate()** You may need to import the `useNavigate` into your Login and Register components and then invoke it.

## Register an Account

Once you have made all these changes, you should be presented with the Register/Login view. Create an account by filling out the registration form. When you complete that, you will immediately see your main view.

You will also now see a new entry in your session storage.

**NOTE ABOUT A "USER ALREADY EXISTS" ERROR:** If you're seeing this message the first time registering a user, try going into your database json file and adding an `email` to any objects in the `customers` array.

## Practice: No Content for You!

Ensure that customers can't access locations, owners, or employees unless they submit authentication.

## Practice: Change the view once the user logs in

Once a user logs in, redirect them to the `home` route. You will need to refactor the `login` route. With routes, consider when you will need to use `component` vs `render` and the use of `{...props}`.

## Challenge: No Animal ID in API

What if an animalId is no longer available in the API? Write a conditional to display something different if an animal(user, employee or location) is not available/valid.

## Challenge: Active NavBar Route

In the NavBar, highlight the active section. For example, if you are viewing `Animals`, change the `<NavBar>` Animals link to `lime` (you could also disable the ability to click). Since the `<NavBar` is not part of a route, you will need to `export default withRouter(NavBar)` in order to have access to the router location properties.

> **NOTES:**

> You'll need to import `withRouter` from `react-router-dom`.

> You might want to check out the docs for [`<NavLink>`](https://github.com/ReactTraining/react-router/blob/master/packages/react-router-dom/docs/api/NavLink.md)

## Fun Challenge: Remember Me

1. Add a checkbox beneath the login form labeled _Remember Me_.
2. When the customer logs in and the checkbox is not checked, then save their information to session storage
3. When the customer logs in and the checkbox is checked, then save their information to local storage
4. **Tip** You will need to store the value of the checkbox in state.

[Return  to Book 6's Table of Contents](../README.md)

[Ch 14: Edit Animal Details](./REACT_EDIT.md)