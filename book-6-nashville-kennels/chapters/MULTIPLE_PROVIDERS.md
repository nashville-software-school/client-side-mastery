# Joining Data in Multiple Resources

To expand our animal list to show the customer we need data from the location provider and customer provider. Update the **`ApplicationViews`** so the component has all the necessary providers as parent components.

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

The next step is to access the context from the two new providers. Then, you need to use the `useContext()` hook to get the state variables, and the functions to get the data from the API for each of those providers.

> ##### `src/components/animal/AnimalList.js`

```js
import React, { useContext, useEffect } from "react"
import { AnimalContext } from "./AnimalProvider"
import { LocationContext } from "../location/LocationProvider"
import { CustomerContext } from "../customer/CustomerProvider"
import { AnimalCard } from "./AnimalCard"
import "./Animal.css"

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
      <>
        <button onClick={() => {history.push("/animals/create")}}>
            Add Animal
        </button>
        <div className="animals">
          {
            animals.map(animal => {
              return <AnimalCard key={animal.id} animal={animal} />
            })
          }
        </div>
      </>
    )
}
```

## Getting Owner and Clinic

Then you need to refactor your function that you are passing to the `.map()` method on the animals array. Use the `.find()` method on both the customers array and the locations array to find the object representation that each foreign key is referencing.

> ##### `src/components/animal/AnimalList.js`

```jsx
animals.map(animal => {
    const owner = customers.find(c => c.id === animal.customerId)
    const location = locations.find(l => l.id === animal.locationId)

    return <AnimalCard key={animal.id}
                location={location}
                customer={owner}
                animal={animal} />
  })
```

Again, here's what is actually sent to the **`AnimalCard`** component.

```js
{
    location: { id: 2, name: "Nashville North", etc... },
    customer: { id: 2, name: "Madi Peper", etc... },
    animal: { id: 1, name: "Snickers", etc...},
    key: 1
}
```

## Display Full Names

The last step is to extract the new `customer` and `animal` keys on the object passed to the **`AnimalCard`** component, then display the name property of each one. 
> NOTE that in this example that `location` is not a property of animal, as in the earlier chapter. Why? See the bottom of the page after you make sure your code works.

> ##### `src/components/animal/AnimalCard.js`

```jsx
export const AnimalCard = ({ animal, customer, location }) => (
    <section className="animal">
      <h3 className="animal__name">{animal.name}</h3>
      <div className="animal__breed">{animal.breed}</div>
      <div className="animal__location">Location: {location.name}</div>
      <div className="animal__owner">Customer: {customer.name}</div>
    </section>
  )
```  
![animal card showing name of customer and location](./images/animals-after-join.png)

### _Expand_ your thinking
You may have noticed something weird in this chapter about the `locations` state. Mainly, it isn't really needed. Why? Think back to when you created the **AnimalProvider** component. In `getAnimals` you use `_expand=location`. Do you remember what that does? Why does it make it unnecessary to use the **LocationContext** in this component? 

Which approach seems 'better' to you? Why? Could we also remove the need for the **CustomerContext**? How? If you want to talk this out with an instructor, grab one and hash it out! Or, group up with some classmates and think outloud with them.
`
