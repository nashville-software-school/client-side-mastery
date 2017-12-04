# Angular and Authentication

## Handling authentication in Angular/Firebase application

### Getting Firebase Credentials

To interface with the Firebase credentialing system, we need to have the Firebase npm package installed. Switch to your `lib` directory and run the following command.

```sh
npm install firebase --save
```

Access your Firebase console and click *Authentication*.  Then click *Sign-In Method*.  Then click on the method you want to enable.  In this case we will click on *Email/Password*.  Flip the toggle to Enable and hit save.

Everytime we create a Firebase project we must include our `apiKey` information somewhere secure.  To do this we will create a `app.config.js` file in the app folder and add in the credentials firebase gives us.  The file should contain the following code, but containing your configuration details.

```js
app.constant("FIREBASE_CONFIG", {
    apiKey: "YourApiKeyHere",
    authDomain: "YourAuthDomainHere",
    databaseURL: "YourDatabaseURLHere",
    storageBucket: "YourStorageBuckethere",
    messagingSenderId: "YourMessagingSenderIdHere"
  })
```

Then we will add `app/app.config.js` to our `.gitignore` so the keys don't get pushed to github.  In the app folder we will create a `app.config.js.example` file that looks like this:

```js
app.constant("FIREBASE_CONFIG", {
    apiKey: "",
    authDomain: "",
    databaseURL: "",
    storageBucket: "",
    messagingSenderId: ""
})
```

We will **not** add this to our `.gitignore`.  This way if anyone pulls our code down all they need to do is rename the file to `app.config.js` and add in their firebase credentials and they will be good to run the project (its worth adding this information in your README.md where you list instructions for how to run the project.)

### Register a User

Create the following files and add the JS files as script tags to your index.html:

> **File:** app/auth/controllers/AuthCtrl.js

```js
app.controller("AuthCtrl", function($scope, AuthFactory) {
  $scope.auth = {}

  $scope.registerUser = function(registerNewUser) {
    AuthFactory.registerWithEmail(registerNewUser).then(function(didRegister) {
      console.log(didRegister)
    })
  }
})
```

> **File:** app/auth/factories/AuthFactory.js

```js
angular.module("EmployeeApp")
.factory("AuthFactory", function($http) {
    let currentUserData = null

    return Object.create(null, {
        isAuthenticated: {
            value: () => {
                return firebase.auth().currentUser ? true : false
            }
        },
        getUser: {
            value: () => {
                return firebase.auth().currentUser
            }
        },
        logout: {
            value: () => {
                firebase.auth().signOut()
            }
        },
        authenticate: {
            value: credentials => {
                return firebase.auth().signInWithEmailAndPassword(credentials.email, credentials.password)
            }
        },
        registerWithEmail: {
            value: user => {
                return firebase.auth().createUserWithEmailAndPassword(user.email, user.password)
            }
        }
    })
})
```

> **File:** app/auth/partials/auth.html

```js
<div>
    <input type="email" placeholder="Email address" ng-model="auth.email"  autofocus>
    <input type="password" placeholder="Password" ng-model="auth.password">
    <button ng-click="registerUser(auth)">Register</button>
</div>
```

Then we will need to do a little cleanup on our `app.js`.  We will be breaking this file into two parts so we can inject the firebase credentials.  We also need to add a new route in $routeProvider for authentication.  Modify/create the following files.

> **File:** app/app.config.js

```js
angular.module("EmployeeApp").constant("FIREBASE_CONFIG", {
    apiKey: "your info",
    authDomain: "your info",
    databaseURL: "your info",
    projectId: "your info",
    storageBucket: "your info",
    messagingSenderId: "your info"
})

angular.module("EmployeeApp").run(function (FIREBASE_CONFIG) {
    firebase.initializeApp(FIREBASE_CONFIG)
})

angular.module("EmployeeApp").config(function ($routeProvider) {
    /**
     * Configure all Angular application routes here
     */
    $routeProvider.
        when("/employees/list", {
            templateUrl: "app/employees/partials/list.html",
            controller: "EmployeeListCtrl"
        })
        .when('/employees/new', {
            templateUrl: 'app/employees/partials/create.html',
            controller: 'EmployeeCreateCtrl'
        })
        .when('/employees/detail/:employeeId', {
            templateUrl: 'app/employees/partials/detail.html',
            controller: 'EmployeeDetailCtrl'
        })
        .when('/auth', {
            templateUrl: 'app/auth/partials/register.html',
            controller: 'AuthCtrl'
        })
        .otherwise('/auth')

})
```

Add in the script tag from the firstbase console.  Your script tags should be in the following order:

```html
<script src="./lib/node_modules/angular/angular.min.js"></script>
<script src="./lib/node_modules/firebase/firebase.js"></script>
<script src="./lib/node_modules/angular-route/angular-route.min.js"></script>
<script src="./app/app.js"></script>
<script src="./app/app.config.js"></script>

<script src="./app/auth/factories/AuthFactory.js"></script>
<script src="./app/auth/controllers/AuthCtrl.js"></script>

<script src="./app/employees/factories/EmployeeFactory.js"></script>
<script src="./app/employees/controllers/EmployeeListCtrl.js"></script>
<script src="./app/employees/controllers/EmployeeCreateCtrl.js"></script>
<script src="./app/employees/controllers/EmployeeDetailCtrl.js"></script>
```

