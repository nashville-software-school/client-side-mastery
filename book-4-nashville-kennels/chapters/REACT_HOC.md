# Higher Order Components

A higher order component is when you write a component whose job is to augment a different component and then return that augmented component for your use. We do this in order to add different properties or behaviors to a component without needing to modify the source component itself.

Look in your **`ApplicationViews`** component and you will see several instances of the following route configuration that ensures that your customers are logged in before the component will be rendered.

```js
<Route exact path="/" render={props => {
    if (this.isAuthenticated()) {
        return <LocationList />
    } else {
        return <Login />
    }
}} />
```

As an application grows and matures, you will eventually add other routes to it that will need to configured identically. Rather than writing what is, essentially, the same configuration over and over again, you will create a higher order component that wraps a standard `<Route>` and adds your authentication mechanism to it.

1. Add a new file to your application named `AuthRoute.js`
1. Remove the `isAuthenticated` method from `ApplicationViews.js`
1. Add the following code to `AuthRoute.js`

```js
import React from "react"
import { Route } from "react-router-dom"
import Login from "./Login";

const isAuthenticated = () =>
    localStorage.getItem("credentials") !== null ||
    sessionStorage.getItem("credentials") !== null

const AuthRoute = ({ path, Destination, ...superProps} ) => {
    return (
        <Route exact path={path} render={props => {
            if (isAuthenticated()) {
                return <Destination {...props} {...superProps} />
            } else {
                return <Login />
            }
        }} />
    )
}

export default AuthRoute
```

Now you have a component that makes any route require authentication. It takes two arguments.

1. The path
1. The component to be rendered when the customer is authenticated

Now you can update your **`ApplicationViews`** component and use this new higher order component.

```js
import AuthRoute from './AuthRoute'


export default class ApplicationViews extends Component {

    render() {
        return (
            <React.Fragment>
                <AuthRoute path="/" Destination={LocationList} locations={this.state.locations} />
                <AuthRoute path="/animals" Destination={AnimalList} />
                <AuthRoute path="/employees" Destination={EmployeeList} />
                <AuthRoute path="/search" Destination={SearchResults} />

                // All other route definitions excluded for brevity's sake
            </React.Fragment>
        )
    }
}
```

