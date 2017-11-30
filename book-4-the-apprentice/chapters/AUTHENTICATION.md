# Angular and Authentication

## Handling authentication in Angular/Firebase application

### Getting Firebase Credentials

Log into your firebase console and create a new project.  Once we have a new project we need to enable authentication on the project.  To do this click *Authentication*.  Then click *Sign-In Method*.  Then click on the method you want to enable.  In this case we will click on *Email/Password*.  Flip the toggle to Enable and hit save.

Everytime we create a firebase project we must include our apiKey information somewhere secure.  To do this we will create a AppConstants.js file in the app folder and add in the credentials firebase gives us.  The AppConstants file looks something like this:

```js
"use strict";

app.constant("FIREBASE_CONFIG", {
      apiKey: "YourApiKeyHere",
      authDomain: "YourAuthDomainHere",
      databaseURL: "YourDatabaseURLHere",
      storageBucket: "YourStorageBuckethere",
      messagingSenderId: "YourMessagingSenderIdHere"
  })
```

Then we will add `app/AppConstants.js` to our .gitignore so the keys don't get pushed to github.  In the app folder we will create a AppConstants.js.example file that looks like this:

```js
"use strict";

app.constant("FIREBASE_CONFIG", {
      apiKey: "",
      authDomain: "",
      databaseURL: "",
      storageBucket: "",
      messagingSenderId: ""
  })
```

We will **not** add this to our `.gitignore`.  This way if anyone pulls our code down all they need to do is rename the file to AppConstants.js and add in their firebase credentials and they will be good to run the project (its worth adding this information in your README.md where you list instructions for how to run the project.)

### Register a User

Create the following files and add the JS files as script tags to your index.html:

> **File:** app/controllers/AuthCtrl.js

```js
app.controller("AuthCtrl", function($scope, AuthFactory) {
  $scope.auth = {};

  $scope.registerUser = function(registerNewUser) {
    AuthFactory.registerWithEmail(registerNewUser).then(function(didRegister) {
      console.log(didRegister);
    })
  }
})
```

> **File:** app/factories/AuthFactory.js

```js
app.factory("AuthFactory", function($q, $http, $rootScope, FIREBASE_CONFIG) {
  let currentUserData = null

//Firebase: Determine if user is authenticated.
  let isAuthenticated = () => {
      return firebase.auth().currentUser ? true : false
  }

//Firebase: Return email, UID for user that is currently logged in.
  let getUser = () => {
    return firebase.auth().currentUser
  }

// Kills browser cookie with firebase credentials
  let logout = () => {
    firebase.auth().signOut()
  }

//Firebase: Use input credentials to authenticate user.
  let authenticate = (credentials) => {
    return firebase.auth().signInWithEmailAndPassword(credentials.email, credentials.password)
  }

//Firebase: Register a new user with email and password
  let registerWithEmail = (user) => {
    return firebase.auth().createUserWithEmailAndPassword(user.email, user.password)
  }

  return {isAuthenticated, getUser, logout, registerWithEmail, authenticate}
})
```

> **File:** partials/auth.html

```js
<div>
    <input type="email" placeholder="Email address" ng-model="auth.email"  autofocus>
    <input type="password" placeholder="Password" ng-model="auth.password">
    <button ng-click="registerUser(auth)">Register</button>
</div>
```

Then we will need to do a little cleanup on our app.js.  We will be breaking this file into two parts so we can inject the firebase credentials.  We also need to add a new route in $routeProvider for authenticaion.  Modify/create the following files:

> **File:** app/app.js

```js
var app = angular.module("SongApp", ['ngRoute']);
```

> **File:** app/AppConfig.js

```js
app.run(function($rootScope, $location, FIREBASE_CONFIG, AuthFactory) {
  firebase.initializeApp(FIREBASE_CONFIG)
})

app.config(['$routeProvider', function($routeProvider) {
  $routeProvider
    .when('/songs/list', {
      templateUrl: 'partials/song-list.html',
      controller: 'SongListCtrl'
    })
    .when('/songs/new', {
      templateUrl: 'partials/song-form.html',
      controller: 'SongFormCtrl'
    })
    .when('/auth', {
      templateUrl: 'partials/auth.html',
      controller: 'AuthCtrl'
    })
    .otherwise('/auth')
}])
```

