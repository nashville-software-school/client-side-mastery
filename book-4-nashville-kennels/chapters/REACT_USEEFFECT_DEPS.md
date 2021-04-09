# Animal Spotlight and the useEffect Dependency Array

It's finally time to dig into the second argument to `useEffect`. You'll recall that this argument is an array. Up until now, we've mostly been passing an empty array, but there are times when you will need to use an array that contains some data.

## What is the purpose of the array argument?

The array argument to `useEffect()` defines the effect's _"dependencies"_. In this context a _dependency_ is a variable or prop that React should watch for changes. When the value of the dependency changes, React will trigger the effect.

When the array is empty the effect **_will only run after the component's first render_**.

## Animal Spotlight

The Product Owner has decided that the Kennel application should have an "Animal Spotlight" on the home page. This means we want to display a random animal in the `<Home>` component and include the ability to "reload" the random animal.

In order to complete this feature, we'll need to add a new component, add a new method to `AnimalManager` and update the `<Home>` component.

First let's add a new component to display the random animal. We'll call it `<AnimalSpotlight>`. We'll also add a new stylesheet.

In the `src/components/animal/` folder, create the following files:

- `AnimalSpotlight.js`
- `AnimalSpotlight.css`

> src/components/animal/AnimalSpotlight.css

```css
.animal-spotlight {
  max-width: 400px;
  display: flex;
  border: 1px dashed gray;
  padding: 10px;
}

.animal-spotlight img {
  width: 200px;
  margin-right: 20px;
}

.animal-spotlight p {
  color: black;
}
```

> src/components/animal/AnimalSpotlight.js

```js
import React, { useState, useEffect } from "react";
import { getAnimalById } from "../../modules/AnimalManager";
import "./AnimalSpotlight.css";

export const AnimalSpotlight = ({animalId}) => {
  const [animal, setAnimal] = useState({});

  useEffect(() => {
    getAnimalById(animalId).then(animal => {
      setAnimal(animal);
    });
  }, []);

  return (
    <div className="animal-spotlight">
      {/* <img src={require('./dog.svg')} alt="My Dog" /> */}
      <div>
        <h3>{animal.name}</h3>
        <p>{animal.breed}</p>
      </div>
    </div>
  );
};

```

Notice the `<AnimalSpotlight>` component expects an `animalId` prop. We use this prop to get a single animal from the API.
Also notice that we are passing an empty array in the `useEffect()` function call. We'll come back to this in a bit.

Next, let's update the `<Home>` component.

> src/components/home/Home.js

```jsx
import React, { useState, useEffect } from "react";
import { AnimalSpotlight } from "../components/animal/AnimalSpotlight"
import { getRandomId } from "../modules/AnimalManager"
import { PropsAndState } from "./PropsAndState";

export const Home = () => {
  const [spotlightId, setSpotlightId] = useState(0);

  const refreshSpotlightAnimal = () => {
    getRandomId().then(setSpotlightId);
  };

  useEffect(() => {
    refreshSpotlightAnimal();
  }, []);

  return (
    <>
      <address>
        Visit Us at the Nashville North Location
        <br />
        500 Puppy Way
      </address>
      <h1>Animal Spotlight</h1>
      <button onClick={refreshSpotlightAnimal}>Reload &#x27f3;</button>
      {
        spotlightId && <AnimalSpotlight animalId={spotlightId} />
      }
    </>
  );
};

```

As you can see the `<Home>` component uses the new `<AnimalSpotlight>` component. It also refers to a new method on `AnimalManager` called `getRandomId()`.

> src/modules/AnimalManager.js

```js
// Add this method to the AnimalManager
export const getRandomId = () => {
  return fetch(`${remoteURL}/animals`)
    .then(result => result.json())
    .then(animals => {
      const randomIndex = Math.floor(Math.random() * animals.length);
      const randomAnimal = animals[randomIndex];
      return randomAnimal.id;
  });
}
```

With all that in place, it's time to run the application. What happens? Can you guess why? What happens when you click the "reload" button? Why?

### Adding the dependency

Remember that array argument to the `useEffect()` call in the `<AnimalSpotlight>` component? When we created the component, we used an empty array. The empty array tells the _effect_ to run one time...when the `<AnimalSpotlight>` initially renders. But, what is the value of the `animalId` prop on that first render? If you look back to the `<Home>` component, you'll see that the initial value is `0`...not a valid animal id.

Also, note that clicking the "reload" button has no affect on the `<AnimalSpotlight>` component _even though the `animalId` prop **is being updated**_.

To fix this issue, we must tell React to watch the `animalId` prop. We do that by including it in the `useEffect()` array argument.

```js
 useEffect(() => {
    getAnimalById(animalId).then(animal => {
      setAnimal(animal);
    });
  }, [animalId]);
```

Now try the app again and notice that it works as expected. When the `animalId` prop changes, the `useEffect()` runs again to retrieve a new animal.

### Conditional Rendering

Did you notice this code in the `<Home>` component?

```jsx
{
  spotlightId && <AnimalSpotlight animalId={spotlightId} />;
}
```

This is a common approach to _conditional rendering_. The `<AnimalSpotlight>` will only be rendered if the `spotlightId` variable is "_truthy_" (as opposed to "_falsy_"). The value of `0` is _falsy_ any other number is _truthy_.

#### Resources

- [Conditional Rendering with &&](https://reactjs.org/docs/conditional-rendering.html#inline-if-with-logical--operator)
- [Truthy Values](https://developer.mozilla.org/en-US/docs/Glossary/Truthy) and [Falsy Values](https://developer.mozilla.org/en-US/docs/Glossary/Falsy)
