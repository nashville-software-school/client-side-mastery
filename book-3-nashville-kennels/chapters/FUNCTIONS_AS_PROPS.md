# Passing Functionality as Props

It's time to add one of the CRUD methods to your application. You're going to start with DELETE. Specifically, you're going to start with discharging animals to remove them from the kennel. You are going to add a Discharge link to each animal card.

## Implementation of Delete Function
>**A Note About Component Method Definitions:** If a method will be passed to a child component to execute, via props, you must use the arrow function syntax.

First add the `delete` function to your `AnimalManager` module.

```js
delete(id) {
  return fetch(`http://localhost:5002/animals/${id}`, {
      method: "DELETE"
  })
  .then(result => result.json())
}
```
We can now invoke `delete()` from anywhere.

Before we include the delete functionality in a component, consider following:
* The discharge button will exist on the **`<AnimalCard />`** component.
* When an animal is removed, our animals array within the parent's state will need to reflect the updated list of animals.

### Flow of events
1. Click the discharge button
1. Invoke a `handleDelete` function which will invoke the AnimalManager delete function, be sure to pass the id.
1. Once an item is deleted, we should invoke the AnimalManager `getAll()` method.
1. With new data, invoke `setState()` and set **animals** equal to the new data.
1. Render is automatically called using the new state of animals.
1. **`<AnimalList>`** render maps over the data and displays cards for each animal.

**The component where state lives is the only place state can change. Children components cannot change state.**

Add the following function to your **`<AnimalList>`** component.

```js
deleteAnimal = id => {
  AnimalManager.delete(id)
  .then(() => {
    AnimalManager.getAll()
    .then((newAnimals) => {
      this.setState({
          animals: newAnimals
      })
    })
  })
}
```

Remember that every time you invoke the `setState()` method, it automatically invokes the `render()` method. The `deleteAnimal()` function deletes an animal object from the API, and then queries the database for all the animals(now updated). When state is updated, render runs and `maps` the new animal array to the **`<AnimalCard />`** component.


## Pass the Delete Function to AnimalCard Component
Now we can pass the `deleteAnimal` function to a child component giving the child component the ability to invoke the function found on the parent.

Change the render in **`<AnimalList />`**

```js
render(){
  console.log("AnimalList: Render");

  return(
    <div className="container-cards">
      {this.state.animals.map(animal =>
        <AnimalCard
          key={animal.id}
          animal={animal}
          deleteAnimal={this.deleteAnimal}
        />
      )}
    </div>
  )
}
```

**`AnimaCard`** component recieves two props:

1. The `this.props.deleteAnimal` function reference
2. The `this.props.animal` object


You pass the function reference to the child component because that's where it will be invoked. Just like a primitive value, such as a string or an integer, you can pass function references from a parent component to a child component. The child component can then specify when that functionality should be invoked, even though it was defined on its parent.

## Implementation of Delete Link

Add the button to the **`<AnimalCard />`** HTML for the veterinarian to select and discharge an animal. In the code below, there is a new `<button>` element that contains the word *Discharge*.

> AnimalCard.js

```jsx
import React, { Component } from 'react'
import './Animal.css'

class AnimalCard extends Component {
  render() {
    return (
      <div className="card">
        <div className="card-content">
          <picture>
            <img src={require('./dog.svg')} alt="My Dog" />
          </picture>
          <h3>Name: <b>{this.props.animal.name}</b></h3>
          <p>Breed: {this.props.animal.breed}</p>
          <button type="button" onClick={() => this.props.deleteAnimal(this.props.animal.id)}>Discharge</button>
        </div>
      </div>
    );
  }
}

export default AnimalCard;
```

---

## Practice: Fire Employees

Add the same functionality to the **`EmployeeList`** component so that employees can be fired!

## Practice: Remove Owners

Add the same functionality to the **`OwnerList`** for when they decide they no longer want to be a customer.

## Practice: Close a Location
Add the same functionality to the **`LocationList`** for when a location closes down.


