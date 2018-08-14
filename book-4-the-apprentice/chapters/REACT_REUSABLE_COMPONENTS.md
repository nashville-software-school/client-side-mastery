# The Power of Components

Now that you've seen the core mechanisms of a React application, it's time to consider the purpose of React, or any other component-based tool like Polymer, Vue, and Angular - reusability.

## Reusability Scenario

Right now, the only place that you're rendering the basic animal card is in the **`AnimalList`** component. What you're going to do is refactor your application so that you can view the animal card in two places, using the same component.

1. In the animal list.
1. In the employee list. For each employee card, you will then show which animals are assigned to the employee using the animal card.

## AnimalCard Component

```js
import React, { Component } from "react"
import { Link } from "react-router-dom"
import dog from "./DogIcon.png"
import "./Animal.css"

export default class AnimalCard extends Component {
    render() {
        return (
            <div key={this.props.animal.id} className="card">
                <div className="card-body">
                    <h5 className="card-title">
                        <img src={dog} className="icon--dog" />
                        {this.props.animal.name}
                        <Link className="nav-link" to={`/animals/${this.props.animal.id}`}>Details</Link>
                        <a href="#"
                            onClick={() => this.props.deleteAnimal(this.props.animal.id)}
                            className="card-link">Discharge</a>
                    </h5>
                </div>
            </div>
        )
    }
}
```

## Refactor AnimalList

```js
import React, { Component } from "react"
import "./Animal.css"
import AnimalCard from "./AnimalCard"

export default class AnimalList extends Component {
    render () {
        return (
            <React.Fragment>
                <div className="animalButton">
                    <button type="button"
                            onClick={()=> this.props.history.push("/animals/new")}
                            className="btn btn-success">
                        Admit Animal
                    </button>
                </div>
                <section className="animals">
                {
                    this.props.animals.map(animal =>
                        <AnimalCard key={animal.id} animal={animal} {...this.props} />
                    )
                }
                </section>
            </React.Fragment>
        )
    }
}
```

## Update EmployeeList Route

Update the route to pass the list of animals to **`EmployeeList`** so that it can be filtered for each employee.

```js
<Route exact path="/employees" render={props => {
    if (this.isAuthenticated()) {
        return <EmployeeList deleteEmployee={this.deleteEmployee}
                                animals={this.state.animals}
                                employees={this.state.employees} />
    } else {
        return <Redirect to="/login" />
    }
}} />
```

## Refactor EmployeeList

```js
import React, { Component } from "react"
import person from "./person.png"
import "./Employee.css"
import AnimalCard from "../animal/AnimalCard"


export default class EmployeeList extends Component {
    render () {
        return (
            <section className="employees">
            {
                this.props.employees.map(employee =>
                    <div key={employee.id} className="card card--employee">
                        <div className="card-body">
                            <h5 className="card-title">
                                <img src={person} className="icon--employee" />
                                {employee.name}
                            <a href="#"
                                onClick={() => this.props.deleteEmployee(employee.id)}
                                className="card-link">Delete</a>
                            </h5>

                            <h6 class="card-subtitle mb-2 text-muted">Caretaker For</h6>
                            <div className="animals--caretaker">
                            {
                                this.props.animals
                                    .filter(anml => anml.employeeId === employee.id)
                                    .map(anml => <AnimalCard key={anml.id} animal={anml} {...this.props} />)
                            }
                            </div>

                        </div>
                    </div>
                )
            }
            </section>
        )
    }
}
```

## Practice: Employees per Location

1. Modify your API data so that employees have a `locationId` property designating at which location they work.
1. Update the route for the location list so that the employee collection is passed to the child component.
1. For each location, display the employees that are working there.
