# Passing Functionality as Properties

It's time to add one of the CRUD methods to your application. You're going to start with DELETE. Specifically, you're going to start with deleting animals to remove them from the kennel.

Before you write code, consider the Single Responsibility Principle again. Which component should have the responsibility of deleting an animal?

* The `<Animal>` component itself?
* The `<AnimalList>` component?

In this case, it makes more sense for the **`AnimalList`** component to do this for two reasons.

1. The `<AnimalList>` component is responsible for retrieving the data, and managing state, so remain consistent in managing the state when an animal is deleted as well.
1. An individual resource should not be responsible for updating or deleting itself because it has no high context for how that operation will affect the rest of the application. Therefore, the responsiblity should be at a higher level.

The first thing you need to do is add a link in each animal card for the customer to click on to check out their animal. In the code below, there is a new `<span>` element with a class of `fakeLink` that contains the word *Delete*.

Add the following code to your CSS to make it look and act like a hyperlink.

```css
.fakeLink {
  color: #007bff;
  margin-left: 15px;
}

.fakeLink:hover {
  color: #6f42c1;
  cursor: pointer;
}
```

> Animal.js

```js
import React from "react"
import { Link } from "react-router-dom"


export default props => {
    return (
        <div className="card" style={{width: `18rem`}}>
            <div className="card-body">
                <h5 className="card-title">
                    {props.animal.name}
                </h5>
                <p className="card-text">{props.animal.breed}</p>
                {
                    <Link className="card-link"
                    to={{
                        pathname: `/animals/${props.animal.id}`,
                        state: { animal: props.animal }
                    }}>
                        Details
                    </Link>
                }
                <span className="fakeLink">Delete</span>
            </div>
        </div>
    )
}
```

Time to add behavior to that fake link so that when it is clicked, the animal is removed from the API. Remember from above that the responsibility of actually removing the animal from the kennel should reside in the **`AnimalList`** component. Therefore, the **`Animal`** component will be receiving that functionality as a property.

Add an `onClick` attribute that invokes a function (which you will write in a moment) named `this.props.checkOutAnimal`.

```html
<span onClick={this.props.checkOutAnimal} className="fakeLink">Delete</span>
```

Next, define that function in **`AnimalList`**.

```js
export default class AnimalList extends Component {
    ...

    checkOutAnimal = (animalId) => {
        // Delete the specified animal from the API
        fetch(`http://localhost:5002/animals/${animalId}`, {
            method: "DELETE"
        })
        // When DELETE is finished, retrieve the new list of animals
        .then(() => {
            // Remember you HAVE TO return this fetch to the subsequenet `then()`
            return fetch("http://localhost:5002/animals")
        })
        // Once the new array of animals is retrieved, set the state
        .then(a => a.json())
        .then(animalList => {
            this.setState({
                animals: animalList
            })
        })
    }

    ...
}
```

Now your **`AnimalList`** component contains the logic for deleting an animal from the API, and updating its state. Yet there's one thing that's missing. Notice that the `checkOutAnimal` function accepts one argument: `animalId`. In the **`Animal`** component, you specify that the `checkOutAnimal` function should be invoked when the customer clicks on the delete link, but you haven't specified **_which_** animal should be deleted. Using a lamba is how you can do that.

```html
<span onClick={() => props.checkOutAnimal(props.animal.id)} className="fakeLink">Delete</span>
```

## Function Reference as a Property

Now that the function to perform the delete has been written, the the child component specifies that it should be invoked on click, and the correct argument is passed, it's time to refactor the **`AnimalList`** component to pass the function reference to its child.

```js
render() {
    return (
        <React.Fragment>
            {
                this.state.animals.map(animal =>
                    <Animal key={animal.id}
                            animal={animal}
                            checkOutAnimal={this.checkOutAnimal}
                    />
                )
            }
        </React.Fragment>
    )
}
```

So just like a primitive value like a string or an integer, you can pass function references from a parent component to a child component. The child component can then specify when that functionality should be invoked, even though it was defined on its parent.

## Practice: Remove Customers

Add the same functionality to the **`CustomerList`** and **`Customer`** components so that they can be deleted.

## Challenge: Add a New Animal

Add a simple form - with an input field for the animal's name and one for the breed - to the **`AnimalList`** component to kennel a new animal. When the submit button is clicked, you should POST the new animal to the API, then immediately GET the new list and set state. Just like you did for DELETE.

