# React Router And History

## Dynamically Changing the User's View

It might be a nice feature to allow our users to discharge an animal from the animal details view. We've previously seen how this might be accomplished in the animal list view, but it turns out we will need to consider something we didn't need to think about in the list. Once an animal is discharged (deleted), it no longer makes sense to display its details. Instead, we will want to automatically redirect the user back to the animal list. We can do this with the routing package object called [history](https://github.com/ReactTraining/react-router/blob/master/packages/react-router/docs/api/history.md). On the history object, there is a method named `push()`.

If you push something on to the browser _history stack_, it will change the view.

For example, the following code will change the URL in your browser to `http://localhost:3000/animals`, which triggers the routing package to find the matching **`<Route>`** definition in **`ApplicationViews`**. That route returns **`<AnimalList>`**, so we see a list of animals.

```js
history.push("/animals");
```

You are going to invoke `push()` after an animal has been deleted and then redirect to the animal list.

## Add an 'isLoading" to the component

Consider the flow of code for the **`<AnimalDetails>`** component

1. Component loads
1. The initial state is created with empty values for name and breed.
1. The component renders displaying those empty values for name and breed.
1. The function passed to `useEffect()` is invoked, getting data for one animal.
1. Data for one animal loaded, `setAnimal()` is invoked with the details.
1. The component runs again (it _re-renders_) to display the new animal details.

When there are empty values, what happens if the user clicks on discharge? Best practice would be to disable functionality until the data has loaded. We can do that by introducing a new value into our state. `isLoading` is a boolean value that will indicate whether or not the component is loading. A value of `true` should disable the button and a value of `false` should enable it. By putting `isLoading` in the component's state, we can trigger a re-render by changing its value.

Refactor the **`<AnimalDetail>`** to include `isLoading`. Notice that our button is disabled based on the state of `isLoading`.

> components/animal/AnimalDetail.js

```jsx
import React, { useState, useEffect } from "react";
import { getAnimalById } from "../../modules/AnimalManager";
import "./AnimalDetail.css";

export const AnimalDetail = () => {
  const [animal, setAnimal] = useState({ name: "", breed: "" });
  const [isLoading, setIsLoading] = useState(true);

  const {animalId} = useParams();
  const history = useHistory();

  useEffect(() => {
    //getAnimalById(id) from AnimalManager and hang on to the data; put it into state
    console.log("useEffect", animalId)
    getAnimalById(animalId)
      .then(animal => {
        setAnimal({
          name: animal.name,
          breed: animal.breed
        });
        setIsLoading(false);
      });
  }, [animalId]);

  return (
    <section className="animal">
      <h3 className="animal__name">{animal.name}</h3>
      <div className="animal__breed">{animal.breed}</div>
      {/* What's up with the question mark???? See below.*/}
      <div className="animal__location">Location: {animal.location?.name}</div>
      <div className="animal__owner">Customer: {animal.customer?.name}</div>
      <button type="button" disabled={isLoading} onClick={handleDelete}>
          Discharge
        </button>
    </section>
  );
};

```

We should probably also update the CSS to visually indicate that the button is disabled.

> components/animal/AnimalDetail.css

```css
#root > .card {
  max-width: 400px;
  margin: 10px auto;
}

button:disabled,
button:disabled:hover {
  background-color: lightgray;
}
```

## Add Delete Functionality

Consider the flow of code for delete.

1. User clicks on `Discharge`
1. We don't want the user to be able to click hundreds of times on the button, so we can `setIsLoading(true)` to disables the button.
1. Perform the DELETE operation to change your API data.
1. Once the delete is complete, switch the view from AnimalDetail 👉🏼 AnimalList.
1. AnimalList will re-render and display the remaining animals from the database.

Add the handleDelete function to **`AnimalDetail`** component.

```js
const handleDelete = () => {
  //invoke the delete function in AnimalManger and re-direct to the animal list.
  setIsLoading(true);
  deleteAnimal(animalId).then(() =>
    history.push("/animals")
  );
};
```

## Practice: Close a location

Refactor the **`<LocationDetail>`** component to allow closing (deleting). You will need to incorporate an `isLoading`. Once a location has been closed, automatically redirect the user back to the location list.
