# Angular Basics

## Installation

Create a new directory named `angular-basics`. Instead of making a `scripts` sub-directory, make an `app` sub-directory which will hold all of your JavaScript files. Also make a `lib` sub-directory to hold all third-party dependencies, and the task runner configuration.

Time to install Angular.

```bash
cd lib
npm install angular --save
```

Check your `package.json` to make sure you are using a version of angular that is 1.6.x or greater.  Your `package.json` dependencies should look like the following (instead of an x you will have some number between 0 and 9):

```bash
dependencies: {
    angular: '^1.6.x'
}
```

Then include the Angular library in your HTML file.

```html
<script src="lib/node_modules/angular/angular.min.js"></script>
```

Next, create the file `app/Todo.js` and set up your Angular application with the following code.

```js
var app = angular.module("TodoApp", []);
```

The next thing you want to do is create a controller, which is an Angular function where you write related logic for a feature. To start off with, we'll create a controller for displaying, creating, and deleting Todo items.

```js
app.controller("TodoCtrl", function ($scope) {

});
```

## Scope

We've talked about how, in JavaScript, scope drives what variables are accessible at certain points in your code: global scope, function scope, etc. Well, in Angular, the `$scope` object is kind of magical. It will not only contain all of the variables and functions that you want to use inside a controller, but it also automatically bound to variable interpolations in your HTML.  It works just like Handlebars did where a variable in JavaScript could be written with two curly braces in HTML (e.g. `{{ myVariable }}`).

So let's start with a basic example of one-way data binding in Angular.

```js
app.controller("TodoCtrl", function($scope) {
  $scope.title = "Welcome to your task list";
});
```

In your HTML, there's a couple things that need to be in place to start working with that variable.

1. We need to bind the Angular application to our DOM. The simplest way to do this is on the `<body>` element.
1. We need to bind a controller to a corresponding DOM element. We'll just bind it to a `<section>` element.

```html
<body ng-app="TodoApp">
  <section ng-controller="TodoCtrl">

  </section>
</body>
```

Now we can start injecting variable interpolations, just like Handlebars.

```html
<body ng-app="TodoApp">
  <section ng-controller="TodoCtrl">
    <h1>{{ title }}</h1>
  </section>
</body>
```

## Two-way binding

Now let's look at what a magical unicorn looks like. Two-way data binding. Put an input field in your HTML, and use the `ng-model` attribute on it with a value of `macaroni` (just a random variable name for this exercise). Right beneath it, we'll put a standard interpolation of macaroni.

```html
<div>
  <input type="text" ng-model="macaroni" />
  <div> {{ macaroni }} </div>
</div>
```

Then add a macaroni variable to your controller's scope.

```js
app.controller("TodoCtrl", function($scope) {
  $scope.title = "Welcome to your task list";
  $scope.macaroni = "";
});
```

Now refresh your browser, start typing in the input field and bathe in the awesomeness of the magical unicorn of two-way data binding.

## Looping over collections

With Angular, the JavaScript code is no longer in charge of how data is displayed, but rather the HTML. The controller simply manages the state of your application's data. Let's put some data in the controller.

```js
app.controller("TodoCtrl", function($scope) {
  $scope.title = "Welcome to your task list";
  $scope.macaroni = "";

  $scope.todos = [
    { name: "Mow the lawn", complete: "incomplete" },
    { name: "Cut the grass", complete: "complete" },
    { name: "Kill the ants", complete: "incomplete" },
    { name: "Trim the weeds", complete: "complete" }
  ];
});
```

To display these in our HTML, we use the `ng-repeat` directive.

```html
<div>
  <ul ng-repeat="todo in todos">
    <li>{{ todo.name }}</li>
  </ul>
</div>
```

## Handling click events

So let's put in an affordance to delete each Todo. A button after each one, and the button will use the `ng-click` helper to bind to a function in our controller.

```html
<div>
  <ul ng-repeat="todo in todos">
    <li>{{ todo.name }} <button ng-click="killTodo(todo)">Finish</button></li>
  </ul>
</div>
```

Add the `killTodo` function to the controller.

```js
$scope.killTodo = function(todo) {
  // Do you see the PFM here of full object comparison?
  var todoIndex = $scope.todos.indexOf(todo);

  if (todoIndex >= 0) {
    $scope.todos.splice(todoIndex, 1);
  }
};
```

Try it out.

## Conditions with ng-if

It doesn't make sense to display tasks that are already done. Let's put a condition on the `<li>` element that ensures it only gets built if the current task is incomplete.

```html
<div>
  <ul ng-repeat="todo in todos">
    <li ng-inf="todo.complete === 'incomplete'">
        {{ todo.name }}
        <button ng-click="killTodo(todo)">Finish</button>
    </li>
  </ul>
</div>
```

## Filtering

