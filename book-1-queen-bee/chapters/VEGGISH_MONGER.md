# Fishmonger

## Importing Functions

Since the fish monger needs to see what the fresh catch of the day is, it will need to import the function that is defined in the fishing boat module. You use the `require()` function to grab what another module exported.

##### Example

```js
const { functionVariable } = require("./fishingBoat.js")
```

## Monger Inventory

This module must import and invoke the function that is exported by the fishing boat module. This module should also define and export its own function that generates its own inventory that restaurants can use to purchase fish for their daily menus. The returned inventory should be an array of objects.

The exported function must be named `mongerInventory`.

1. Each day, the fishmonger buys exactly 10 of each inexpensive _(see below)_ fish caught by the fishing boat. If any of the fishing boat's fish quantity is less than 10, the fish monger does not buy it.
1. The fishmonger does not buy any fish from the boat that is priced higher than $7.50 per fish.
1. The fishmonger lets the chef of a restuarant specify what their maximum budget is per fish. For example, a chef can tell the monger that she can only spend $5.00 per fish. The function should then return only fish that cost $5.00 or less.
1. Each fish object provided by the fish monger should have a quantity of 10 instead of the original quantity from the fishing boat.

## Algorithm

Open your `fishMonger.js` module and write some comments describing the operations, data structures, function, and parameters needed to fulfill the above requirements.

Now implement the algorithm as best you can.