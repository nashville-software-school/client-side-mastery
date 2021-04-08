# Authentication and Conditional Rendering

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

What determines if a user has authenticated? It's the `kennel_customer` key that you set in session storage. If that key exists, the user is authenticated. If it does not exist, the user is not authenticated and should be presented with the login component.

Refactor `ApplicationViews` by adding a function to check if there is an item in session storage named kennel_customer.


> ApplicationViews.js
```js
const isAuthenticated = () => sessionStorage.getItem("kennel_customer") !== null;
```
Next add the conditional logic on each route. Be sure to include the routes for login and register. You will need to import those components too.

```js
<Route exact path="/animals">
	if(isAuthenticated()) {
		<AnimalList />
	}else {
		<Redirect to="/login"/>
	}
</Route>

<Route path="/login">
	<Login />
</Route>

<Route path="/register">
	<Register />
</Route>
```

## Check your DATA
Each customer will need an email property.

## Installing Authentication Components

Now you can install the mock authentication components into your application.

1. In the terminal, make sure you are in the `kennels` directory.
1. Run the following command in that directory.

    ```sh
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nss-day-cohort-47/client-side-mastery/master/book-4-nashville-kennels/chapters/scripts/auth.sh)"
    ```
1. Go to Visual Studio Code and you will see a new `src/components/auth` directory with 4 new files in it.
   1. `Register.js`
   1. `Login.js`
   1. `Login.css`
   1. `logo.png`

**Check for react-router-dom useHistory()** You may need to import the `useHistory` into your Login and Register components and then invoke it.

## Register an Account

Once you have made all these changes, you should be presented with the Register/Login view. Create an account by filling out the registration form. When you complete that, you will immediately see your main view.

You will also now see a new entry in your local storage.

**NOTE ABOUT A "USER ALREADY EXISTS" ERROR:** If you're seeing this message the first time registering a user, try going into your database json file and adding an `email` to any objects in the `customers` array