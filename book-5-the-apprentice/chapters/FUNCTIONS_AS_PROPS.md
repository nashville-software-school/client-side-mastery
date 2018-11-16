# Passing Functionality as Properties

It's time to add one of the CRUD methods to your application. You're going to start with DELETE. Specifically, you're going to start with deleting animals to remove them from the kennel. You are going to add a Delete link to each animal card.

## Implementation of Delete Function
>**A Note About Component Method Definitions:** If a method will be passed to a child component to execute, via props, you must use the syntax like `deleteAnimal` below, with a fat arrow. Otherwise,use the method shorthand you learned in JS Class syntax, without the fat arrow, like so:
  ```js
  foo(bar) {
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

## Pass the Function to AnimalList Component

Next, you need to pass this function to your **`AnimalList`** component.

```html
<Route exact path="/animals" render={(props) => {
    return <AnimalList deleteAnimal={this.deleteAnimal} animals={this.state.animals} />
}} />
```

As you will see below, you are passing the function reference to the child component because that's where it will be invoked.


## Implementation of Delete Link

Now add a link in each animal card HTML for the customer to click on to check out their animal. In the code below, there is a new `<a>` element that contains the word *Delete*.

**_Quick tip_:** Notice in the code below that you are importing a png file. Here is the image. Right-click and save this file to your `components/animal` directory.

![dog icon](https://github.com/stevebrownlee/react-step-by-step/raw/master/src/components/animal/DogIcon.png)

> AnimalList.js

```js
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
                                <a href="#"
                                    onClick={() => this.props.deleteAnimal(animal.id)}
                                    className="card-link">Delete</a>
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

> Animal.css

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

## How it Works

Just like a primitive value, such as a string or an integer, you can pass function references from a parent component to a child component. The child component can then specify when that functionality should be invoked, even though it was defined on its parent.

## Practice: Fire Employees

Add the same functionality to the **`EmployeeList`** component so that employees can be fired!

## Practice: Remove Owners

Add the same functionality to the **`OwnerList`** for when they decide they no longer want to be a customer.