Let's filter our list of Todos. Add an input field where we can enter in some text.

```html
<input type="text" ng-model="searchText" />
```

Now we add the `filter` condition to our `ng-repeat` helper. Since we used `ng-model` above to create a two-way binding on the `searchText` variable, Angular will automatically match your search string against **any** key in the Todo

```html
<div>
  <ul ng-repeat="todo in todos | filter: searchText">
    <li>{{todo.name}}</li>
  </ul>
</div>
```

Refresh your page and start typing in something in the search field and watch the list of todos get immediately filtered.

## Grouping

Check out this bad boy. Angular can automatically group option elements in the select element based on a key name on the object.

```html
<div>
  Grouped tasks:
  <select
      ng-model="theTodo"
      ng-options="value.name group by value.complete for value in todos">
  </select>
</div>
```

## Using $http instead of $.ajax()

Angular, of course, provides their own XHR method, so instead of using `$.ajax()` like we've been doing, we must **use all the Angular** and use the built-in `$http` object.

Let's look at an example call to Firebase.

```js
$http
    .get("https://socks.firebaseio.com/songs/.json")
    .then(
        function(firebaseObjectOfObjects) {
            for (let songId in firebaseObjectOfObjects) {
                console.log(firebaseObjectOfObjects[songId])
            }
        }
    )
```

## Resources

* [Angular for beginners](http://medialoot.com/blog/angularjs-for-absolute-beginners/)
* [Angular tutorial](https://www.airpair.com/angularjs/posts/angularjs-tutorial)
* [Angular in one day](http://toddmotto.com/ultimate-guide-to-learning-angular-js-in-one-day/)
* [A Better Way to Learn Angular](https://thinkster.io/a-better-way-to-learn-angularjs/)
* [Angular on Code Academy](https://www.codecademy.com/courses/javascript-advanced-en-2hJ3J/0/1)
* [Angular in 30 Minutes](http://www.revillweb.com/tutorials/angularjs-in-30-minutes-angularjs-tutorial/)

## Practice

You will be writing a simplistic employee management SPA using Angular. You will need to use the `ng-app`, `ng-controller`, `ng-repeat` with the `orderBy` filter, `ng-if`, and `ng-click` directives to complete this.

### Setup

1. Create a new directory named `angular-employees`.
1. Create `app`, and `lib` sub-directories.
1. Initialize `lib` with a package.json and install angular from npm.
1. Create an `index.html` file in the main directory.
1. Create an `EmployeeCtrl.js` file in the `app` directory.
1. In that file, create the initial module, and name it `EmployeeMgmt`.
1. Then create an Angular controller, and name it `EmployeeCtrl`.
1. Bind the module to the body of your HTML with the `ng-app` directive.
1. Create a `<section>` tag in your HTML and bind it to the controller with the `ng-controller` directive.
1. Paste the code below into your Angular controller.

### Requirements

1. Display all employees' full names in an unordered list.
1. Ensure that employees are ordered by start date, ascending.
1. Put a button next to each employee labeled `Fire Employee`.
1. When that button is clicked, change the value of the `employmentEnd` property of that employee to `Date.now()`.
1. Ensure that only current employees are displayed in the DOM.

```js
$scope.employees = [
    {
        "firstName": "Erin",
        "lastName": "Orstrom",
        "employmentStart": 1512140013765,
        "employmentEnd": null
    },
    {
        "firstName": "Wayne",
        "lastName": "Hutchinson",
        "employmentStart": 1512139999102,
        "employmentEnd": null
    },
    {
        "firstName": "Sarah",
        "lastName": "Story",
        "employmentStart": 1512139999729,
        "employmentEnd": null
    },
    {
        "firstName": "Sulaiman",
        "lastName": "Allan",
        "employmentStart": 1512140294571,
        "employmentEnd": null
    },
    {
        "firstName": "Ben",
        "lastName": "Marks",
        "employmentStart": 1512200192934,
        "employmentEnd": null
    }
]
```

### Adding Employees

Now, put a form in the section that contains two text inputs - one for first name, and one for last name - with a button. When the form submits, it should add a new employee object to the `$scope.employees` array.

This should get you started.

```html
<h2>New employee</h2>
<form ng-submit="">
    First name: <input type="text" ng-model="">
    Last name: <input type="text" ng-model="">
    <button>Hire employee</button>
</form>
```

### Nevertheless, they Persisted

You're now able to add to the array of employees, but everytime you refresh the page, those in-memory objects are wiped out and you start with the original objects again. Not ideal.

The next step is for you to create a new Firebase application to store the employees.

Once you create the Firebase application, use `$http` to **GET** the employees and then add the employees that get returned to the `$scope.employees` array. Then update the function you wrote to add an employee array, to do a **POST** to your Firebase table.

```js
$http
