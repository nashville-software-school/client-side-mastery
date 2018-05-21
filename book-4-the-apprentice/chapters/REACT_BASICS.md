# React

React is a library that was open sourced by the development team at Facebook with the sole purpose of managing how data is displayed to the user. It doesn't care about the database, it doesn't care how data is retrieved, and doesn't care about how complex the rest of the application is.

You've already learned the vast majority of what React does for you when building the UI for your application.

1. Building components and child components
1. Modular code with Browserify modules
1. Updating the DOM with document fragments and appendChild
1. Setting the state of a component

## Key Terms

1. **JSX** — Allows us to write HTML like syntax which gets
transformed to lightweightJavaScript objects.

1. **render** (method) — Describes what the UI will look like for the particular component.

1. **Virtual DOM** — A JavaScript representation of the actual DOM.

1. **state** — The internal data store (object) of a component.

1. **setState** — A helper method used for updating the state of a component and re-rendering the UI

1. **React.Component** — The way in which you create a new component.

1. **ReactDOM.render** — Renders a React component to a DOM node.

1. **constructor** (this.state) - The way in which you establish the initial state of a component.

1. **props** — The data which is passed to the child component from the parent component.

1. **propTypes** — Allows you to control the presence, or types of certain props passed to the child component.

1. **defaultProps** — Allows you to set default props for your component.

## Component LifeCycle

1. **componentDidMount** — Fired after the component mounted
1. **componentWillUnmount** — Fired before the component will unmount
1. **getDerivedStateFromProps** - Fired when the component mounts and whenever the props change. Used to update the state of a component when its props change

## Common Events

1. onClick
1. onSubmit
1. onChange

## Getting Started with create-react-app

Visit the [create-react-app](https://github.com/facebook/create-react-app/) Github repo and follow the instructions for getting yourself set up with a simple React application.

## Resources

1. [A Comprehensive Guide to learning React.js in 2018
](https://tylermcginnis.com/reactjs-tutorial-a-comprehensive-guide-to-building-apps-with-react/)
### What is React?
- https://github.com/learn-co-students/javascript-virtual-dom-v-000
- https://github.com/learn-co-students/react-declarative-programming-v-000
- https://github.com/learn-co-students/react-create-element-v-000
- https://github.com/learn-co-students/react-create-element-lab-v-000

### Rendering
- https://github.com/learn-co-students/react-components-v-000
- https://github.com/learn-co-students/react-components-lab-v-000
- https://github.com/learn-co-students/react-jsx-v-000
- https://github.com/learn-co-students/react-jsx-lab-v-000
- https://github.com/learn-co-students/react-babel-plugins-v-000

### Props
- https://github.com/learn-co-students/react-props-v-000
- https://github.com/learn-co-students/react-props-lab-v-000
- https://github.com/learn-co-students/react-prop-types-v-000
- https://github.com/learn-co-students/react-prop-types-lab-v-000
- https://github.com/learn-co-students/react-this-props-children-v-000
- https://github.com/learn-co-students/react-this-props-children-lab-v-000

### State and Events
- https://github.com/learn-co-students/react-initial-state-v-000
- https://github.com/learn-co-students/react-initial-state-lab-v-000
- https://github.com/learn-co-students/react-event-system-v-000
- https://github.com/learn-co-students/react-event-system-lab-v-000
- https://github.com/learn-co-students/react-events-in-detail-v-000
- https://github.com/learn-co-students/react-events-in-detail-lab-v-000
- https://github.com/learn-co-students/react-updating-state-v-000
- https://github.com/learn-co-students/react-updating-state-lab-v-000
- https://github.com/learn-co-students/react-forms-v-000
- https://github.com/learn-co-students/react-forms-lab-v-000
- https://github.com/learn-co-students/react-props-and-state-lab-v-000

### Mounting
- https://github.com/learn-co-students/react-component-lifecycle-v-000
- https://github.com/learn-co-students/react-component-mounting-and-unmounting-v-000
- https://github.com/learn-co-students/react-component-mounting-and-unmounting-lab-v-000

### Rendering and Updating
- https://github.com/learn-co-students/react-rendering-v-000
- https://github.com/itzsaga/react-rendering-lab-v-000
- https://github.com/itzsaga/react-component-lifecycle-lab-v-000

### Container Components
- https://github.com/learn-co-students/react-container-components-v-000
- https://github.com/learn-co-students/react-container-components-lab-v-000

### Presentational Components
- https://github.com/learn-co-students/react-presentation-components-v-000
- https://github.com/learn-co-students/react-presentation-components-lab-v-000
- https://github.com/learn-co-students/props-props-props-props-props-props-v-000
- https://github.com/learn-co-students/react-passing-props-lab-v-000