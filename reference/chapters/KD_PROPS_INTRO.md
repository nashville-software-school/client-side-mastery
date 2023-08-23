# One Way Relationship

State and functions can flow down, but they can't flow back up, nor can it be accessed by siblings. If you want a parent component to be able to react to changes, or access values, that are produced in a child component, you must provide the child with a function that is defined in the parent.

Here's an example.

### Bad Design

Imagine that you want your app to have a dark mode and a light mode. There are two radio buttons in the **Sidebar** component that the user can choose.

```jsx
export const Sidebar = () => {
    const [ chosenMode, changeChosenMode ] = useState("")

    return <>
        <h2>Choose Theme</h2>
        <div>
            <input type="radio"
                onChange={() => changeChosenMode("dark")}
                name="mode" /> Dark Mode
        </div>

        <div>
            <input type="radio"
                onChange={() => changeChosenMode("dark")}
                name="mode" /> Light Mode
        </div>
    </>
}
```

Now imagine that you want the parent component to access that state in the child component.

```jsx
export const Layout = () => {
    return <>
        <h1>Welcome to my project</h1>
        <h2>You are currently using {chosenMode}</h2>
        <Sidebar />
    </>
}
```

This is not possible. Each component function has its own scope. Therefore, `chosenMode` is only available in the scope of the **Sidebar** function. If you want a display state in a parent component that can be changed in a child component, the state has to be defined in the parent, and the setter function is passed to the child as what is commonly referred to as a prop.

Beginner struggle with props. They are somehwat analagous to arguments and parameters for functions, but it is not exactly the same.

## Passing Props

Define the state in the parent **Layout** function. Pass the setter function to the child.

```jsx
export const Layout = () => {
    const [ chosenMode, changeChosenMode ] = useState("")

    return <>
        <h1>Welcome to my project</h1>
        <h2>You are currently using {chosenMode}</h2>

        <Sidebar modeFunction={changeChosenMode} />
    </>
}
```

All values that the parent passes to the child are coalesced into a single object. In the example above, it appears as if you are passing a function to the child, but React actually passes an object that looks like this.

```js
{
    modeFunction: function changeChosenMode() { ... }
}
```

Therefore, the child can deconstruct that object. Notice in the example below that the key of `modeFunction` is surrounded by curly braces. That syntax extracts the `modeFunction` key from the object that was passed from the parent component.

Since the value of `modeFunction` is a function, that is what gets invoked in the `onChange` event for each radio button.

```jsx
export const Sidebar = ({ modeFunction }) => {

    return <>
        <h2>Choose Theme</h2>
        <div>
            <input type="radio"
                onChange={() => modeFunction("dark")}
                name="mode" /> Dark Mode
        </div>

        <div>
            <input type="radio"
                onChange={() => modeFunction("dark")}
                name="mode" /> Light Mode
        </div>
    </>
}
```