Add in the script tag from the firstbase console.  Your script tags should be in the following order:

```html
  <script src="https://www.gstatic.com/firebasejs/3.6.0/firebase.js"></script>
  <script src="lib/node_modules/angular/angular.min.js"></script>
  <script src="app/app.js"></script>
  <script src="app/AppConstants.js"></script>
  <script src="app/AppConfig.js"></script>
  <script src="app/factories/SongFactory.js"></script>
  <script src="app/factories/AuthFactory.js"></script>
  <script src="app/controllers/AuthCtrl.js"></script>
  <script src="app/controllers/SongDetailCtrl.js"></script>
  <script src="app/controllers/SongListCtrl.js"></script>
  <script src="app/controllers/SongFormCtrl.js"></script>
```

Now try registering a new user.  You should get no errors in your console and if sucessful you should see a big firebase object in your chrome console and a new user in the authentication tab of your firebase console.

### Login a User

Now that we have registration working lets get the user logged in.  First we will need to add another button to our auth.html file:

```html
<button ng-click="loginUser(auth)">Login</button>
```

Next we will add the $scope.loginUser function to our AuthCtrl.  We will have this function call a helper function called logMeIn that will do the actual logging in.  The reason for this is for a nicer user experience we want our user to get automatically logged in after they register.  Since this will require the same login code it makes more sense to make a helper function for login instead of duplicating code.  So our AuthCtrl now looks like this:

```js
app.controller("AuthCtrl", ['$location', '$scope', 'AuthFactory', function($location, $scope, AuthFactory) {
  $scope.auth = {};

  let logMeIn = function(loginStuff){
  AuthFactory.authenticate(loginStuff).then(function(didLogin){
      $scope.login = {};
      $scope.register = {};
      $location.url("/songs/list");
    });
  };


  $scope.registerUser = function(registerNewUser) {
    AuthFactory.registerWithEmail(registerNewUser).then(function(didRegister) {
      logMeIn(registerNewUser);
    });
  };

  $scope.loginUser = function(loginNewUser){
    logMeIn(loginNewUser);
  };
}]);
```

Now try registering a user AND logging a user in.  If done sucessfully you should notice a firebase token appear in your chrome dev tools under Application, LocalStorage, localhost.

### User Logout

The final functionality we need for authentication is the ability to logout a user.  This is easily done with a built in firebase method.  To demonstrate this we will add a simple nav bar in the index.html.  Add the following code just above the div with ng-view on it.  This ensures that the nav bar is always available no matter what partial is being displayed.

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

We already have teh logout function in our AuthFactory so we should be able to logout. Give it a try - log in a user and check the Application, Local Storage tab to see that you have a firebase token.  Then click the logout button and you should see that token dissapear and your browser go back to /auth.

### Final Cleanup

We now have the ability to register, login, and logout a user but there is still a tiny bit more we can do.  Mainly we want to make sure that users can only see different pages if they are logged in and can only see the auth page when they are not logged in.

First lets tackle how to hide the page content if the user is not logged in.  To do this we will start with a simple helper function that checks if a user is logged in.  We will put this code at the top of our AppConfig

```js
let isAuth = (AuthFactory) => new Promise ((resolve, reject) => {
  if(AuthFactory.isAuthenticated()){
    // console.log("User is authenticated, resolve route promise");
    resolve();
  } else {
    // console.log("User is not authenticated, reject route promise");
    reject();
  }
});
```

Next we will run this function on all of our routes.  This makes our app.config look like this:

```js
app.config(['$routeProvider', function($routeProvider) {
  $routeProvider
    .when('/songs/list', {
      templateUrl: 'partials/song-list.html',
      controller: 'SongListCtrl',
      resolve: {isAuth}
    })
    .when('/songs/new', {
      templateUrl: 'partials/song-form.html',
      controller: 'SongFormCtrl',
      resolve: {isAuth}
    })
    .when('/auth', {
      templateUrl: 'partials/auth.html',
      controller: 'AuthCtrl'
    })
    .otherwise('/auth')
}])
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
