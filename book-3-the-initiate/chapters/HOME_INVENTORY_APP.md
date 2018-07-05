# Home Inventory Single Page Application

This is an individual project that you will be working on for several days. Back in Book 1, you used `localStorage` to put data into persistant storage. Now you get to use the power of persistance. That data is still sitting in your browser, and you will write a new application to use that data.

Recall that you categorized your data by grouping it into several different arrays in the database.

In this example, both `crafts`, and `furniture` are different collections of items in your home. Each contains similar items.

```js
HomeInventoryDatabase.crafts.push(vintageInkwell)
HomeInventoryDatabase.furniture.push(writingDesk)
```

You need to build a modular application, using Browserify that displays a navigation bar at the top, with a hyperlink for each of the categories in your database. When you click on one of those hyperlinks, all of the items in your home inventory database that are in the corresponding category should be displayed as cards beneath the navigation bar.

Make sure you build your application as modular as you can. Don't worry about complexity, don't worry about doing it perfectly, just do your best to break the application up into modules.

Also, you must use a CSS framework for this project to practice using it. You can pick from...

1. Bootstrap
1. Materialize
1. Bulma

Here's some helpful hints to get started on what modules you should create.

1. Manipulating local storage
1. Building the nav bar
1. Building a card
1. Building a list of cards
