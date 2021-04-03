# It's Alive!

## Videos to Watch

* [React: Using Context Providers and Hooks to display data](https://www.youtube.com/watch?v=rSQ1PNWOgU4&feature=youtu.be) - This is a review of the last two chapters to use for reference.
* [React Hooks useContext Tutorial (Storing a User)](https://www.youtube.com/watch?v=lhMKvyLRWo0)- Contexts can provide any data to its children, not just API data.

## Getting More Data

Now it's time to bring your application alive with data loaded from your API database. When you originally set up your APIs JSON file, you were provided with some initial data for 1 animal, 1 customer, and 2 locations.

Create 2 more animals, and 2 more corresponding customers that are the owners of those animals.

Then create 4 employee objects. Assign 2 employees to each location. Here's a sample employee.

```json
"employees": [
    {
        "id": 1,
        "name": "Jeremy Bakker",
        "locationId": 2
    }
]
```

## Refactoring

Now create the following components for locations, animals, employees, and customers.

* Data provider
* List
* Individual item

Then refactor the **`ApplicationViews`** component to render each list component. Remember to wrap each list component in its corresponding data provider component.

```jsx
<h2>Animals</h2>
<AnimalProvider>
    <AnimalList />
</AnimalProvider>
```