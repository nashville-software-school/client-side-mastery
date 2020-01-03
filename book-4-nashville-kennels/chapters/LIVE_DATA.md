# It's Alive!

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

Now create the following components for animals, employees, and customers.

* Data provider
* List
* Individual item

Then refactor the **`Kennel`** component to render each list component. Remember to wrap each list component in its corresponding data provider component. For example...

```jsx
<h2>Animals</h2>
<AnimalProvider>
    <AnimalList />
</AnimalProvider>
```