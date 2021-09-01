# Type Checking and Making Properties Required

JavaScript has no built-in [type system](https://en.wikipedia.org/wiki/Type_system). You have no way of declaring a variable and telling the JavaScript engine that the variable can only hold integers, or strings, or any other value type. Other language do have this feature, like C#.

```cs
public int numberOfApples = 0;
public string farmName = "Applejack Orchards";
public bool openForBusiness = true;
```

In those variable declarations, the `int`, `string` and `bool` keywords are your way, as the developer, to ensure that the number 42 can never be assigned to the `farmName` property. Also, "8 thousand" can never be assigned to `numberOfApples`.

Several tools have been developed by the open source software community to provide a type checking meta language.

Two very popular ones are...

1. [Flow](https://flow.org/) - Built by the team at Facebook.
1. [Typescript](https://www.typescriptlang.org/) - Built by the team at Microsoft.

Before considering the use of those third-party tools, you can use the `prop-types` library to do very simple type checking in a React application.

## Using PropTypes

First, install the [prop-types](https://www.npmjs.com/package/prop-types) package for your application.

For your kennel application, you are going to use this package to ensure that the **`Employee`** component received a property named exactly `employee` and that it is an object, and nothing else. First, it will require you to refactor the component code slightly.

Instead of exporting the function used to render the employee component directly, you are going to name the function and export it after definition.

```js
import React from "react"
import { Link } from "react-router-dom"


// Now defining a named function
const Employee = props => {
    return (
        <div className="card">
            <div className="card-body">
                <h5 className="card-title">
                    {props.children}
                </h5>
                {
                    <Link className="card-link"
                        to={{
                            pathname: `/employees/${props.employee.id}`,
                            state: { employee: props.employee }
                        }}>
                        Details
                    </Link>
                }
            </div>
        </div>
    )
}

// Export the named function reference
export default Employee
```

Next, refactor the function argument to use object destructuring to specify all the keys in `props` that you are expecting. You are currently using the `children` key, and the `employees` key in the `props` object. You can eliminate the need to use the `props` namespace.

```js
const Employee = ({ employee, children }) => {
    ...
}
```

Now you can use those variables directly in the function. Note in the example below that the use of `props` is gone.

```js
import React from "react"
import { Link } from "react-router-dom"


const Employee = ({ employee, children }) => {
    return (
        <div className="card" style={{width: `18rem`}}>
            <div className="card-body">
                <h5 className="card-title">
                    {children}
                </h5>
                {
                    <Link className="card-link"
                        to={{
                            pathname: `/employees/${employee.id}`,
                            state: { employee: employee }
                        }}>
                        Details
                    </Link>
                }
            </div>
        </div>
    )
}

export default Employee
```

Now you can use the `prop-types` library to ensure that the employee variable always exists, and that is it always an object.

* On line 2, note that the `prop-types` library is imported.
* Near the bottom is the configuration for ensuring that the `employee` is an object, and that it is required.

Read [all about PropTypes](https://reactjs.org/docs/typechecking-with-proptypes.html) on the ReactJS site.

```js
import React from "react"
import PropTypes from "prop-types"
import { Link } from "react-router-dom"


const Employee = ({ employee, children }) => {
    return (
        <div className="card" style={{width: `18rem`}}>
            <div className="card-body">
                <h5 className="card-title">
                    {children}
                </h5>
                {
                    <Link className="card-link"
                        to={{
                            pathname: `/employees/${employee.id}`,
                            state: { employee: employee }
                        }}>
                        Details
                    </Link>
                }
            </div>
        </div>
    )
}

Employee.propTypes = {
    // This rule ensures that `employee` is passed a property
    // and that is an object - not a string or number
    employee: PropTypes.object.isRequired
}

export default Employee
```

### Exceptions for Type Checking

Update your type checking configuration to add a property you know is not being passed down from employee list, like `foo`.

```js
Employee.propTypes = {
    employee: PropTypes.object,
    foo: PropTypes.string.isRequired
}
```

Once your application reloads, you will see what a type checking error looks like in the dev console.

```
> Warning: Failed prop type: The prop `foo` is marked as required in `Employee`, but its value is `undefined`.
    in Employee (at EmployeeList.js:21)
    in EmployeeList (created by Route)
    in Route (at ApplicationViews.js:34)
    in ApplicationViews (at KennelCompany.js:15)
    in KennelCompany (at index.js:11)
    in Router (created by BrowserRouter)
    in BrowserRouter (at index.js:10)
```

## Practice Exercise: Type Check your Application

Examine each of the components in your application, and use PropTypes to validate the type of each property that you are using in that component.

## Advanced Exercise: Validating Object Properties

Search the [docs for prop-types](https://github.com/facebook/prop-types) for the text "shape". Then, based on what you find, update the validation for properties that are objects - like the `employee` property in the example code above - to ensure that each property value that you are using on the object are of the correct type.

With the `employee` object:

1. Validate that the `id` property is an integer
1. Validate that the `name` property is a string

## Challenge: Custom Validation

For each component that represents an employee, animal, or location, write custom validators for the following conditions.

1. The `id` property must be greater than 0.
1. The `name` property must have at least 2 characters in it.

Add a species property to your animals.

```json
{
    "id": 7,
    "name": "Jarvis",
    "breed": "Siamese",
    "species": "Cat"
}
```

Verify that the `species` property exists on each animal object, and that its value is one of the following. Otherwise, throw an error.

* Dog
* Cat
* Pig
* Ferret

> **Search Tip:** react proptype custom validation