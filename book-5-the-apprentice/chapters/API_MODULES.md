# Using Modules in React

Not everything in your React application has to be a component. You can create modules just like you did in Browserify that provide utilities for your application to use.

## Setup

1. Create a `src/modules` directory
1. In that directory, create a file named `AnimalManager.js`

## Single Responsibility Principle

Rather than hard-coding API calls in your React component of **`ApplicationViews`**, you are going to create a JavaScript module that contains **all** of the API calls. What this provide for you is flexibility.

Other components, _in the future_, may likely need to ability to make their own API calls. You're going to eliminate that possible future duplication of code by making a module whose sole responsibility is to interact with the API.

> AnimalManager.js

```js
const remoteURL = "http://localhost:5002"

export default {
  get(id) {
    return fetch(`${remoteURL}/animals/${id}`).then(e => e.json())
  },
  getAll() {
    return fetch(`${remoteURL}/animals`).then(e => e.json())
  }
}
```

Now you can refactor your **`ApplicationViews`** component to use this module. First, make sure you import it.

```js
import AnimalManager from "../modules/AnimalManager"
```

Then refactor `componentDidMount()`.

```js
// Example code. Make this fit into how you have written yours.
AnimalManager.getAll().then(allAnimals => {
    this.setState({
        animals: allAnimals
    })
})
```

## Practice: All Resource Managers

Create a manager file in the `modules` directory for each of your resources.

1. Animals
1. Locations
1. Employees
1. Owners

Add the `get()` and `all()` methods to each one, changing the URL path in each one to get the corresponding resource type. Then refactor the **`ApplicationViews`** component to import all of them and use all of them when querying your data.

## Challenge: Refactor Delete

See if you can add a method to your **`AnimalManager`** module to make the following refactored `deleteAnimal()` method work in **`ApplicationViews`**.

```js
deleteAnimal = (id) => {
  return AnimalManager.removeAndList(id)
  .then(animals => this.setState({
      animals: animals
    })
  )
}
```

## Advanced Challenge: The Abstract Artist

> As always, advanced challenges are completely optional. You've reached the point in your React application where you should only attempt this challenge if you have understood everything covered so far. Otherwise, skip it.

We've been telling you since nearly the first day of class that duplicating code is a _bad thing_. In the previous exercise, you have four components that have nearly identical code in them. Your advanced challenge is to use the power of prototypal inheritance to create a module that all of your existing modules will have in their prototype chain.

Some starter code and comments to get you started.

> AnimalManager.js

```js
import APIManager from "./APIManager"
/*
    Remember that extending a Class means that
    it will be in this class's prototype chain.
*/
class AnimalManager extends APIManager {
    ...
}
```

Now, consider moving all of those functions that are _nearly_ identical to the **`APIManager`** module. How could you write the functions to be useful for each of the more specialized managers?

> APIManager.js

```js
const remoteURL = "http://localhost:5002"

class APIManager {

  get(id) {
    /*
        Since the purpose of this module is to be used by
        all of the more specialized one, then the string
        of `animals` should not be hard coded here.
    */
    return fetch(`${remoteURL}/animals/${id}`).then(data => data.json())
  }

  all() {
    return fetch(`${remoteURL}/animals`).then(data => data.json())
  }

}

export default new APIManager()
```
