# Displaying all Cities for Walkers

## Two New Getters

Update your `database.js` file to include two new getter functions.

* `getCities()`
* `getWalkerCities()`

Make sure each returns the copy of the right data.

## City List

* Update the `CityList` module to invoke `getCities()` now and store its return value in `cities`.
* Update the `for..of` loop to iterate the array value of `cities`.
* Make sure you interpolate the `name` property of the city between the `<li>` tags.


## Walker Cities

Currently, when you click on a walker, it displayes which city the walker works in. This is no longer accurate after the change in data design. You need to find **all** cities for the walker and display them.

First, define a function that will get all objects in the `walkerCities` array that are for the walker that was clicked on. It should return an array of all matching objects.

Then, define a function that take in the array of matching objects, and use the `cityId` property on each one to find the matching city name. It should return a string containing all the city names.

### Helpful hints: Algorithms

If you are stuck on how to break down the problems into algorithm comments, here are some helpful hints to get you started.

<details>
    <summary>Algorithm: Finding cities per walker</summary>

```js
// The function need the walker information, so define a parameter
const filterWalkerCitiesByWalker = () => {
    // Define an empty array to store all of the assignment objects

    // Iterate the array value of walkerCities

    // Check if the primary key of the walker equals the foreign key on the assignment

    // If it does, add the current object to the array of assignments

    // After the loop is done, return the assignments array
}

```
</details>

<details>
    <summary>Algorithm: Building city names string</summary>

```js
// Define a function that builds a string of city names. Needs a paramter for assignments array.
const assignedCityNames = () => {
    // Define an empty string that will get appended with matching cities

    // Iterate the array of assignment objects

    // For each assignment, iterate the cities array to find the match

    // Add the name of the matching city to the array of city names

    // After the loop is done, return the string
}
```
</details>

### Helpful hints: Implementations

If you are stuck on how to implement the algorithms, you can use these hints to get moving again.

<details>
    <summary>Implementation: Finding cities per walker</summary>

```js
// The function need the walker information, so define a parameter
const filterWalkerCitiesByWalker = (walker) => {
    // Define an empty array to store all of the assignment objects
    const assignments = []

    // Iterate the array value of walkerCities
    for (const assignment of walkerCities) {

        // Check if the primary key of the walker equals the foreign key on the assignment
        if (assignment.walkerId === walker.id) {
            // If it does, add the current object to the array of assignments
            assignments.push(assignment)
        }
    }

    // After the loop is done, return the assignments array
    return assignments
}

```
</details>

<details>
    <summary>Implementation: Building city names string</summary>

```js
// Define a function that builds a string of city names. Needs a paramter for assignments array.
const assignedCityNames = (assignments) => {
    // Define an empty string that will get appended with matching cities
    let cityNames = ""

    // Iterate the array of assignment objects
    for (const assignment of assignments) {

        // For each assignment, iterate the cities array to find the match
        for (const city of cities) {
            if (city.id === assignment.cityId) {
                // Add the name of the matching city to the string of city names
                cityNames = `${cityNames} and ${city.name}`
            }
        }
    }

    // After the loop is done, return the string
    return cityNames
}
```
</details>



<details>
    <summary>Implementation: Setter functions</summary>

```js
export const getCities = () => {
    return database.cities.map(city => ({...city}))
}

export const getWalkerCities = () => {
    return database.walkerCities.map(assignment => ({...assignment}))
}
```
</details>

<details>
    <summary>Implementation: Putting it all together</summary>

```js
for (const walker of walkers) {
    if (walker.id === parseInt(walkerId)) {
        const assignments = filterWalkerCitiesByWalker(walker)
        const cities = assignedCityNames(assignments)

        window.alert(`${walker.name} services ${cities}`)
    }
}
```
</details>
