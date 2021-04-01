# Using Modules in React

Not everything in your React application has to be a component. You can create modules that provide utilities for your application. You have already created modules for your API. Sometimes you need special functionality in several places and these could be helper functions.

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
{firstLetterCase(animal.name)}
```




