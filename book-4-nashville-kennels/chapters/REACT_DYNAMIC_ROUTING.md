# Dynamic Routing

In this chapter, you are going to render a _Details_ view for each of the animals. When the customer clicks on `details`, they will be taken to a view that represents the individual resource. This will also allow users to bookmark a specific animal.

## Component to Represent a Single Animal

Your first task is to build a React component whose single responsibility is to display the details of a single animal.

The animal detail component will need three files:

1. The component
1. CSS for styling the HTML
1. An svg image of a dog

Create the following files:

```sh
src/components/animal/AnimalDetail.css
src/components/animal/AnimalDetail.js
```

**Consider**: If this URL was bookmarked, what would you need to display it correctly? How about data from the database?

Just like loading the animals into the **`<AnimalList>`**, load one animal's detail when the component mounts. In order to do this, we need an animal's id. React-router provides a way to pass and get the necessary information.

> components/animal/AnimalDetail.css

```css
#root > .card {
  max-width: 400px;
  margin: 10px auto;
}
```

> components/animal/AnimalDetail.js

```jsx
import React, { useState, useEffect } from 'react';
import { getAnimalById } from '../../modules/AnimalManager';
import './AnimalDetail.css';
import { useParams, useHistory } from "react-router-dom"

export const AnimalDetail = () => {
  const [animal, setAnimal] = useState({ name: "", breed: "" });

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
      });
  }, [animalId]);

  return (
    <section className="animal">
      <h3 className="animal__name">{animal.name}</h3>
      <div className="animal__breed">{animal.breed}</div>
      {/* What's up with the question mark???? See below.*/}
      <div className="animal__location">Location: {animal.location?.name}</div>
      <div className="animal__owner">Customer: {animal.customer?.name}</div>
    </section>
  );
}


```
Immediate properties of an empty object will not break if you try to reference that property but it doesn't actually exist, however nested properties of an empty object will. Use the [Optional chaining (?.)](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Optional_chaining) operator to prevent nested values from breaking the code. Try replacing "name" with "foo" in the code above ( since location and customer don't have a "foo" property ). Try it with and without the ?. One will cause an error and the other won't.

## Dynamic Route and Route Parameters

Now that you have a component responsible for rendering a single animal based on `animalId`, you need to configure your application to render the component when the URL matches a certain pattern. Currently, you have a route set up to show all animals when the URL matches:

```html
<!-- show all animals -->
http://localhost:3000/animals
```

To display a single animal, the primary key for the animal will be added to the end of the URL. Here's what the URL will look like to show the first animal in your API.

```html
http://localhost:3000/animals/1
```

> **Vocabulary:** The `1` in the URL here is called a [route](https://jaketrent.com/post/access-route-params-react-router-v4/) [parameter](https://scotch.io/courses/using-react-router-4/route-params).

Define the new route in the **`ApplicationViews`** component. Note that the keyword `exact` has been added to the `/animals` route. Without the `exact` keyword, the second route would also handle `/animals/:animalId`.

In this example, the value of `1` is captured by React Router and stored in an `animalId` property of a specific namespace - `props.match.params.animalId`.

> ApplicationViews.js

```jsx
{/* Make sure you add the `exact` attribute here */}
<Route exact path="/animals">
  <AnimalList />
</Route>

<Route path="/animals/:animalId(\d+)">
  <AnimalDetail />
</Route>

{/*
  This is a new route to handle a URL with the following pattern:
  http://localhost:3000/animals/1

  It will not handle the following URL because the `(\d+)`
  matches only numbers after the final slash in the URL
  http://localhost:3000/animals/jack
*/}

```

Within **`<ApplicationViews>`**, import the **AnimalDetail** component.

```js
import AnimalDetail from "./animal/AnimalDetail";
```

You should be able to view a single animal's details by navigating to the new route.

## Add the Link for the Details

Modify the **`<AnimalCard>`** component by adding a `Details` button that returns a react-router-dom `<Link>` element.

```jsx
<Link to={`/animals/${animal.id}`}>
  <button>Details</button>
</Link>
```

Be sure to import the `Link` component from React Router at the top of the module.

```js
import { Link } from "react-router-dom";
```

Once the browser reloads, click on the _Details_ hyperlink in the first card. It will change the URL in the browser to `http://localhost:3000/animals/1`, and the detail component for the animal will render.

### Dynamic Route
You put :animalId(\d+) at the end of the URL to serve as a variable to hold the actual value that will be in the URL. For example, if the URL is http://localhost:3000/animals/detail/3, the value of 3 will be stored in that variable named `animalId`. The variable can then be accessed and used inside **`AnimalDetail`**.

Look back at the code you put in the detail component.

See the `const {animalId} = useParams();`

This is how you access the number 3 inside the component. Now, no matter which animal detail the user wants to view by clicking on any animal's detail link in the list of animals, this one path with match any and all of them, whether there are two animals or two million. It's part of the routing package (react-router-dom) you installed. Don't worry, that one's tricky. We'll help you remember it.

ApplicationViews includes the route for animal details. You will now support a route like the following.

http://localhost:3000/animals/detail/7




## Practice: Show The Details

We found that users want to bookmark specific locations. Add a `Details` button to each location card, create a **`<LocationDetail>`** component, and add an additional route to handle the location detail.
