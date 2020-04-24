# Releasing Happy Animals From Your Care

In this chapter, you are going to provide the ability to release animals from your care. Once an animal is ready to go home with their owner, it doesn't need to be in your system any more, so you need to delete it from your database of active animals.

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
    animals, addAnimal, releaseAnimal
}}>
```

## Use Provider Method

Get a reference to the release function in your animal component.

> ##### `/src/components/search/SearchResults.js`

```js
const { animals, releaseAnimal } = useContext(AnimalContext)
```

## Add a Release Button

Add a button to your animal details modal that will allow the user to release the animal from care.

> ##### `/src/components/search/SearchResults.js`

```jsx
<Modal isOpen={modal} toggle={toggle}>
    <ModalHeader toggle={toggle}>
        { selectedAnimal.animal.name }
    </ModalHeader>
    <ModalBody>
        <Animal key={selectedAnimal.animal.id} {...selectedAnimal} />
    </ModalBody>
    <ModalFooter>
        <Button color="danger" onClick={() => {
            releaseAnimal(selectedAnimal.animal.id)
            toggle()
        }}>Delete</Button>
    </ModalFooter>
</Modal>
```
