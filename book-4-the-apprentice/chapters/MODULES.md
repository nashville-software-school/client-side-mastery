# Using Modules in React

Not everything in your React application has to be a component. You can create modules just like you did in Browserify that provide utilities for your application. You have already created modules for your API. Sometimes you need special functionality in several places and these could be helper functions.

## Setup
```sh
src/modules/helpers.js
```

Just a couple to get you started.

```js
export function firstLetterCase(str) {
   return (str.charAt(0).toUpperCase() + str.slice(1));
}

export function splitTypeArray(arr){
    return arr.join(" and ");
}
```

To use these functions, import into each component as needed.

```js
import {firstLetterCase} from '../../modules/helpers'
```

And then invoke the function

```jsx
{firstLetterCase(this.state.name)}
```



## Advanced Challenge: The Abstract Artist

> As always, advanced challenges are completely optional. You've reached the point in your React application where you should only attempt this challenge if you have understood everything covered so far. Otherwise, skip it.

We've been telling you since nearly the first day of class that duplicating code is a _bad thing_. In the previous exercise, you have four components that have nearly identical code in them. Your advanced challenge is to use the power of prototypal inheritance to create a module that all of your existing modules will have in their prototype chain.

Some starter code and comments to get you started.

> AnimalManager.js

```js
/*
    Remember that the first argument for Object.create() is the
    object that will be in this object's prototype chain.
*/
export default Object.create(APIManager, {
    ...
})
```

Now, consider moving all of those functions that are _nearly_ identical to the **`APIManager`** module. How could you write the functions to be useful for each of the more specialized managers?

> APIManager.js

```js
const remoteURL = "http://localhost:5002"

export default Object.create(null, {
    get: {
        value: function (id) {
            /*
                Since the purpose of this module is to be used by
                all of the more specialized one, then the string
                of `animals` should not be hard coded here.
            */
            return fetch(`${remoteURL}/animals/${id}`).then(e => e.json())
        }
    },
    all: {
        value: function () {
            return fetch(`${remoteURL}/animals`).then(e => e.json())
        }
    }
})
```
