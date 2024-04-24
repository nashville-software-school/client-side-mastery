# Routing and Authentication
Let's get routing and authentication set up for this application. As you go through the instructions in this chapter, feel free to look to the Honey Rae Repairs code for reference.

## Setup
In the root of your application run the following commands one at a time.

```shell
npm install --save react-router-dom
```

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nashville-software-school/course-bash-scripts/main/client/learn-auth.sh)"
```

This script will make the following directories and files in your project:
```
- src
    - components
      - auth
          - Login.css
          - Login.jsx
          - Register.jsx
    - services
        - userService.js
    - views
      - Authorized.jsx
```

### Wrapping your app with `BrowserRouter`
In `index.js`, wrap the `<App />` component in the `root.render` function with the `<BrowserRouter>` component. You will need to import this from ***react-router-dom***

<details>
  <summary>🔎 Finished Code for index.js</summary>

  ```jsx
  import { App } from "./App"
  import { createRoot } from "react-dom/client"
  import "./index.css"
  import { BrowserRouter } from "react-router-dom"

  const container = document.getElementById("root")
  const root = createRoot(container)
  root.render(
    <BrowserRouter>
      <App />
    </BrowserRouter>
  )
  ```
</details>

### The Register Component
In the `Register` component, the user can fill out a form and register for the application. This will create a new user in the database. Double check the code in this component to see that the property names match what's in your database. Make any necessary changes.

```javascript
const [user, setUser] = useState({
  email: "",
  fullName: "",
  cohort: 0,
})

const registerNewUser = () => {
  const newUser = {
    ...user,
    cohort: parseInt(user.cohort),
  }

  createUser(newUser).then((createdUser) => {
    if (createdUser.hasOwnProperty("id")) {
      localStorage.setItem(
        "learning_user",
        JSON.stringify({
          id: createdUser.id,
          staff: createdUser.isStaff,
        })
      )

      navigate("/")
    }
  })
}
```

## The Routes

### ApplicationViews
Create an `ApplicationViews` component in the `views` directory. Here you are going to define the routes for your application the same way you have done in _Honey Rae Repairs_. ***Don't forget to wrap all your `Route` components in a `Routes` component.***

Define a parent `Route` for the `/` _(home)_ path. Nested inside that route, define a child `Route` to render `AllPosts`. Consider the user story for all posts:

>**Given** the user wishes to view a list of all the posts<br>
>**When** the user is at the ***home route*** or visits the All Posts view<br>
>**Then** the title, topic and number of likes will display for each post in the database.

This route for the `AllPosts` view should render when the path is at the home route. Considering we've made it a child route of the home route, what needs to be added to this route if we want it to render at it's parent route's path?

<details>
  <summary>🔎 Answer</summary>

  ```jsx
  <Routes>
    <Route path="/">
      <Route index element={<AllPosts />} />
    </Route>
  </Route>
  ```
</details>

### Authentication Routes
Now it's time to set up our routes for authentication. In `App.js`, remove the code to render the `<AllPosts />` component and define three more routes.

1. Add a route for the path `/login` that will render the `Login` component.
2. Add a route for the path `/register` that will render the `Register` component.
3. The last route will be a "catch all" route. We want the user to be authenticated before they can access any other path in our application. Add a route for the path `*`. _(This will catch all other paths that haven't been defined yet)_. For the element of this route, render the `ApplicationViews` component wrapped with the `Authorized` component. The `Authorized` component will first check if a user is logged in. If so, it will render the routes we defined in `ApplicationViews`. Otherwise, it will navigate to `/login`.

<details>
  <summary>🔎 Finished Code for app.js</summary>

  ```jsx
  import { Route, Routes } from "react-router-dom"
  import { Login } from "./components/auth/Login"
  import { Register } from "./components/auth/Register"
  import { Authorized } from "./views/Authorized"
  import { ApplicationViews } from "./views/ApplicationViews"

  export const App = () => {
    return (
      <Routes>
        <Route path="/login" element={<Login />} />
        <Route path="/register" element={<Register />} />
        <Route
          path="*"
          element={
            <Authorized>
              <ApplicationViews />
            </Authorized>
          }
        />
      </Routes>
    )
  }
  ```
</details>

### Time to Test!
Navigate to `localhost:3000/login` and confirm that the `Login` component renders. Try logging in! You should be navigated to `localhost:3000` and the `AllPosts` component should render. Open the devtools and check out the Application tab. Check to see that the key `learning_user` is added and the value is an object with an `id` property.

<img src="./images/learning-user.png" width="700" />

Right click on it to delete it. Refresh the page. You should be navigated back to `localhost:3000/login`. Now register a new user. After registering you should once again be navigated to `localhost:3000` and the `AllPosts` component should render. Check your JSON server to confirm the user was added to the database and that it's properties match the rest of your users.

You're all set!

## The NavBar
Time to add your NavBar! Create a `NavBar` component like the one you have in Honey Rae's. Add a link for "All Posts". Where should it navigate to? Add another link to logout. Copy and past the code below for this.

```jsx
{localStorage.getItem("learning_user") ? (
  <li>
    <Link
      to=""
      onClick={() => {
        localStorage.removeItem("learning_user")
        navigate("/login", { replace: true })
      }}
    >
      Logout
    </Link>
  </li>
) : (
  ""
)}
```

The logout Link will remove the `learning_user` from local storage and then navigate back to the login route. However, the navigate function has not bee defined yet. Import `useNavigate` from *react-router-dom* and store the returned function in a variable called `navigate`.

<details>
  <summary>🔎 Need some help?</summary>

  ```jsx
  export const NavBar = () => {
    const navigate = useNavigate()
  ```
</details>

### Render The Navbar
Render the NavBar in the parent home route in `ApplicationViews` so that it renders with all other child routes. Don't forget the `Outlet` component!

## Get The Current User
Finally, let's add state to hold our current user. In `ApplicationViews` create a new state variable for `currentUser`. On the initial render of the application, get the user from local storage and set your `currentUser`.

```javascript
const [currentUser, setCurrentUser] = useState({})

useEffect(() => {
  const localLearningUser = localStorage.getItem("learning_user")
  const learningUserObject = JSON.parse(localLearningUser)
  setCurrentUser(learningUserObject)
}, [])
```

### Time to Test!
When you click on "Logout" in the navbar, the `learning_user` in local storage should be removed and you should be navigated to the login page. Log back in. Open the devtool and inspect the `ApplicationViews` component. Confirm that your user is being stored in state.

Up Next: [Viewing a post's details](./LEARN_POST_DETAILS.md)