# Joining Data in Multiple Resources

Sometimes we need data from multiple resources. For example, to add a new animal with dropdown options for both the locations and the customer.

In the next chapter we will create the AnimalForm component but first we need data from the location provider and customer provider. Update the **`ApplicationViews`** so the component has all the necessary providers as parent components.

> ##### `src/components/ApplicationViews.js`

```jsx
<AnimalProvider>
    <LocationProvider>
        <CustomerProvider>
            <Route exact path="/animals">
                <AnimalList />
            </Route>
        </CustomerProvider>
    </LocationProvider>
</AnimalProvider>
```

Now the **`AnimalList`** component can access data from all three data providers in order to access the name property on both the customer and the location.

## Using Multiple Contexts

The next step is to access the context from the two, new providers. Then you need to use the `useContext()` hook to get the state variables, and the functions to get the data from the API for each of those providers.

> ##### `src/components/animal/AnimalList.js`

```js
import React, { useContext } from "react"
import { AnimalContext } from "./AnimalProvider"
import { LocationContext } from "../location/LocationProvider"
import { CustomerContext } from "../customer/CustomerProvider"
import { Animal } from "./Animal"
import "./Animals.css"

export const AnimalList = () => {
    const { animals, getAnimals } = useContext(AnimalContext)
    const { locations, getLocations } = useContext(LocationContext)
    const { customers, getCustomers } = useContext(CustomerContext)

    useEffect(() => {
        console.log("AnimalList: Initial render before data")
        getLocations()
        .then(getCustomers)
        .then(getAnimals)
    }, [])


    return (
        <div className="animals">
            {animals.map(animal => <Animal key={animal.id} animal={animal} />)}
        </div>
    )
}
```

## Getting Owner and Clinic

Then you need to refactor your function that you are passing to the `.map()` method on the animals array. Use the `.find()` method on both the customers array and the locations array to find the object representation that each foreign key is referencing.

> ##### `src/components/animal/AnimalList.js`

```jsx
animals.map(animal => {
    const owner = customers.find(c => c.id === animal.customerId)
    const clinic = locations.find(l => l.id === animal.locationId)

    return <Animal key={animal.id}
                location={clinic}
                customer={owner}
                animal={animal} />
})
```

Again, here's what is actually sent to the **`Animal`** component.

```js
{
    location: { id: 2, name: "Nashville North", etc... },
    customer: { id: 2, name: "Madi Peper", etc... },
    animal: { id: 1, name: "Snickers", etc...},
    key: 1
}
```

## Display Full Names

The last step is to extract the new `customer` and `animal` keys on the object passed to the **`Animal`** component.

> ##### `src/components/animal/Animal.js`

```jsx
export const Animal = ({ animal, customer, location }) => (
```

Then display the name property of each one.

Now the **`AnimalForm`** component can access data from all of the data providers to produce dropdown options.
![animal card showing name of customer and location](./images/animals-after-join.png)
