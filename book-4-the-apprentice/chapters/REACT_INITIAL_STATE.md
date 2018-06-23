# Populating React Component State from an API

Up to this point, you have used state data that you hard-coded into your application. Now it's time to implement a more realistic way in which you would retrieve your data. You will request it from you JSON API database.

In React, it works in, what seems like, a counterintuitive way. React must first render the component to the DOM without any data, then you will request the data and re-render the component.

One of the lifecycle methods available to every React component is [componentDidMount](https://reactjs.org/docs/react-component.html#the-component-lifecycle). Straight from their docs (emphasis mine):

> `componentDidMount()` is invoked immediately after a component is mounted. Initialization that requires DOM nodes should go here. _If you need to load data from a remote endpoint, this is a good place to instantiate the network request._

The `componentDidMount()` hook runs after the component output has been rendered to the DOM, so if your component needs API data, that is the place to do it. Here is how you would do it for loading employees.

First empty out your current hard-coded state.

```js
import React, { Component } from "react"


export default class EmployeeList extends Component {
    state = {
        employees: []
    }

    componentDidMount () {
        fetch("http://localhost:5002/employees")
        .then(e => e.json())
        .then(employees => this.setState({ employees: employees }))
    }

    render() {
        return (
            <React.Fragment>
                <ul>
                {
                    this.state.employees.map(employee =>
                        <Employee key={employee.id}
                                  employee={employee}>
                            {employee.name}
                        </Employee>
                    )
                }
                </ul>
            </React.Fragment>
        )
    }
}
```

* Note that you need to have a unique `key` property for each item when you use the `map()` array method to display a component representing each data object in the array.


Note that the name of the employee is the text content of the `<Employee>` component. Use `props.children` to extract that text content in the child component.

```js
<h5 className="card-title">
    {props.children}
</h5>
```

If you are going to use content inside the component's opening and closing tags, you need to ensure that you remain consistent. That means that your `<Route>` configuration for employee details would also need to use the same syntax.

```js
<Route path="/employees/:employeeId" render={(props) => {
    return <Employee employee={props.location.state.employee}>
        {props.location.state.employee.name}
    </Employee>
}} />
```

## Resources

* [React App Requests to JSON API](https://www.youtube.com/watch?v=vwWPM7za3Pk&list=PLhScwEnhQ-bmroyHFduwgOZ1KrdDvk_44) video series
* [React for Everyone](https://www.youtube.com/playlist?list=PLLnpHn493BHFfs3Uj5tvx17mXk4B4ws4p) video series

## Practice

Now it's time to take the rest of the data and expose it through an API with `json-server`. Create a `kennel.json` file in your project and add the animals, locations, and employees collections to it.

```json
{
    "animals": [
        {
            "id": 1,
            "name": "Doodles",
            "breed": "German Shepherd"
        }
    ],
    "employees": [ ],
    "locations": [ ]
}
```

Open a new terminal window, and start your API with the following command.

```sh
json-server -p 5002 -w kennel.json
```

Use the example code above to update all of the List components to retrieve their state from the API.

> **Pro tip:** Remember to use your network tab in the Chrom Developer Tools to watch your network requests and preview the responses.

![](./images/QmF1Sd9FOI.gif)
