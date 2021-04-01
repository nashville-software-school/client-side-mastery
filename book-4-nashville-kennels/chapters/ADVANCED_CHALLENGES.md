# Kick up Your Kennel App with Advanced Challenges.

## Challenge: The Abstract Artist

> This challenge is completely optional. You should only attempt this challenge if you have understood everything covered so far. Otherwise, skip it.

We've been telling you since nearly the first day of class that duplicating code is a _bad thing_. Currenly you have multiple API managers that have nearly identical code. Your advanced challenge is move all of the functions that are _nearly_ identical to an **`APIManager`** module. How could you write the functions to be useful for each of the more specialized managers?

Some starter code and comments to get you started.

> APIManager.js

```js
const remoteURL = "http://localhost:5002"

export default {
    /*
          Since the purpose of this module is to be used by
          all of the more specialized ones, then the string
          of `animals` should not be hard coded here.
    */

    get(id) {
        return fetch(`${remoteURL}/animals/${id}`).then(e => e.json())
    },
    getAll() {
        return fetch(`${remoteURL}/animals`).then(e => e.json())
    }
}

```

## Challenge: Add employee selection dropdown to the AnimalForm.

**Be sure to complete the chapter on forms before tackling this challenge.**
Each animal in the kennel should have an employee responsible for its care. Add a dropdown selection to the **`<AnimalForm>`** and update the database with an employeeId for each pet.

1. Modify your API to include an employeeId for each pet.
1. Within the **`<AnimalForm />`** component get the employees data.
1. Create a dropdown to allow selecting an employee responsible for the pet.
1. Save the employeeId with the new pet.

## Challenge: Add location selection dropdown to the EmployeeForm

Each employee should work at a specific location. Add a dropdown selection to the **`<EmployeeForm>`** and update the database with a locationId for each employee.

1. Modify your API to include an location for each employee.
1. Within the **`<EmployeeForm />`** component get the locations data.
1. Create a dropdown to allow selecting a location for the employee.
1. Save the locationId with the new employee.


## Challenge: Search your Data

> Remember that challenges, especially advanced ones, are completely optional and should not be attempted until you have completed the practice exercises and understand the concepts used in them.

Not for the weak of heart, is this challenge. Put an input box in your navigation bar. When your customer types in any characters, then you must find any objects in the animals, locations, or employees collections that have a name which contains that string.

When the customer presses the ENTER key, all three collections in your API need to be queried to find any item that matches, and then a new component should be shown whose job it is to show the items that were found, if any.

![search results](./images/qNAJIxX9NX.gif)

### Hints

1. Create a **`SearchResults`** component.
1. Add a `path="/search"` route in your app that renders **`SearchResults`**.
1. Use the [`_like` operator](https://github.com/typicode/json-server#operators) available with json-server.
1. You'll need to use chained `fetch` calls to each of the collections in your API and build up an object of found items.
1. After all calls are successful, you'll need to use the `props.history.push()` method to show a **`SearchResults`** component.


## Challenge: Animal Owners

**Complete the chapter related to initial state and props before this challenge.**

1. Create a join table and assign each animal to an owner.

Your task is to update the **`<AnimalCard />`** component to also display the name of the animal's owner(s). Keep in mind that the animal may have more than one owner.

You will need to load the owner's data within the **`<AnimalList />`** and then pass the owner's details to the **`<AnimalCard />`** component.

*[You could make multiple API calls or use json-server "Relationships"](https://github.com/typicode/json-server)*


## Challenge: Reusable Form

**Be sure to complete the chapter on Edit before tackling this challenge.**
Refactor your application to use one form for the AnimalForm and the AnimalEditForm. Do the same for employees, locations, and owners.
