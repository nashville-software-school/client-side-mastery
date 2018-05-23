# React Component State and Props

## State

State is simply the current values of the properties used to render a component. Your brain will try to make it more complex than that, so remember this statement.

> State is simply the current values of the properties used to render a component.

React components respond to changes in state. Any detected change in any value will cause the component to be rendered again. A fancy phrase for this is [_state transition_](https://en.wikipedia.org/wiki/State_diagram).

`State A -> Event -> State B`

That event could be myriad things.

1. The user filled out a form and clicked the submit button
1. The user moved an element on the DOM
1. The user clicked a checkbox
1. An XHR completed and acquired new data from an API
1. The user pressed enter in an input field
1. The user selected an option in a dropdown

etc...

The method you will use to initiate the state transition is `setState()`. You initialize state by defining `this.state` in the component's constructor. Let's take a look.

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

    render () {
        return (
            <article>
                <h2>{this.state.firstName} {this.state.lastName}</h2>
            </article>
        )
    }
}
```

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

## Props

Passing state values from one component to another is a fundamental part of React. You are used to passing values around as function arguments.

```js
const bio = (firstName, lastName, occupation, info) => {
    return `
        ${firstName} ${lastName}

        Currently working as a ${occupation}

        ${info}
    `
}

const hannahBio = bio("Hannah", "Hall", "Software Engineer", "Graduated NSS in cohort 13. Junior instructor as NSS for one year. Now kicking ass professionally.")
```

Since React is all components written as JSX, which itself is mimic of HTML, we pass values as element attributes.

> Bio.js

```js
import React, { Component } from 'react'


/*
    Bio itself has no state since the Hannah component
    will be sending it all the data it needs as props
*/
class Bio extends Component {
    render() {
        return (
            <div>
                <p>Occupation: {this.props.occupation}</p>
                <p>Bio: {this.props.bio}</p>
            </div>
        )
    }
}


export default Bio
```

> Hannah.js

```js
import React, { Component } from 'react'
import Bio from "./Bio"


class Hannah extends Component {
    constructor (props) {
        /*
            This is needed to properly initialize a React
            component if you define a constructor
        */
        super(props)

        // Set the initial state of the component
        this.state = {
            firstName: "Hannah",
            lastName: "Hall",
            occupation: "Software Engineer",
            bio: "Graduated NSS in cohort 13. Junior instructor as NSS for one year. Now kicking ass professionally."
        }
    }

    // Occupation and bio now sent to Bio as properties
    render() {
        return (
            <article>
                <h2>{this.state.firstName} {this.state.lastName}</h2>
                <Bio occupation={this.state.occupation} bio={this.state.bio} />
                </button>
            </article>
        )
    }
}

export default Hannah
```








