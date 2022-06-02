# Mock Authentication

> **Instructor Note:** Authentication is not a learning objective of your time here at NSS. The code in this chapter is intended to be copied and used, but not understood for now. Your job is still to render UI components using related data.

In this chapter, you are going to enable two things:

1. A login form where a customer can enter in their email address. (We'll be skipping password authentication for now)
1. A registration form where the user can enter their name and email.

This is not going to be a real authentication system. Real authentication systems are vastly more secure, complex, and robust.

<img src="./images/honey-rae-auth.gif" alt="animation of register, login, and logout" width="800px" />

## Video Walkthrough

First, watch the [Honey Rae Repairs - Authentication](https://vimeo.com/572858414) video to watch how the code is implemented. Then you can read on and start using the code that is provided.

## Requiring User to Login

What determines if a user has authenticated? It's the `honey_customer` key that you set in local storage. If that key exists, the user is authenticated. If it does not exist, the user is not authenticated and should be presented with the login component.

Open your **`Repairs`** component and place the following code in it.

```js
import React from "react";
import { Route, Redirect } from "react-router-dom";
import { ApplicationViews } from "./ApplicationViews";
import { NavBar } from "./nav/NavBar";
import { Login } from "./auth/Login";
import { Register } from "./auth/Register";
import "./Repairs.css";

export const Repairs = () => (
  <>
    <Route
      render={() => {
        if (localStorage.getItem("honey_customer")) {
          return (
            <>
              <NavBar />
              <ApplicationViews />
            </>
          );
        } else {
          return <Redirect to="/login" />;
        }
      }}
    />

    <Route path="/login">
      <Login />
    </Route>
    <Route path="/register">
      <Register />
    </Route>
  </>
);
```

## Installing Authentication Components

Now you can install the mock authentication components into your application.

1. In the terminal, make sure you are in the `honey-rae-repairs` directory.
1. Run the following command in that directory.

    ```sh
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nashville-software-school/client-side-mastery/master/book-7-honey-rae-repairs/chapters/scripts/auth.sh)"
    ```
1. Go to Visual Studio Code and you will see a new `src/components/auth` directory with 4 new files in it.
   1. `Register.js`
   1. `Login.js`
   1. `Login.css`
   1. `logo.png`

## Register an Account

Once you have made all these changes, you should be presented with the Register/Login view. Create an account by filling out the registration form. When you complete that, you will immediately see your main view.

You will also now see a new entry in your local storage named `honey_customer` with a numeric value.

If you're unsure how to verify this, watch the quick [Chrome DevTools Tutorial 8:Application Tab, Local Storage and Cookies](https://youtu.be/XSfTz9SZjTM?t=76) video to review how to look in local storage.
