# Dynamic Routing

In this chapter, you are going to render a hyperlink for each of the locations, animals, and employees. When the customer clicks on any of the hyperlinks, they will be taken to a view that represents an individual resource.

## Adding a Dynamic Route

Open your **`ApplicationViews`** component and add a new route to handle `/animals/:animalId`. Also note that the keyword of `exact` has been added to the `/animals` route. Without that keyword, the second route would also handle `/animals/:animalId`.

```jsx
<Route exact path="/" render={(props) => {
    return <LocationList locations={this.state.locations} />
}} />

{/* Make sure you add the `exact` attribute here */}
<Route exact path="/animals" render={(props) => {
    return <AnimalList animals={this.state.animals} />
}} />

{/*
    This is a route to handle a URL with the following pattern:
        http://localhost:3000/animals/1

    It will not handle the following URL because the `(\d+)`
    matches only numbers after the final slash in the URL
        http://localhost:3000/animals/jack
*/}
<Route path="/animals/:animalId(\d+)" render={(props) => {
    // Find the animal with the id of the route parameter
    let animal = this.state.animals.find(animal =>
        animal.id === parseInt(props.match.params.animalId)
    )

    // If the animal wasn't found, create a default one
    if (!animal) {
        animal = {id:404, name:"404", breed: "Dog not found"}
    }

    return <AnimalDetail { ...props }
        deleteAnimal={ this.deleteAnimal }
        animal={ animal } />
}} />
```

Also, add a new import statement at the top.

```js
import AnimalDetail from './animal/AnimalDetail'
```

By adding this route, you are setting up your application to view a single animal at a time, and you determine which animal is to be viewed by looking in the URL. The animal's primary key will be the last part of the URL path.

The path of `/animals/1` would display the details for Doodles the German Shepherd. The path of `/animals/5` would display the details for Derkins the Pug, and so on. Now it's time to create the component reponsible for displaying the details of an animal.

## AnimalDetail Component

You have a Route ready to go, but you're not done yet. The Route renders an **`AnimalDetail`** component, but you don't have that component yet. Add the following files and code to your `components/animal` directory.

> components/animal/Animal.css

```css
.ownerList {
    font-size: 0.75em;
}

.icon--dog {
    width: 50px;
    height: 50px;
}
```

> components/animal/DogIcon.svg

Right click and save this image to the above location.

![Dog icon](./images/DogIcon.svg)

> components/animal/AnimalDetail.js

You can import individual CSS files, and individual images to be used in a React component. Look at lines 2 and 3 of the component to see how it's done.

```jsx
import React, { Component } from "react"
import "./Animal.css"
import dog from "./DogIcon.svg"


export default class Animal extends Component {
    state = {
        saveDisabled: false
    }

    render() {
        return (
            <section className="animal">
                <div key={ this.props.animal.id } className="card">
                    <div className="card-body">
                        <h4 className="card-title">
                            <img src={ dog } className="icon--dog" />
                            { this.props.animal.name }
                        </h4>
                        <h6 className="card-title">{ this.props.animal.breed }</h6>
                        <button
                            onClick={
                                () => {
                                    this.setState(
                                        { saveDisabled: true },
                                        () => this.props.dischargeAnimal(this.props.animal.id)
                                    )
                                }
                            }
                            disabled={ this.state.saveDisabled }
                            className="card-link">Delete</button>
                    </div>
                </div>
            </section>
        )
    }
}
```

### Component State

Hey! What's that `saveDisabled` state variable doing in there? I thought I wasn't supposed to have state anywhere but in **`ApplicationViews`**???

Well, when the user clicks on the delete button, the HTTP operation could potentially take a second or two. This would allow a ridiculously impatient user (which is most people) the ability to click on the button repeatedly. This would generate multiple requests to delete the resource. You want to prevent that.

You can disable HTML buttons with the `disabled` attribute set to **true**. When the user clicks the button, you want to immediately disable it so there is only one `DELETE` operation performed to your API.

All of this has nothing to do with the rest of your application. This concern is 100% contained to this component. Therefore, you will use a local state variable to track whether the delete button is disabled.

You initially don't want it disabled, so the tracking state variable will be initialized to **false**.

```js
state = {
    saveDisabled: false
}
```

Then you will update state when the button is clicked. In the code below, note that `setState()` is being sent a second parameter - a function _(or lambda)_. Since `setState()` is an asynchronous operation, passing a function as the second parameter ensures that it is invoked _after_ state is set.

```js
() => {
    this.setState(
        { saveDisabled: true },
        () => this.props.deleteAnimal(this.props.animal.id)
    )
}
```

You could write the following code, where state is set first, and then the `deleteAnimal` function is invoked on the line below it. It would work perfectly fine because the two are not dependant upon each other at all. The first statement disables a button, and the second performs an HTTP operation. You don't need to "wait" for the button to be disabled before you fire off the HTTP operation.

```js
() => {
    this.setState({ saveDisabled: true })
    this.props.deleteAnimal(this.props.animal.id)
}
```

## Adding the Link for the New Route

Next, modify the **`AnimalList`** component by adding a new `<Link>` element above the button for deleting.

```jsx
<Link className="nav-link" to={`/animals/${animal.id}`}>Details</Link>
```

Also make sure you import the `Link` component from React Router at the top of the module.

```js
import { Link } from "react-router-dom";
```

Once the browser reloads, click on the _Details_ hyperlink in the first card. It will change the URL in the browser to `http://localhost:3000/animals/1`, and the detail component for the animal will render.

![animated image showing dynamic routing in action](./images/pZks6gwfvK.gif)

## Refactor How Delete Works

### Setup

Add this import to the top of **`ApplicationViews`**.

```js
import { withRouter } from 'react-router'
```

Refactor the export at the bottom of **`ApplicationViews`** to look like this.

```js
export default withRouter(ApplicationViews)
```

### Description

When we discharge an animal from the kennel (i.e. delete the animal from our JSON) you obviously can't show that animal's details any longer. Therefore, when the user clicks on the delete button, you are going to redirect the user back to the animal list. The routing package you are using provides a object called [history](https://github.com/ReactTraining/react-router/blob/master/packages/react-router/docs/api/history.md). On that object, there is a method named `push()`.

If you push something on to what's called the _history stack_, it will change the view.

For example, the following code will change the URL in your browser to `http://localhost:3000/animals`, which triggers the routing package to find the matching **`<Route>`** definition in **`ApplicationViews`**. That route returns **`<AnimalList>`**, so we see a list of animals.

```js
this.props.history.push("/animals")
```

You are going to use `push()` in the `deleteAnimal()` function that you previously defined in **`ApplicationViews`**. Refactor the function to redirect to the animal list once the delete operation is successful. In the following code, this is the sequence of events.

1. Perform the DELETE operation to change your API data.
1. Get all animals from the API.
1. Switch the view from Animal Detail 👉🏼 Animal List.
1. Invoke `setState()` to update the `animals` array. This will trigger `render()` and the updated list of animals will appear without the one you just deleted.

```js
deleteAnimal = id => AnimalManager.delete(id)
    .then(AnimalManager.getAll)
    .then(animals => {
        this.props.history.push("/animals"))
        this.setState({ animals: animals })
    })
```

---

## Practice: Kennels: All the Details

Now implement dynamic routing to show the details of individual resources that you are displaying in your application.

* Employee details
* Location details
* Animal details

## Practice: Kandy Korner: Stores, Employees and Candies Oh My

For all of the resources in Kandy Korner, when rendering them in the list view, make the name of each item a hyperlink. When the user clicks on the item, take them to the detail view for that item.