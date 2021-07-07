# Making Generic, Reusable Components

In your Kennel application, you have two types of very similar components.

The list components.

1. LocationList
1. EmployeeList
1. AnimalList

The presentation components.

1. Animal
1. Location
1. Employee

Each components in these sets are largely identical. This is an opportunity to make your components for generic. You will start with the presentation components. You will be making sure that each object, regardless of its type will be presented in the same way, and reuse the same code. This reduces your application's file count, and ensures consistency as your application grows.

This is how your **`Animal`** component looks now.

```js
import React from "react"
import { Link } from "react-router-dom"


const Animal = props => {
    return (
        <div className="card" style={{width: `18rem`}}>
            <div className="card-body">
                <h5 className="card-title">
                    {props.animal.name}
                </h5>
                <p className="card-text">{props.animal.breed}</p>
                {
                    <Link className="card-link"
                        to={{
                            pathname: `/animals/${props.animal.id}`,
                            state: { animal: props.animal }
                        }}>
                        Details
                    </Link>
                }
            </div>
        </div>
    )
}

export default Animal
```

Time to make it more generic to be used with both employee objects and location objects since the HTML representations are identical, and the only difference is the property being used.

```js
import React from "react"
import { Link } from "react-router-dom"

/*
    Now using object destructuring to pull out the individual
    keys in the `props` object that gets passed to this
    component.

    https://tylermcginnis.com/videos/object-array-destructuring/
*/
const DetailCard = ({id, name, resource, addlInfo}) => {
    return (
        <div className="card" style={{width: `18rem`}}>
            <div className="card-body">
                <h5 className="card-title">
                    {name}
                </h5>
                <p className="card-text">{addlInfo ? addlInfo : ""}</p>
                {
                    <Link className="card-link"
                        to={{
                            pathname: `/${resource}/${id}`,
                            state: {
                                id: id,
                                name: name,
                                resource: resource,
                                addlInfo: addlInfo
                            }
                        }}>
                        Details
                    </Link>
                }
            </div>
        </div>
    )
}

export default DetailCard
```

Now all of the list components can use the new **`DetailCard`** component. Now your development team has one component that can be reused to display the details of any resource, instead of having three separate components to maintain.

Here is each one rewritten to use the new `<DetailCard>` component.

> LocationList.js

```js
import React, { Component } from "react"
import DetailCard from "./DetailCard";


export default class LocationList extends Component {
    state = { locations: [] }

    componentDidMount () {
        fetch("http://localhost:5002/locations")
        .then(e => e.json())
        .then(locations => this.setState({ locations: locations }))
    }

    render() {
        return (
            <React.Fragment>
                <ul>
                {
                    this.state.locations.map(location =>
                        <DetailCard id={location.id}
                            name={location.name}
                            resource="locations" />
                    )
                }
                </ul>
            </React.Fragment>
        )
    }
}
```

> EmployeeList.js

```js
import React, { Component } from "react"
import DetailCard from "./DetailCard";


export default class EmployeeList extends Component {
    state = { employees: [] }

    componentDidMount () {
        fetch("http://localhost:5002/employees")
        .then(e => e.json())
        .then(employees => this.setState({ employees: employees }))
    }

    render() {
        return (
            <React.Fragment>
                {
                    this.state.employees.map(employee =>
                        <DetailCard id={employee.id}
                                    name={employee.name}
                                    resource="employees" />
                    )
                }
            </React.Fragment>
        )
    }
}
```

> AnimalList.js

```js
import React, { Component } from "react"
import DetailCard from "./DetailCard";


export default class AnimalList extends Component {
    state = { animals: [] }

    componentDidMount () {
        fetch("http://localhost:5002/animals")
        .then(e => e.json())
        .then(animals => this.setState({ animals: animals }))
    }

    render() {
        return (
            <React.Fragment>
                {
                    this.state.animals.map(animal =>
                        <DetailCard id={animal.id}
                                    name={animal.name}
                                    resource="animals"
                                    addlInfo={animal.breed} />
                    )
                }
            </React.Fragment>
        )
    }
}
```

## Advanced Challenge: Reusable List Component

If you examine your three list components now, you will immediately notice that all three of them are nearly identical. This is another opportunity for you to write a general, reusable component named **`ResourceList`**.

See if you can make a single component that replaces **`AnimalList`**, **`EmployeeList`**, and **`LocationList`**.
