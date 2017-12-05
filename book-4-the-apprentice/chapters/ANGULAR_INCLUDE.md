# Angular Incudes

## ng-include

The `ng-include` directive allows you to include HTML partials into other ones. Let's look at the `index.html` of our sophisticated employee application. I want to have a navigation bar, and a footer. Rather than putting that markup directly into `index.html`, I'll make partials for each one and include them.

```html
<nav ng-include="'app/navigation/partials/navigation.html'"></nav>

<div ng-view></div>

<nav ng-include="'app/navigation/partials/footer.html'"></nav>
```

Then I create the navigation bar partial and put the following code in there. First, I declare two hyperlinks to switch between Angular views. Then show a **Logout** hyperlink, wrapped in an `ng-if` directive, that only appears if the user is currently authenticated.

> **File:** app/navigation/partials/navigation.html

```html
<ul ng-controller="NavCtrl">
    <li><a href="/#!/employees/list">List Employees</a></li>
    <li><a href="/#!/employees/new">Add Employee</a></li>

    <li class="align-right">
        <span ng-if="isAuthenticated()">
            <a href="#" ng-click="logout()">Logout</a>
        </span>
    </li>

</ul>
```

You can see that I've bound this partial to its own controller using `ng-controller`. This directive has to be used here because the navigation bar will appear no matter which view is being displayed, so we can't use the `$routeProvider` configuration to bind the partial to a controller.

I also use the `ng-click` directive to invoke a `logout()` function when the link is clicked. Both the `logout()` function, and the `isAuthenticated()` function must be defined on `$scope` so that the magic of two-way binding works.

> **File:** app/navigation/controllers/NavCtrl.js

```js
angular.module("EmployeeApp").controller("NavCtrl",
    function ($scope, AuthFactory) {
        /*
        Just a pass-through method to the AuthFactory method of the
        same name.
        */
        $scope.isAuthenticated = () => AuthFactory.isAuthenticated();

        /*
        Unauthenticate the client.
        */
        $scope.logout = () => AuthFactory.logout();

    }
)
```

![Angular Architecture](../assets/angular-arch-with-includes.png)

## controllerAs

[Intro to controller as](http://toddmotto.com/digging-into-angulars-controller-as-syntax/)

## AngularUI Router

[Angular UI router](https://github.com/angular-ui/ui-router) is a more advanced routing library that isn't solely dependent upon the URL, and supports nested views.
