# Releasing Happy Animals From Your Care

In this chapter, you are going to provide the ability to release animals from your care. Once an animal is ready to go home with their owner, it doesn't need to be in your system any more. You will need to delete it from your database of active animals.


## Implement and Expose DELETE Method in Provider

Since the provider components handle all interactions with the database, you need to implement a function that performs a `fetch` operation with the **DELETE** method to delete a specific animal.

> ##### `/src/components/animal/AnimalProvider.js`

```js
const releaseAnimal = animalId => {
    return fetch(`http://localhost:8088/animals/${animalId}`, {
        method: "DELETE"
    })
        .then(getAnimals)
}
```

Expose the method via the _AnimalContext_.

> ##### `/src/components/animal/AnimalProvider.js`

```jsx
<AnimalContext.Provider value={{
    animals, addAnimal, getAnimals, releaseAnimal
}}>
```


## Use Provider Method

Get a reference to the release function in your animal component.

> ##### `/src/components/animal/AnimalDetails.js`

```js
// Update this line of code to include releaseAnimal
const { releaseAnimal } = useContext(AnimalContext)
```

Add a button to your animal details component that will allow the user to release the animal from care. Then invoke the function when the button is clicked. Once the delete operation is complete, redirect the user back to the list of animals.

> ##### `/src/components/animal/AnimalDetails.js`

```js
const history = useHistory()

const handleRelease = () => {
    releaseAnimal(animal.id)
      .then(() => {
        history.push("/animals")
      })
  }

```
Add the button within the return
```jsx
<button onClick={handleRelease}>Release Animal</button>
```