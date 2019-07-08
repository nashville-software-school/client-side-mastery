# React

React is a library that was open sourced by the development team at Facebook with the sole purpose of managing how data is displayed to the user. It doesn't care about the database, it doesn't care how data is retrieved, and doesn't care about how complex the rest of the application is.

You've already learned the vast majority of what React does for you when building the UI for your application.

1. Building components and child components
1. Modular code with Browserify modules
1. Updating the DOM with document elements or string templates
1. Setting the state of a component

## Installing React Developer Tools

You can install the React Developer Tools via the [Chrome Store](https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi). These tools are another panel the Chrome Developer panel that will help with debugging and inspecting your React applications.

## Getting Started with create-react-app

Visit the [create-react-app](https://github.com/facebook/create-react-app/) Github repo and follow the instructions for getting yourself set up with a simple React application.

## Getting Started with Components

Your instructor will walk through this code with you as you build up your initial React application.

### Single Component

Here's is a simple example of a React component.

```js

import React, { Component } from 'react'
import './Kennel.css'

class Kennel extends Component {
    render() {
        return (
            <div>
                <h2>Student Kennels<br />
                    <small>Loving care when you're not there.</small>
                </h2>
                <address>
                    Visit Us at the Nashville North Location
                    <br />500 Puppy Way
                </address>
            </div>
        );
    }
}

export default Kennel
```
Looks a bit familiar, right? We're making a subclass of an existing `Component` base class. It has a single method, `render`, that returns an HTML representation of some (hard-coded) data. You've done all of that before.

Sort of.

That stuff that looks like HTML? It's not. It's called [JSX](https://reactjs.org/docs/introducing-jsx.html), and it basically allows us to write JavaScript that looks like HTML in our code, so we can better visualize what the eventual rendered HTML structure will look like.

Even though we write `<Kennel>` in React code, which looks like an HTML element, you can consider each one of your components as a factory function. It's just a function that returns an object.

To display our `Kennel` component, we need to modify the `index.js file`. This file, `index.js`, is the first javascript file that runs in our app.

```js
import React from 'react';
import ReactDOM from 'react-dom';
import Kennel from './components/Kennel';

ReactDOM.render(<Kennel />, document.getElementById('root'));

```


### Child Component

After the company information, we want to list all of the animals. I **could** hard code them inside the kennel component, but as a good developer, I try to adhere to the *Single Responsibility Principle* whenever I can.

Therefore, I'm going to create another component for displaying an animal. Consider how we have structured our previous projects and make a new file specific to the animal display. Copy pasta this code into a new file called `AnimalCard.js`.

```js
import React, { Component } from 'react';

class AnimalCard extends Component {
  render() {
    return (
      <div className="card">
        <div className="card-content">
          <picture>
            <img src={require('./dog.svg')} alt="My Dog" />
          </picture>
          <h3>Name: <span style={{color: 'darkslategrey'}}>Doodles</span></h3>
          <p>Breed: Poodle</p>
        </div>
      </div>
    );
  }
}

export default AnimalCard;
```

> components/animal/DogIcon.svg

Right click and save this image to the above location.

![Dog icon](./images/DogIcon.svg)


This component can be included as a child of the **`Kennel`** component. Look at the code below and notice the custom HTML elements `<AnimalCard />`. JSX interprets this as a component and will render the class you defined.

Update your **`Kennel`** component. When the `Kennel` component is rendered it will render the `AnimalCard` component. We can say that the Kennel component is a parent of the AnimalCard component.

```js
import React, { Component } from 'react'
import AnimalCard from './AnimalCard'
import './Kennel.css'


class Kennel extends Component {
    render() {
        return (
            <div>
                <h3>Student Kennels</h3>
                <h4>Nashville North Location</h4>
                <h5>500 Puppy Way</h5>
                <AnimalCard />
                <AnimalCard />
                <AnimalCard />
            </div>
        );
    }
}
```

> **Note:** The render method for a React component can only return a single component that encompasses child elements.

### Component Files

Before we grow this application any further, let's create a meaningful directory structure.

1. Inside your `src` directory, create a `components` sub-directory.
2. Put `Kennel.js` into the `components` directory.
3. Within components, create an `animal` directory and place the AnimalCard.js inside.
4. Include `Kennel.css` in the components directory.
5. Check your imports for correct paths.

```
- src
    - components
        - animal
            - AnimalCard.js
        - Kennel.js
        - Kennel.css
index.js

```

## Add some styles to Kennel.css

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

img {
	display: block;
	border: 0;
	width: 100%;
	height: auto;
}

.section-content {
	padding: 1.4em;
}

.container-cards {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
}

```

## Practice
The Kennel App needs to include locations, owners, and employees. Create static card components for each (`LocationCard.js`, `OwnerCard.js` and `EmployeeCard.js`). This is another example of Single Responsibility Principle. We should have a component whose sole responsibility is to render the location, or owner, or employee information. Follow the same directory structure and include the components in the JSX for **`Kennel**.


