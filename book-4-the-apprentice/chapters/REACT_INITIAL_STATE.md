# Populating React Component State from an API

One of the lifecycle methods available to every React component is [componentDidMount](https://reactjs.org/docs/react-component.html#the-component-lifecycle). Straight from their docs (emphasis mine):

> `componentDidMount()` is invoked immediately after a component is mounted. Initialization that requires DOM nodes should go here. _If you need to load data from a remote endpoint, this is a good place to instantiate the network request._

The `componentDidMount()` hook runs after the component output has been rendered to the DOM, so if your component needs API data, that is the place to do it. Here's an example.


```js
import React, { Component } from "react"
import Home from "./Home";
import Car from "./Car";
import Pet from "./Pet";
import "./styles/hannah.css"


class Hannah extends Component {
    /*
        You can reduce the amount of code you need to write
        when defining initial state for your component.
        Eliminate your `constructor` method and just define
        a state variable.
    */
    state = {
        firstName: "",
        lastName: "",
        occupation: "",
        address: {},
        car: {},
        pet: {}
    }


    /*
        Get all contacts from the API. This is the fetch
        syntax which replaces $.ajax()

        https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch
    */
    loadMyInfo () {
        fetch("http://localhost:5000/people/1")
            // Must be explicit on how to parse the response
            .then(r => r.json())

            // JSON parsed data comes to this then()
            .then(hannah => {
                this.setState(hannah)
            })
    }

    componentDidMount() {
        this.loadMyInfo()  // Trigger the loading of information
    }

    render() {
        return (
            <div className="kittyPurry">
                <h3>{this.state.firstName} {this.state.lastName}</h3>
                <h4>{this.state.occupation}</h4>
                <h5>{this.state.fame}</h5>
                <Home address={this.state.address} />
                <Car car={this.state.car} />
                <Pet pet={this.state.pet} />
            </div>
        )
    }
}

export default Hannah
```

## Resources

* [React App Requests to JSON API](https://www.youtube.com/watch?v=vwWPM7za3Pk&list=PLhScwEnhQ-bmroyHFduwgOZ1KrdDvk_44) video series
* [React for Everyone](https://www.youtube.com/playlist?list=PLLnpHn493BHFfs3Uj5tvx17mXk4B4ws4p) video series

## Practice

Now it's time to take your personal data and expose it through an API with `json-server`. Create a `personal.json` file in your project with a `people` collection. Put your information in that collection.

```json
{
    "people": [
        {
            // Your properties go here
        }
    ]
}
```

Start your API with the following command.

```sh
json-server -p 8088 -w personal.json
```

Update your personal component to retrieve the information from the API, and when it is received, update the state of your component.

## Part Deux

Create multiple collections in your API.

1. Bio info (name and address)
1. Car information
1. Pet information

Use foreign keys to assign cars and pets to a person.

Once that's done, update your `componentDidMount` function to load all the related data, and use `setState` when each response comes back.
