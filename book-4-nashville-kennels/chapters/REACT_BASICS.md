# Getting Started with React

React is a library that was open sourced by the development team at Facebook with the sole purpose of managing how data is displayed to the user. It doesn't care about the database, it doesn't care how data is retrieved, and it doesn't care about how complex the rest of the application is.

You've already learned the vast majority of what React does for you when building the UI for your application.

1. Building components and child components
1. Modular code with JavaScript modules
1. Updating the DOM with document elements or string templates
1. Setting the state of a component

## Installing React Developer Tools

You can install the React Developer Tools via the [Chrome Store](https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi). These tools are another panel the Chrome Developer panel that will help with debugging and inspecting your React applications.

## Getting Started with create-react-app

```sh
cd ~/workspace
npx create-react-app kennels
# Wait for installation to complete
cd kennels/src
rm App*
```

### Getting Setup

Before we grow this application, let's create a meaningful directory structure.

1. Inside your `src` directory, `mkdir` a `components` sub-directory.
2. `cd` into the `components` directory.
3. `touch` `Kennel.js` and `Kennel.css`.
4. Within components, `mkdir` an `animal` directory
5. `cd` into the `animal` directory.
6. `touch Animal.js Animals.css`

```
- src
    - components
        - animal
            - Animal.js
            - Animals.css
        - Kennel.js
        - Kennel.css
  index.js

```

## Getting Started with Components

Your instructor will walk through this code with you as you build up your initial React application.

### Single Component

Here is a simple example of a React component. Please read through the following code snippets and ask questions prior to writing any code.

> src/components/Kennel.js

```jsx
import React from "react"

export default () => (
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

Some of this looks familiar, sort of. This is simply another way of building a JavaScript object (Kennel) that has a single property -- a method called render -- that returns an HTML representation of some (hard-coded) data. You've done all of that before.


That stuff that looks like HTML? It's not. It's called [JSX](https://reactjs.org/docs/introducing-jsx.html), and it basically allows us to write JavaScript that looks like HTML in our code, so we can better visualize what the eventual rendered HTML structure will look like.

Even though we write `<Kennel>` in React code, which looks like an HTML element, you can consider each one of your components as a factory function. It's just a function that returns an object.

To display our `Kennel` component, we need to modify the `index.js` file. This file, `index.js`, is the entry file or the first JavaScript file that runs in our app.

> ##### `src/index.js`

```js
import React from "react"
import ReactDOM from "react-dom"
import Kennel from "./components/Kennel"

ReactDOM.render(<Kennel />, document.getElementById("root"))
```

### Child Component

After the company information, we want to list all of the animals. I **could** hard code them inside the kennel component, but as a good developer, I try to adhere to the *Single Responsibility Principle* whenever I can.

Therefore, I'm going to create another component for displaying an animal. Consider how we have structured our previous projects and make a new file specific to the animal display. Copy pasta the following code into the following file.

> ##### `src/components/animal/Animal.js`

```jsx
import React from "react"

export default () => (
    <section className="animal">
        <h3 className="animal__name">Doodles</h3>
        <div className="animal__breed">Breed: Poodle</div>
    </section>
)
```

This component can be included as a child of the **`Kennel`** component. Look at the code below and notice the custom HTML element `<Animal />`. React interprets this as a component and will run the function that you imported from `Animal.js` and then render the JSX that it defines.

Update your **`Kennel`** component with the code provided below. Now when the **`Kennel`** component is rendered it will render 3 child **`Animal`** components.

> ##### `src/components/Kennel.js`

```jsx
import React from "react"
import Animal from "./animal/Animal"
import "./Animals.css"

export default () => (
    <>
        <h2>Nashville Kennels</h2>
        <small>Loving care when you're not there.</small>

        <address>
            <div>Visit Us at the Nashville North Location</div>
            <div>500 Puppy Way</div>
        </address>

        <h2>Animals</h2>
        <article className="animals">
            <Animal />
            <Animal />
            <Animal />
        </article>
    </>
)
```

## Kennel Styles

> ##### `src/components/Kennel.css`

```css
/* Import the google web fonts you want to use */
@import url('https://fonts.googleapis.com/css?family=Comfortaa|Patua+One');

/*Typography
--------------------------------------------------------------*/
body,
button,
input,
select,
textarea {
	color: #404040;
	font-family: 'Comfortaa', Arial, sans-serif;
	font-size: 14px;
	line-height: 1.5;
}

h1,h2,h3,h4,h5,h6 {
  font-family: 'Patua One', serif;
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

> ##### `src/components/animal/Animals.css`

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

Yes, each one will display the identical information. This is just to practice making components. You'll be making real, data-driven components soon.

* Show 2 locations
* Show 4 customers
* Show 3 employees

![all components rendered in a grid](./images/hard-coded-components.png)