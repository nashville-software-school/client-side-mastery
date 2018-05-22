# React Component State and Props

## State

State is simply the current values of the properties used to render a component. Your brain will try to make it more complex than that, so remember this statement.

> State is simply the current values of the properties used to render a component.

React components respond to changes in state. Any detected change in any value will cause the component to be rendered again. A fancy word for this is [_state transition_](https://en.wikipedia.org/wiki/State_diagram).

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

        // Necessary evil to bind the component to the event
        this.convertToUpperCase = this.convertToUpperCase.bind(this)
    }

    convertToUpperCase = function (event) {
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
    }

    render () {
        return (
            <article>
                <h2>{this.state.firstName} {this.state.lastName}</h2>
                <button onClick={this.convertToUpperCase}>Change to Uppercase</button>
            </article>
        )
    }
}
```

## Props