Now try registering a new user.  You should get no errors in your console and if sucessful you should see a big firebase object in your chrome console and a new user in the authentication tab of your firebase console.

### Login a User

Now that we have registration working lets get the user logged in.  First we will need to add another button to our auth.html file:

```html
<button ng-click="loginUser(auth)">Login</button>
```

Next we will add the $scope.loginUser function to our AuthCtrl.  We will have this function call a helper function called logMeIn that will do the actual logging in.  The reason for this is for a nicer user experience we want our user to get automatically logged in after they register.  Since this will require the same login code it makes more sense to make a helper function for login instead of duplicating code.  So our AuthCtrl now looks like this:

```js
angular.module("EmployeeApp")
.controller("AuthCtrl", function($scope, $location, AuthFactory) {
    $scope.auth = {}

    $scope.logMeIn = function (credentials) {
        AuthFactory.authenticate(credentials).then(function (didLogin) {
            $scope.login = {}
            $scope.register = {}
            $location.url("/employees/list")
        })
    }

    $scope.registerUser = function(registerNewUser) {
      AuthFactory.registerWithEmail(registerNewUser).then(function (didRegister) {
        logMeIn(registerNewUser)
      })
    }

})
```

Now try registering a user AND logging a user in.  If done sucessfully you should notice a Firebase token appear in your local storage.

### User Logout

The final functionality we need for authentication is the ability to logout a user.  This is easily done with a built in firebase method. To demonstrate this we will add a simple nav bar in the `index.html`. Add the following code just above the div with `ng-view` directive attribute.  This ensures that the nav bar is always available no matter what partial is being displayed.

```html
<nav ng-controller="AuthCtrl">
    <button ng-click="logoutUser()">Logout</button>
</nav>
```

The logout button will call a logoutUser function in our AuthCtrl.  This function should look like this:

```js
$scope.logoutUser = function(){
    AuthFactory.logout()
    $location.url('/auth')
}
```

We already have the logout function in our `AuthFactory` so we should be able to logout. Time to try it. Authenticate, then click the logout button and you should see that the local storage token has been deleted and your browser will go back to the `/auth` route.

### Final Cleanup

We now have the ability to register, login, and logout a user but there is still a tiny bit more we can do.  Mainly we want to make sure that users can only see different pages if they are logged in and can only see the auth page when they are not logged in.

First lets tackle how to hide the page content if the user is not logged in.  To do this we will start with a simple helper function that checks if a user is logged in.  We will put this code at the top of our `app.config.js` file.

```js
let isAuth = AuthFactory => new Promise ((resolve, reject) => {
    if (AuthFactory.isAuthenticated()){
        console.log("User is authenticated, resolve route promise")
        resolve()
    } else {
        console.log("User is not authenticated, reject route promise")
        reject()
    }
})
```

Next we will run this function on all of our routes.  This makes our route configuration look like this.

```js
angular.module("EmployeeApp").config(function ($routeProvider) {
    /**
     * Configure all Angular application routes here
     */
    $routeProvider.
        when("/employees/list", {
            templateUrl: "app/employees/partials/list.html",
            controller: "EmployeeListCtrl",
            resolve: { isAuth }
        })
        .when('/employees/new', {
            templateUrl: 'app/employees/partials/create.html',
            controller: 'EmployeeCreateCtrl',
            resolve: { isAuth }
        })
        .when('/employees/detail/:employeeId', {
            templateUrl: 'app/employees/partials/detail.html',
            controller: 'EmployeeDetailCtrl',
            resolve: { isAuth }
        })
        .when('/auth', {
            templateUrl: 'app/auth/partials/register.html',
            controller: 'AuthCtrl'
        })
        .otherwise('/auth')
})
```

So now if you are logged out and you go to /songs/list you should see an blank page.  While this works what we really want is for our app to not only hide the content but automatically redirect an unauthenticated user to the auth page so they can log in.  To do this we add a bit of code to our app.run.

```js
app.run(function($rootScope, $location, FIREBASE_CONFIG, AuthFactory) {
  firebase.initializeApp(FIREBASE_CONFIG)

  //watch method that fires on change of a route.  3 inputs.
  //event is a change event
  //currRoute is information about your current route
  //prevRoute is information about the route you came from
  $rootScope.$on('$routeChangeStart', function(event, currRoute, prevRoute) {
    // checks to see if there is a current user
    let logged = AuthFactory.isAuthenticated()

    let appTo

    // to keep error from being thrown on page refresh
    if (currRoute.originalPath) {
      // check if the user is going to the auth page = currRoute.originalPath
      // if user is on auth page then appTo is true
      // if it finds something other than /auth it return a -1 and -1!==-1 so resolves to false
      appTo = currRoute.originalPath.indexOf('/auth') !== -1
    }

    //if not on /auth page AND not logged in redirect to /auth
    if (!appTo && !logged) {
      event.preventDefault()
      $location.path('/auth')
    }
  });
});
```
