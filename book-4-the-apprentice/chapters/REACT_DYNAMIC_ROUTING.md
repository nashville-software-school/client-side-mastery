# Dynamic Routing

In this chapter, you are going to render each of the locations, animals, and employees as hyperlinks. When the customer clicks on any of the hyperlinks, they will be taken to a view that represents an individual resource.

## Adding a Dynamic Route

Open your **`ApplicationViews`** component and add a new route to handle `/animals/:animalId`. Also note that the keyword of `exact` has been added to the `/animals` route. Without that keyword, the second route would also handle `/animals/:animalId`.

```js
export default class ApplicationViews extends Component {
    render() {
        return (
            <React.Fragment>
                <Route exact path="/" component={LocationList} />
                <Route exact path="/animals" component={AnimalList} />
                <Route path="/animals/:animalId" component={Animal} />
                <Route path="/employees" component={EmployeeList} />
            </React.Fragment>
        )
    }
}
```

By adding this route, you are setting up your application to view a single animal at a time, and you determine which animal is to be viewed by looking in the URL. The animal's primary key will be the last part of the URL path.

The path of `/animals/1` would display the details for Doodles the German Shepherd. The path of `/animals/5` would display the details for Derkins the Pug, and so on.

If you complete the advanced challenge from the last chapter, then install Bootstrap for your project so that you can make cards out of each animal.

```sh
npm i bootstrap --save
```

To make the card look good, go ahead and add a `breed` property to each of your animals.

> AnimalList.js

```js
...
    state = {
        animals: [
            { id: 1, name: "Doodles", breed: "German Shepherd" },
            { id: 2, name: "Jack", breed: "Cocker Spaniel" },
            { id: 3, name: "Angus", breed: "Dalmatian" },
            { id: 4, name: "Henley", breed: "Carolina Retriever" },
            { id: 5, name: "Derkins", breed: "Pug" },
            { id: 6, name: "Checkers", breed: "Bulldog" }
        ]
    }
...
```

Now you can import the Bootstrap CSS into your `Animal.js` file. You also need to import the `Link` object so that when the customer clicks on one of the animals' card, the dynamic route that you added above is used.

You will notice that the `to` property in the `Link` below matches the pattern of the `Route` you set up earlier.

> Animal.js

```js
import React from "react"
import { Link } from "react-router-dom"
import "bootstrap/dist/css/bootstrap.min.css"


export default props => {
    return (
        <div className="card" style={{width: `18rem`}}>
            <div className="card-body">
                <h5 className="card-title">
                    {props.animal.name}
                </h5>
                <p className="card-text">{props.animal.breed}</p>
                {
                    <Link to={`/animals/${props.animal.id}`}
                          className="card-link">
                        Details
                    </Link>
                }
            </div>
        </div>
    )
}
```

Your list of animals should now look like Bootstrap cards.

Now click on the _Detail_ hyperlink in the first card. It will change the URL in the browser to `http://localhost:3000/animals/1`. Unfortunately, you will also get an error.

![props error](./images/props-error.png)

This is because when you set up the dynamic `<Route>`, it renders the **`Animal`** component directly, instead of **`AnimalList`**, which is where the animal array was established in its state. At this point you have many options to show the details of a single animal, and this is one of the reasons React is difficult to learn, and very hard to master.

It has no opinions.

Here are some options.

1. Render a different component for this specific case. For example, a **`AnimalDetails`** component.
1. Re-use the **`Animal`** component, but refactor the code a bit so that it can accept the data to be expressed in JSX from different sources.
1. Change how the `<Route>` is configured so that `<Link>` state can be passed in a props.
1. Move the `animals` array from being in the state of **`AnimalList`** to being in the state of **`ApplicationViews`** so that it can manipulated in different ways for different views.

I'm going to show you two ways, and talk about the pros and cons of each one.

### Modify Animal to Accept Different Sources

```js
export default props => {
    let animal = {}
    let showLink = false

    if (props.hasOwnProperty("animal")) {
        animal = props.animal
        showLink = true
    } else {
        animal = props.location.state.animal
    }

    return (
        <div className="card" style={{width: `18rem`}}>
            <div className="card-body">
                <h5 className="card-title">
                    {animal.name}
                </h5>
                <p className="card-text">{animal.breed}</p>
                {
                    showLink
                        ? <Link className="card-link"
                            to={{
                                pathname: `/animals/${animal.id}`,
                                state: { animal: animal }
                            }}>
                            Details
                        </Link>
                        : <div></div>
                }
            </div>
        </div>
    )
}
```

### Modify Route to Pass State as Props

```js
<Route path="/animals/:animalId" render={(props) => {
    return <Animal animal={props.location.state.animal} />
}} />
```


## Advanced Challenge: Searching Your Data
