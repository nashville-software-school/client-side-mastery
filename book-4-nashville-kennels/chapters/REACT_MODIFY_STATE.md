# Modifying State in React

An important concept to keep in mind is that when you write a React component, your JSX structure is simply an HTML representation of state. In essense, the component expresses its internal data **as** HTML.

When the state changes, then the HTML representation will be immediately updated since there is new data to express.

React components respond to changes in state. Any detected change in any value will cause the component to be rendered again. A fancy phrase for this is [_state transition_](https://en.wikipedia.org/wiki/State_diagram).

`State A -> Event -> State B`

That event could be myriad things.

1. The user filled out a form and clicked the submit button
1. The user moved an element on the DOM
1. The user clicked a checkbox
1. An XHR completed and acquired new data from an API
1. The user pressed enter in an input field
1. The user selected an option in a dropdown

The method you will use to initiate the state transition is `setState()`.

Now the `render()` method is using the current state of the component to render the value of the `h2` element. Now to change the state of the component. By adding a button and responding to the click event, the `setState()` method can be used to trigger a render cycle on the component.

```js
class Rachel extends Component {
    constructor (props) {
        /*
            This is needed to properly initialize a React
            component if you define a constructor
        */
        super(props)

        // Set the initial state of the component
        this.state = {
            firstName: "Rachel",
            lastName: "Morgan"
        }
    }

    convertToUpperCase = (event) {
        /*
            Create a new object that holds the upper cased
            version of your name
        */
        const upperCased = {
            firstName: this.state.firstName.toUpperCase(),
            lastName: this.state.lastName.toUpperCase()
        }

        /*
            Initiate the state transition - which invokes render()
        */
        this.setState(upperCased)

    }.bind(this) // Necessary evil to bind the component to the event

    render () {
        return (
            <article>
                <h2>{this.state.firstName} {this.state.lastName}</h2>
                <button onClick={this.convertToUpperCase}>
                    Change to Uppercase
                </button>
            </article>
        )
    }
}
```

## Practice

You're going to update your application that represents you to use state and props. Previously, you hard-coded the following information into your components.

1. Your full name
1. Your cohort
1. Your home address
1. The make and model of your favorite vehicle
1. The name, and species/breed of your favorite, or ideal, pet

Now you need to pull all of that data that is scattered across your component files, and give your personal component an initial state with appropriate properties.

```js
import React, { Component } from 'react'
import Home from "./Home"  // Import the Home component


class Me extends Component {
    constructor (props) {
        super(props)

        // Put all information about yourself as state properties
        this.state = {
            firstName: "Rachel",
            lastName: "Morgan"
        }
    }

    // Update your JSX to use state properties
    render() {
        return (
            <div>
                <h3>{this.state.firstName} {this.state.lastName}</h3>
                <h4>Evening Cohort 1</h4>
                <h5>Nashville Software School</h5>
                <Home />
            </div>
        );
    }
}

export default Me
```

Now, pass the state values from your personal component to each of its children, and use those props in the children components.

