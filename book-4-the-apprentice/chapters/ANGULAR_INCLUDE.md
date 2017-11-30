# Angular Incudes

## ng-include

The `ng-include` directive allows you to include HTML partials into other ones. Most of your did the same thing in your Require/Handlebars applications.

> **File:** partials/pinterest/card.html

```html
<section class="card--small">
  <div class="card__header" ng-include="'partials/card-header.html'"></div>
  <div class="card__body--highlight" ng-include="'partials/card-content.html'"></div>
</section>
```

> **File:** partials/pinterest/card-header.html

```html
<h3 class="card__title">{{ card.title }}</h3>
<div class="card__sub-title">{{ card.sub-title }}</div>
```

> **File:** partials/pinterest/card-content.html

```html
<div class="card__body__container">
  <div class="card__body">{{ card.content }}</div>
</div>
```

![Angular Architecture](../assets/angular-arch-with-includes.png)

## controllerAs

[Intro to controller as](http://toddmotto.com/digging-into-angulars-controller-as-syntax/)

## AngularUI Router

[Angular UI router](https://github.com/angular-ui/ui-router) is a more advanced routing library that isn't solely dependent upon the URL, and supports nested views.
