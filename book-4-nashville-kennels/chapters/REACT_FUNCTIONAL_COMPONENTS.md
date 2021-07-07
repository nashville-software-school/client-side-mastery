## Getting Started with Components

### Vocabulary To Learn
* JSX
* React.Fragment or `<>...</>`


### Single Component

Here is a simple example of a React component. Please read through the following code snippets and ask questions prior to writing any code.


> src/components/Kennel.js

```jsx
import React from "react"
import "./Kennel.css"

export const Kennel = () => (
    <>
        <h2>Nashville Kennels</h2>
        <small>Loving care when you're not there.</small>
        <address>
            <div>Visit Us at the Nashville North Location</div>
            <div>500 Puppy Way</div>
        </address>
    </>
)
```

Some of this looks familiar, sort of. This is simply another way of using JavaScript to create an HTML representation of some (hard-coded) data. You've done that before.

That stuff that looks like HTML? It's not. It's called [JSX](https://reactjs.org/docs/introducing-jsx.html), and it basically allows us to write JavaScript that looks like HTML in our code. With JSX, we can better visualize the eventual rendered HTML structure.

**What is `<>` and `</>`**
Remember, within a function, the return can only return **ONE** thing. This is a `React.Fragment` and gives us the ability to wrap the content and return one item.

To display our `Kennel` component, we need to modify the `index.js` file. This file, `index.js`, is the entry file or the first JavaScript file that runs in our app.

> ##### `src/index.js`

```js
import React from "react"
import ReactDOM from "react-dom"
import { Kennel } from "./components/Kennel"
import "./index.css"

ReactDOM.render(
  <React.StrictMode>
    <Kennel />
  </React.StrictMode>,
  document.getElementById('root')
);
```

Note that even though we write `<Kennel>` in React code, which looks like an HTML element, you can consider each one of your components as a factory function. It's just a function that returns an object.

## Starting Your React Application

Make sure you are in the top-level project directory, and not in the `public` or `src` sub-directory. Once there, in your terminal, type the following command.

```sh
npm start
```

It will take about 30 seconds to run all of your code, and then the process will automatically open a new tab in your browser and then render your HTML.

### Child Component

After the company information, we want to list all of the animals. we **could** hard code them inside the kennel component, but as good developers, we try to adhere to the _Single Responsibility Principle_ whenever possible.

Therefore, we are going to create another component for displaying an animal. Consider how we have structured our previous projects and make a new file specific to the animal display. Copy pasta the following code into the following file.

> ##### `src/components/animal/AnimalCard.js`

```jsx
import React from "react"
import "./Animal.css"

export const AnimalCard = () => (
    <section className="animal">
        <h3 className="animal__name">Doodles</h3>
        <div className="animal__breed">Breed: Poodle</div>
    </section>
)
```

This component can be included as a child of the **`Kennel`** component. Look at the code below and notice the custom HTML element `<AnimalCard />`. React interprets this as a component and will run the function that you imported from `AnimalCard.js` and then render the JSX that it defines.

Update your **`Kennel`** component with the code provided below. Be sure to import the **`AnimalCard`**. Now when the **`Kennel`** component is rendered it will display 3 child **`AnimalCard`** components. They will all have the same data in them for now. This is just to practice making components. You'll be making real, data-driven components soon.

Notice that in React, we add classes to a component with `className` instead of `class`. Why? Remember, the code between the `< >` brackets looks like HTML, but it's actually JSX. Your instructors will clarify.

> ##### `src/components/Kennel.js`

```jsx
import React from "react"
import { AnimalCard } from "./animal/AnimalCard"
import "./Kennel.css"

export const Kennel = () => (
    <>
        <h2>Nashville Kennels</h2>
        <small>Loving care when you're not there.</small>

        <address>
            <div>Visit Us at the Nashville North Location</div>
            <div>500 Puppy Way</div>
        </address>

        <h2>Animals</h2>
        <article className="animals">
            <AnimalCard />
            <AnimalCard />
            <AnimalCard />
        </article>
    </>
)
```

## Kennel Styles

> ##### `src/components/Kennel.css`

```css
/* Import the google web fonts you want to use */
@import url("https://fonts.googleapis.com/css?family=Comfortaa|Patua+One");

/*Typography
--------------------------------------------------------------*/
body,
button,
input,
select,
textarea {
  color: #404040;
  font-family: "Comfortaa", Arial, sans-serif;
  font-size: 14px;
  line-height: 1.5;
}

h1,
h2,
h3,
h4,
h5,
h6 {
  font-family: "Patua One", serif;
  letter-spacing: 2px;
}

p {
  margin-bottom: 1.5em;
  color: #d6fcff;
  color: darkslateblue;
}

strong {
  font-weight: bold;
}

address {
  margin: 0 0 1.5em;
}
```

## Animal Styles

> ##### `src/components/animal/Animal.css`

```css

.animals {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
}

.animal {
    flex-basis: 28%;
    margin: 1em;
    padding: 1em;
    border: 1px solid goldenrod;
}
```

## Practice

The Nashville Kennel application needs to include locations, owners, and employees. Create static card components for each (`Location.js`, `Customer.js` and `Employee.js`) and a corresponding CSS file.

Remember the Single Responsibility Principle. You should have a component whose sole responsibility is to render the location, or customer, or employee information. Make sure you create a different sub-directory for each kind of resource.

Again, for now, don't worry about each one displaying the identical information. 

* Show 2 locations
* Show 4 customers
* Show 3 employees

![all components rendered in a grid](./images/hard-coded-components.png)