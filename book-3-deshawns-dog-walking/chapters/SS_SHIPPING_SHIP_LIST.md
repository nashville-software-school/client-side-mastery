# List of Shipping Ships

Now build out the module to create the HTML for a list of available shipping ships.

![](./chapters/../images/shipping-ships.png)

Here is some starter code for adding an array of hauling ship objects to your database. Only the primary is provided. Refer back to your ERD and add objects to the array that contain all of the needed properties. Create several ship objects that can be hauled around the world.

```js
const database = {
    docks: [...],
    haulers: [...],
    shippingShips: []
}
```

Remember to put an accessor, or getter, function in the database module so that the other modules can get a copy of this array of objects.

```js
export const getShippingShips = () => {
    // You write the code for copying the array and returning it
}
```

## Build an HTML List of Shipping Ships

Now open your module that is responsible for building the HTML for each shipping ship and implement the code.
