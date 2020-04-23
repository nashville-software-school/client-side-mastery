# Mock Authentication

> **Instructor Note:** Authentication is not a learning objective of your time here at NSS. The code in this chapter is intended to be copied and used, but not understood for now. Your job is still to render UI components using related data.

In this chapter, you are going to create a very simple login screen where a customer can enter in their name, email address, and a password. This is not going to be a real authentication system. Real authentication systems are vastly more secure, complex, and robust.

The best part about this chapter is that you don't need to understand **any of it**. Just copy pasta the code into your application, verify it works, talk to your instructors if it doesn't so they can fix it, and then move on.

Here's the process that this code follows.

1. When the application first renders, it checks for a `kennel_customer` item in local storage.
1. If the item is there, the user is authenticated and the application renders.
1. If the item is not there, render the Login form instead.
1. When the user fills out the form and clicks the submit button, query the API to see if a user with the specified email already exists.
1. If the user already exists, and the passwords match, set the `kennel_customer` item in local storage, and re-route user to root URL.
1. If the user exists, but the passwords don't match, display and alert about that to the user.
1. If the user does not exist, create the new customer resource in the API, set the `kennel_customer` item in local storage, and re-route user to root URL.
1. Only display the "Logout" item in the navigation bar if the user is authenticated.

## Requiring User to Login

What determines if a user has authenticated? It's the `kennel_customer` key that you set in local storage. If that key exists, the user is authenticated. If it does not exist, the user is not authenticated and should be presented with the login component.

Time to refactor the **`Kennel`** component again. The new logic will determine if the local storage item exists _(which determines if the user already authenticated)_.

If it does not exist, the user gets redirected to `/login` which renders the **`Login`** component.

If it does exist, the application gets rendered.

Since this is now going tobe the responsiblity of **`Kennel`**, rename your current Kennel component to **`Dashboard`**. Then make `Kennel.js` again and place the following code init.


> ##### `src/components/Kennel.js`

```js
import React, { useState } from "react"
import Dashboard from "./Dashboard"
import Auth from "./auth/Auth"

export default () => {
    const [check, update] = useState(false)
    const toggle = () => update(!check)

    return (
        localStorage.getItem("kennel_customer") ? <Dashboard /> : <Auth toggle={toggle} />
    )
}
```

## Installing Authentication Components

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nashville-software-school/client-side-mastery/cohort-39/book-4-nashville-kennels/chapters/scripts/auth.sh)"
```



### Nashville Kennels Logo Dog

First, download the following image to the path specified.

> ##### `src/components/auth/logo.png`

![](./images/logo.png)
