# Passing Functionality as Properties

It's time to add one of the CRUD methods to your application. You're going to start with DELETE. Specifically, you're going to start with deleting animals to remove them from the kennel. You are going to add a Delete link to each animal card.

## Implementation of Delete Function
>**A Note About Component Method Definitions:** If a method will be passed to a child component to execute, via props, you must use the syntax like `deleteAnimal` below, as an  arrow function. Otherwise, use the method shorthand you learned in JS Class syntax, without the fat arrow, like so:
  ```js
  foo (bar) {
    ...
  }
  ```

Add the following function to your **`ApplicationViews`** component.

```js
deleteAnimal = id => {
    return fetch(`http://localhost:5002/animals/${id}`, {
        method: "DELETE"
    })
    .then(e => e.json())
    .then(() => fetch(`http://localhost:5002/animals`))
    .then(e => e.json())
    .then(animals => this.setState({
        animals: animals
    })
  )
}
```

Remember that every time you invoke the `setState()` method, it invokes the `render()` method for you. Since the `deleteAnimal()` function deletes an animal object from the API, and queries the new collection of animals, when state is updated, the array will not have the animal you deleted in it. Then `render()` will iterate the new array and show the new collection of animals.

## Pass the Function to AnimalList Component

Next, you need to pass this function to your **`AnimalList`** component. After you make this change, the **`AnimaList`** component will have two properies on the `this.props` namespace.

1. The `this.props.deleteAnimal` function reference
1. The `this.props.animals` array

```html
<Route exact path="/animals" render={() => {
    return <AnimalList deleteAnimal={this.deleteAnimal}
                       animals={this.state.animals} />
}} />
```

As you will see below, you are passing the function reference to the child component because that's where it will be invoked. Just like a primitive value, such as a string or an integer, you can pass function references from a parent component to a child component. The child component can then specify when that functionality should be invoked, even though it was defined on its parent.

## Implementation of Delete Link

Now you are going to add a link in each animal card HTML for the veterniarian to click in order to discharge an animal. In the code below, there is a new `<button>` element that contains the word *Delete*.

> AnimalList.js

```jsx
import React, { Component } from 'react'
import dog from "./DogIcon.png"
import "./Animal.css"

export default class AnimalList extends Component {
    render () {
        return (
            <section className="animals">
            {
                this.props.animals.map(animal =>
                    <div key={animal.id} className="card">
                        <div className="card-body">
                            <h5 className="card-title">
                                <img src={dog} className="icon--dog" />
                                {animal.name}
                                <button
                                    onClick={() => this.props.deleteAnimal(animal.id)}
                                    className="card-link">Delete</button>
                            </h5>
                        </div>
                    </div>
                )
            }
            </section>
        )
    }
}
```

> components/animal/DogIcon.svg

Right click and save this image to the above location.

![Dog icon](./images/DogIcon.svg)

> components/animal/Animal.css

```css
.animals {
    display: flex;
    justify-content: space-evenly;
}

.icon--dog {
    width: 50px;
    height: 50px;
}

.card {
    width: 10rem;
}

.card-title {
    display: flex;
    justify-content: space-around;
    align-items: center;
    flex-direction: column;
}

.card-link {
    margin: 12px 0 0 0;
    font-size: 0.7em;
}
```

---

## Practice: Kennels: Fire Employees

Add the same functionality to the **`EmployeeList`** component so that employees can be fired!

## Practice: Kennels: Remove Owners

Add the same functionality to the **`OwnerList`** for when they decide they no longer want to be a customer.

## Practice: Kandy Korner: Discontinued Candy

Add a function in **`KandyKorner`** that will remove individual candies from your inventory. Add a button to the JSX you have in **`CandyList`** that renders individual candies. Then invoke that function when the user clicks the button on an individual candy.
