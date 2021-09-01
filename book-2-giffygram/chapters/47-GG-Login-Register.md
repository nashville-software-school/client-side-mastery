# Login and Register Components

Before we start, lets make some rules about our app and when a user can access the information. It has been decided that you must login to see content. 


So far we have been working with a default user and currently every time our app loads, it sets a default value for `loggedInUser`. Let's create a function that will log the user out.

> scripts/data/DataManager.js

```js
//change declaration to let
let loggedInUser = {
  id: 1,
  name: "Bryan",
  email: "bryan@bn.com"
}

export const logoutUser = () => {
  loggedInUser = {}
}
```

Let's test it out.

> main.js
```js
applicationElement.addEventListener("click", event => {
  if (event.target.id === "logout") {
    logoutUser();
    console.log(getLoggedInUser());
  }
})

```

## Session Storage
In development, we refresh the browser a lot. Currently each time the app loads, it sets the default user. However, we want logged in users. We can take advantage of the browser's storage to hold on to a real user's information so that during a session the user will stay logged in. 

[Session Storage and Local Storage](https://www.w3schools.com/html/html5_webstorage.asp)

First, remove the default user properties.

> scripts/data/DataManager.js

```js
let loggedInUser = {}

```

Instead of immediately invoking `startGiffyGram`, we will want to check `sessionStorage` for a user. The steps we will take are:
1. invoke `checkForUser`
1. If there is a user, set the user in the `DataManager` (write a function to set the user)
1. If there is a user, invoke `startGiffyGram`
1. If there is not a user, show login/register

> main.js

```js
const checkForUser = () => {
  if (sessionStorage.getItem("user")){
    //this is expecting an object. Need to fix
	  setLoggedInUser(JSON.parse(sessionStorage.getItem("user")));
    startGiffyGram();
  }else {
    //show login/register
    console.log("showLogin")
  }
}

```
Be sure to invoke `checkForUser` first.

The second step was to write a function to set the user in the DataManger. Let's do that now.

> data/DataManager.js

```js
export const setLoggedInUser (userObj) => {
  loggedInUser = userObj;
}
```

## No User? Login or Register
We need to create a couple of components: `LoginForm` and `RegisterForm`.

> auth/LoginForm.js
```js
export const LoginForm = () => {

	return `
		<div class="newPost">
		<h3>Login</h3>
			<div>
				<input value=""
					name="name"
					class="newPost__input"
					type="text"
					placeholder="User Name" />
			</div>
			<div>
				<input value=""
					name="email"
					class="newPost__input"
					type="text"
					placeholder="name@place.com" />
			</div>

			<button id="login__submit">Login</button>
			<button id="login__cancel">Cancel</button>
		</div>
	`
}
```

> scripts/auth/RegisterForm.js
```js
export const RegisterForm = () => {

	return `
		<div class="newPost">
		<h3>Register</h3>
			<div>
				<input value=""
					name="registerName"
					class="newPost__input"
					type="text"
					placeholder="User Name" />
			</div>
			<div>
				<input value=""
					name="registerEmail"
					class="newPost__input"
					type="text"
					placeholder="name@place.com" />
			</div>

			<button id="register__submit">Register</button>
			<button id="login__cancel">Cancel</button>
		</div>
	`
}
```

We can now finish the conditional in the `checkForUser` function and write a function to display the `LoginForm` and `RegisterForm`.

> main.js
```js
const checkForUser = () => {
  	if (sessionStorage.getItem("user")){
		  setLoggedInUser(JSON.parse(sessionStorage.getItem("user")));
    	startGiffyGram();
  	}else {
   		showLoginRegister();
  	}
}

const showLoginRegister = () => {
  	showNavBar();
  	const entryElement = document.querySelector(".entryForm");
  	//template strings can be used here too
  	entryElement.innerHTML = `${LoginForm()} <hr/> <hr/> ${RegisterForm()}`;
  	//make sure the post list is cleared out too
	const postElement = document.querySelector(".postList");
	postElement.innerHTML = "";
}
```

## Login EventListener
Before we write the eventListener, consider what needs to happen. 
1. User completes login form
1. Click submit button
1. Collect the user information into an object
1. Use `GET` to call the database looking for a user
1. If a matching user returns, `setLoggedInUser` in the DataManager AND
1. Set the user in the `sessionStorage`
1. Invoke `startGiffyGram`
1. If no user found in DB, let the user know they should register.

> main.js
```js
applicationElement.addEventListener("click", event => {
  event.preventDefault();
  if (event.target.id === "login__submit") {
    //collect all the details into an object
    const userObject = {
      name: document.querySelector("input[name='name']").value,
      email: document.querySelector("input[name='email']").value
    }
    loginUser(userObject)
    .then(dbUserObj => {
      if(dbUserObj){
        sessionStorage.setItem("user", JSON.stringify(dbUserObj));
        startGiffyGram();
      }else {
        //got a false value - no user
        const entryElement = document.querySelector(".entryForm");
        entryElement.innerHTML = `<p class="center">That user does not exist. Please try again or register for your free account.</p> ${LoginForm()} <hr/> <hr/> ${RegisterForm()}`;
      }
    })
  }
})
```

In the `DataManager` we need to create a function that requests the user information from the database. One feature of json-server is the ability to filter the data. Be sure to checkout the [json-server documentation](https://www.npmjs.com/package/json-server).

> scripts/data/DataManager.js
```js
export const loginUser = (userObj) => {
  return fetch(`http://localhost:8088/users?name=${userObj.name}&email=${userObj.email}`)
  .then(response => response.json())
  .then(parsedUser => {
    //is there a user?
    console.log("parsedUser", parsedUser) //data is returned as an array
    if (parsedUser.length > 0){
      setLoggedInUser(parsedUser[0]);
      return getLoggedInUser();
    }else {
      //no user
      return false;
    }
  })
}
```

## Register EventListener

Before we write the eventListener, consider what needs to happen. 
1. User completes register form
1. Click submit button
1. Collect the user information into an object
1. Use `POST` with the user object to add the user to the database.
1. Use the response to `setLoggedInUser` in the DataManager AND
1. Set the user in the `sessionStorage`
1. Invoke `startGiffyGram`

> main.js
```js
applicationElement.addEventListener("click", event => {
  event.preventDefault();
  if (event.target.id === "register__submit") {
    //collect all the details into an object
    const userObject = {
      name: document.querySelector("input[name='registerName']").value,
      email: document.querySelector("input[name='registerEmail']").value
    }
    registerUser(userObject)
    .then(dbUserObj => {
      sessionStorage.setItem("user", JSON.stringify(dbUserObj));
      startGiffyGram();
    })
  }
})

```

In the `DataManager` we need to create a function that `POST` a new user to the users table. This returns an object with the user's information including the `id`.

> scripts/data/DataManager.js

```js
export const registerUser = (userObj) => {
  return fetch(`http://localhost:8088/users`, {
    method: "POST",
      headers: {
          "Content-Type": "application/json"
      },
      body: JSON.stringify(userObj)
  })
  .then(response => response.json())
  .then(parsedUser => {
    setLoggedInUser(parsedUser);
    return getLoggedInUser();
  })
}
```
## Get Posts with User Information
Now that we have multiple users, we want to know the author of a post. Refactor the `getPosts` method and use the `json-server` feature to expand on the user.

> scripts/data/DataManager.js
```js
export const getPosts = () => {
  const userId = getLoggedInUser().id
  return fetch(`http://localhost:8088/posts?_expand=user`)
    .then(response => response.json())
    .then(parsedResponse => {
      console.log("data with user", parsedResponse)
      postCollection = parsedResponse
      return parsedResponse;
    })
}
```


## Log Out
Be sure to clear the `sessionStorage` and invoke `checkForUser` to re-render the app.

> main.js
```js
applicationElement.addEventListener("click", event => {
  if (event.target.id === "logout") {
    logoutUser();
    console.log(getLoggedInUser());
    sessionStorage.clear();
    checkForUser();
  }
})
```
## <h3 id="Author-Practice">Practice - author name</h3>
Now that you have user information tied to each post, add an element to the `Post` displaying the author's name.

##<h3 id="Edit-Practice"> Practice - author can edit</h3>
Using your mad javascript skills, only allow authors to edit their own posts. Refactor the `Post` to only display the edit and delete buttons if the post belongs to the logged in user. You will use a conditional statement.

##<h3 id="JSON-Practice"> Practice - json-server filter</h3>
As a code ninja, add a button to view only the logged in user's posts. Add a method to the DataManager to retrieve only the logged in user's posts. Refer to the [documentation for json-server](https://www.npmjs.com/package/json-server).

## <h3 id="DJ-Practice">Practice </h3>
Your friends have asked if they can use your journal app. Include login and register functionality. You may also need to refactor the database calls to include a userId and only show posts related to the logged in user. Edits can only be made to the posts related to the user.

### Bonus #1
Allow users that are not logged in to have limited functionality like viewing other member's posts The ability to save a GiffyGram requires a login.

### Bonus #2
Refactor the login and register components into one form. If a user is not found, automatically register the user and display the app.